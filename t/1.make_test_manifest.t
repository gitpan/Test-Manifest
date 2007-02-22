# $Id: 1.make_test_manifest.t 484 2002-10-10 04:19:16Z comdog $

use Test::More tests => 2;

use Test::Manifest qw(make_test_manifest);

my $test_manifest = 't/test_manifest';

unlink $test_manifest;
ok( ! -e $test_manifest, 'test_manifest does not exit' );

make_test_manifest();

ok( -e $test_manifest, 'test_manifest exists' );
