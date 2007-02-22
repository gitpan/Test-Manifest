# $Id: 0.load.t 1376 2004-09-02 20:56:40Z comdog $

use Test::More tests => 1;

print "bail out! Test::Manifest could not compile.\n"
	unless use_ok( "Test::Manifest" );
