#! /usr/bin/perl

use UUID::Tiny ':std';

my $msg = 'ub.uni-leipzig.de:instance:507325605';

my $uuid_bin = create_uuid(UUID_SHA1, UUID_NS_DNS, $msg);
my $uuid = uuid_to_string($uuid_bin);

print "$uuid\n";