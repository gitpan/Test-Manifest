# $Id: 00load.t 2478 2008-01-06 20:06:49Z comdog $

use Test::More tests => 1;

print "bail out! Test::Manifest could not compile.\n"
	unless use_ok( "Test::Manifest" );
