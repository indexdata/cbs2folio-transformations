#!/usr/bin/perl
use utf8;

my $xsldir = '../';
my @xslfiles = qw(locations2uuid-iln26 locations2uuid-iln90 pica2instance-new-pre-orchid codes2uuid pica2instance locations2uuid-iln21 pica2instance-new relationships holdings-items);
my $ids = {
  'pica2instance-new' => '10011',
  relationships => '10012',
  'holdings-items' => '10013',
  codes2uuid => '10002',
  'locations2uuid-iln21' => '10004',
  'locations2uuid-iln26' => '10006',
  pica2instance => '10003',
  'pica2instance-new-pre-orchid' => '10014',
  'locations2uuid-iln26' => '10015',
  'locations2uuid-iln90' => '10016',
};

foreach my $file (@xslfiles) {
  my $sql = "INSERT IGNORE INTO `STEP` VALUES ($ids->{$file},'XmlTransformationStep','',NULL,'$file','";
  open IN, "<:encoding(utf8)", "$xsldir/$file.xsl" or die "Can't open xsl file!";
  my $xsl = <IN>;
  while (<IN>) {
    chomp;
    s/$/\\r\\n/;
    s/(['"])/\\$1/g;
    $sql .= $_;
  }
  open OUT, ">:encoding(utf8)", "../sql/$file.sql"; 
  print OUT $sql . "',NULL,'xml','xml',NULL,'','',NULL);\n";
}
