use strict;

use Test::More tests => 13;

use File::Copy qw(copy);
use File::Spec;

use Test::Manifest qw(get_t_files manifest_name);

copy( 'test_manifest', manifest_name() );

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
my $expected = join " ", map { File::Spec->catfile( "t", $_ ) } qw(
		00load.t 01get_test_files.t 01make_test_manifest.t
		leading_space.t trailing_space.t
		);

my @tests = split /\s+/, $expected;

my $string = get_t_files();

is( $string, $expected, "Single string version of tests is right" );

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
my @array = get_t_files();

foreach my $i ( 0 .. $#array )
	{
	is( $array[$i], $tests[$i], "Test file $i has expected name" );
	}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
{
local $SIG{__WARN__} = sub { 1 };

if( $^O eq 'VMS' ) 	# http://perldoc.perl.org/perlvms.html#unlink-LIST
	{
	1 while ( unlink manifest_name() );
	} 
else 
	{
	unlink manifest_name();
	}

-e manifest_name() ? 
	fail( "test_manifest still around after unlink!") :
	pass( "test_manifest unlinked") ;

my $string = get_t_files();

ok( ! $string, "Nothing returned when test_manifest does not exist (scalar)" );

my @array = get_t_files();

ok( ! $string, "Nothing returned when test_manifest does not exist (list)" );
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
{
local $Test::Harness::verbose = 1;
copy( 'test_manifest_levels', manifest_name() );

my @expected = ( [] );
$expected[1] = [ qw( 00load.t 01get_test_files.t pod_coverage.t) ];
$expected[2] = [ qw( 00load.t 01get_test_files.t 01make_test_manifest.t 
	pod_coverage.t ) ];
$expected[3] = [ qw( 00load.t 01get_test_files.t 01make_test_manifest.t 
	leading_space.t pod_coverage.t trailing_space.t ) ];
$expected[0] = [ qw( 00load.t 01get_test_files.t 01make_test_manifest.t 
	leading_space.t pod_coverage.t trailing_space.t 99pod.t ) ];
	
foreach my $level ( 0 .. 3 )
	{
	my $string = get_t_files( $level );
	my $expected = join ' ', map { File::Spec->catfile( 't', $_ ) } 
		@{ $expected[$level] };
	is( $string, $expected, "Level $level version of tests is right" );
	}

}
