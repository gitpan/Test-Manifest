# $Id: 0.load.t,v 1.4 2004/09/02 20:56:40 comdog Exp $

use Test::More tests => 1;

print "bail out! Test::Manifest could not compile.\n"
	unless use_ok( "Test::Manifest" );
