#!/usr/bin/perl -w

# Reads from pica+ XML file and outputs instance, holdings and item JSON files.

use strict;
use warnings;
use XML::LibXML;
use XML::LibXSLT;
use JSON;
use File::Copy;
use Config::Tiny;
use Data::Dumper;
use UUID::Tiny ':std';

binmode(STDOUT, 'utf8');

my $only_inst = 0;
my $argv_off = 0;
foreach (@ARGV) {
  if (/-i/) {
    $only_inst = 1;
    splice(@ARGV, $argv_off, 1);
  }
  $argv_off++;
}

my ($style_file, $style_file2, @source_files) = @ARGV;
if (! $source_files[0]) {
  die "Usage: ./picaxml2json.pl [OPTIONS: -i (instances only)] <stylesheet1> <stylesheet2> <pica_xml_file>";
}

sub uuid {
  my $msg = shift;
  my $uuid_bin = create_uuid(UUID_SHA1, UUID_NS_DNS, $msg);
  my $uuid = uuid_to_string($uuid_bin);
  return $uuid;
}

my $json = JSON->new->allow_nonref;
my $parser = XML::LibXML->new();
my $xslt = XML::LibXSLT->new();
my $stylesheet = $xslt->parse_stylesheet_file($style_file);
my $stylesheet2 = $xslt->parse_stylesheet_file($style_file2);
   
foreach my $file ( @source_files ) {
  my $path = $file;
  $path =~ s/^(.+)\..*/$1/;
  my $insts_file = $path . "_instances.jsonl";
  my $holds_file = $path . "_holdings.jsonl";
  my $items_file = $path . "_items.jsonl";
  unlink $insts_file, $holds_file, $items_file;
  open INSTS, ">>:encoding(UTF-8)", $insts_file;
  if (!$only_inst) {
    open HOLDS, ">>:encoding(UTF-8)", $holds_file;
    open ITEMS, ">>:encoding(UTF-8)", $items_file;
  }
  my $source_doc = $parser->parse_file($file);
  my $output1 = $stylesheet->transform($source_doc);
  my $dom = $stylesheet2->transform($output1);
  my $ttl = 0;
  foreach my $rec ($dom->findnodes('/collection/record')) {
    $ttl++;
    my $holds = '';
    my $items = '';
    my $hcount = 0;
    my $icount = 0;
    my $recObj = getElements($rec);
    my $inst_id = uuid($recObj->{hrid});
    if (!$only_inst && $recObj->{holdingsRecords}) {
      foreach (@{ $recObj->{holdingsRecords} }) {
        $hcount++;
        my $holds_id = uuid($_->{hrid});
        if ($_->{items}) {
          foreach (@{ $_->{items} }) {
            $icount++;
            $_->{id} = uuid($_->{hrid});
            $_->{holdingsRecordId} = $holds_id;
            $items .= $json->encode($_) . "\n";
          }
          delete $_->{items};
        }
        $_->{id} = $holds_id;
        $_->{instanceId} = $inst_id;
        $holds .= $json->encode($_) . "\n";
      }
    }
    delete $recObj->{holdingsRecords};
    print "#$ttl Processing instanceId $inst_id ($recObj->{hrid})\n";
    $recObj->{id} = $inst_id;
    print INSTS $json->encode($recObj) . "\n";
    if (!$only_inst) {
      print HOLDS $holds;
      print ITEMS $items;
    }
  } 
}

sub getElements {
  my $dom = shift;
  my $out = {};
  foreach my $node ($dom->childNodes()) {
    my $name = $node->nodeName;
    my @cn = $node->childNodes();
    if ($cn[0] && $cn[0]->nodeName eq '#text') {
      $out->{$name} = $cn[0]->textContent;
    } elsif ($cn[0] && $cn[0]->nodeName eq 'arr') {
      $out->{$name} = [];
      foreach my $item ($cn[0]->getChildrenByTagName('i')) {
        my @cn = $item->childNodes();
        if ($cn[0]) {
          if ($cn[0]->nodeName eq '#text') {
            push @{ $out->{$name} }, $cn[0]->textContent;
          } else {
            push @{ $out->{$name} }, getElements($item);
          }
        }
        
      }
    } elsif ($cn[0]) {
      $out->{$name} = {};
      foreach (@cn) {
        my $cname = $_->nodeName();
        $out->{$name}->{$cname} = $_->textContent;
      }
    }
  }
  return $out;
}