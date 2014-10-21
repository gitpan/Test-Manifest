# $Id: include.t 1891 2006-08-29 22:28:08Z comdog $
use strict;

use Test::More tests => 4;

use File::Copy qw(copy);
use File::Spec;

use Test::Manifest qw(get_t_files manifest_name);

ok( -e File::Spec->catfile( "t", "include_in_manifest.txt" ), 
	"Found file I'll include in test_manifest" );
ok( -e 'test_manifest_with_include', 
	"Found file that I'll copy to test_manifest" );

copy( 'test_manifest_with_include', manifest_name() );

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
my @expected_tests = map { File::Spec->catfile( "t", $_ ) } qw(
	0.load.t 
	99.pod.t
	1.get_test_files.t
	);
	
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
my $expected = join " ", @expected_tests;

my $string = get_t_files();

is( $string, $expected, "Single string version of tests is right" );

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

my @files = get_t_files();

is_deeply( \@files, \@expected_tests, "Array version of tests is right" );
