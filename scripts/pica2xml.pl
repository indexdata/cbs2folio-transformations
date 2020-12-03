#!/usr/bin/perl

# Run from project root directory (eg. ./scripts/pica2xmlbulk.pl)

use strict;
use warnings;
use XML::LibXML;
use Config::Tiny;
use utf8;

# binmode(STDOUT, 'utf8');

my $pfile = shift or die "Usage: ./pica2xmlbulk.pl <pp file> [ <collection size> ]\n";
my $limit = shift || 1000;

my $confdir = 'confdir';
my $conf = Config::Tiny->read("$confdir/other.ini");
my $ouf_conf = Config::Tiny->read("$confdir/ouf.ini");

my $savedir = $pfile;
$savedir =~ s/^(.+)\/.*/$1/;

my $xmldir = $conf->{dir}->{xml} || $savedir;

open PP, $pfile or die "Can't open Pica plus file!";
my $sfile = $pfile;
$sfile =~ s/^.+\///;

my $mdirs = $ENV{OUF_DIR_COUNT} || $conf->{migrate}->{dir_count} || 1;
for (my $x = 0; $x < $mdirs; $x++) {
  print "Creating directory $xmldir/m$x\n";
  mkdir "$xmldir/m$x"
}

# Set the record separator to oct 035 (ASCII 29)
$/ = "\035";

my $doc;
my $root;

my $total = 0;
my $count;
my $part = 0;
my $dircount = 0;

while (<PP>) {
  chomp;
  next unless $_;
  if ($total % $limit == 0) {
    if ($total > 0) {
      &save_xml;
    }
    print "Working...\n";
    $doc = XML::LibXML::Document->new('1.0', 'utf-8');
    $root = $doc->createElement('collection');
    $doc->setDocumentElement($root);
    $count = 0;
  }
  my $rawrecord = $_;
  my $section;
  my $header;
  my $metadata;
  my $sectiontype;
  my $ppn;
  my $epn;

  my $record = $doc->createElement('record');
  my $status = 'upsert';
  my $item;
  my $pre_occurrence = 'x';
  foreach (split /\036/, $rawrecord) {
    s/\n//;
    next unless $_;
    if (!$header) {
      $header = $doc->createElement('header');
      $record->appendChild($header);
      $metadata = $doc->createElement('metadata');
      $record->appendChild($metadata);
    }
    if (/^([^\/ ]+)(\/(\d+))? (\037.*)$/) {
      my $tag = $1;
      my $occurrence = $3;
      my $fielddata = $4;
      if ($tag =~ /^2/ && $occurrence ne $pre_occurrence) {
        $item = $doc->createElement('item');
        $metadata->appendChild($item);
        $pre_occurrence = $occurrence;
      }
      my $fulltag = $tag;
      if ($occurrence) { $fulltag .= "/" . $occurrence; }
      my $fld = $doc->createElement('datafield');
      $fld->setAttribute('tag' => $tag);
      if ($occurrence) {
        $fld->setAttribute('occurrence' => $occurrence);
      }
      $fld->setAttribute('fulltag' => $fulltag);
      if ($tag =~ /^2/) {
        $item->appendChild($fld);
      } else {
        $metadata->appendChild($fld);
      }
      my @subs = ($fielddata =~ /\037(.)([^\037]+)/g);
      if ($tag eq '003@') {
        $ppn = $subs[1];
      } elsif ($tag eq '203@') {
        $epn = $subs[1];
        $item->setAttribute('epn' => $epn);
      }
      my $sfi = 0;
      while (defined($subs[$sfi])) {
        my $subfieldcode = $subs[$sfi++];
        my $txt = $subs[$sfi++];
        $txt =~ s/\$\w/ /g if $subfieldcode eq '8';
        if ($txt !~ /^\s*$/) {
          my $sf = $doc->createElement('subfield');
          $sf->setAttribute('code' => $subfieldcode);
          $fld->appendChild($sf);
          $sf->appendTextNode($txt);
        }
      }
    } 
  }

  my $id_node = $doc->createElement('identifier');
  $id_node->appendTextNode($ppn);
  $header->appendChild($id_node);
  $header->setAttribute('status' => $status);
  $root->appendChild($record);
  $total++;
  $count++;
  if (eof) {
    &save_xml;
  }
}

sub save_xml {
  $part++;
  my $dpart = $dircount % $mdirs;
  $dircount++;
  my $sect = sprintf("%07d", $part);
  my $xout = "$xmldir/m$dpart/$sfile.$sect.xml";
  $root->setAttribute('count' => $count);
  print "Writing $count records to $xout\n";
  open XMLOUT, ">$xout" or die "ERROR Can't write to $xout";
  print XMLOUT $doc->toString(2);
  close XMLOUT;
}
