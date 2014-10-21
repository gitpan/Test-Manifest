# $Id: 01make_test_manifest.t 2478 2008-01-06 20:06:49Z comdog $

use Test::More tests => 2;

use Test::Manifest qw(make_test_manifest);

my $test_manifest = 't/test_manifest';

unlink $test_manifest;
ok( ! -e $test_manifest, 'test_manifest does not exit' );

make_test_manifest();

ok( -e $test_manifest, 'test_manifest exists' );
