# $Id: 0.load.t,v 1.2 2002/09/03 18:47:36 comdog Exp $
BEGIN {
	use File::Find::Rule;
	@classes = map { my $x = $_;
		$x =~ s|^blib/lib/||;
		$x =~ s|/|::|g;
		$x =~ s|\.pm$||;
		$x;
		} File::Find::Rule->file()->name( '*.pm' )->in( 'blib/lib' );
	}

use Test::More tests => @classes + 2;
	
foreach my $class ( @classes )
	{
	use_ok( $class );
	}

my( $test_manifest, $in, $out ) = qw(test_manifest);

ok( open( $in, $test_manifest ),        'Open test_manifest' );
ok( open( $out, "> t/$test_manifest" ), 'Create test_manifest' );
				
while( <$in> ) { print $out $_ };
