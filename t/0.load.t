# $Id: 0.load.t,v 1.3 2002/10/10 04:19:16 comdog Exp $

use lib qw(./blib/lib);

print "1..1\n";

local( $@, $! );

eval <<USE;
package main;
require Test::Manifest;
Test::Manifest->import;
USE

print "bail out! Test::Manifest could not compile.\n$@\n"
	if $@;

print "ok - Test::Manifest compiles\n";
