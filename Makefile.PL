# $Id: Makefile.PL,v 1.1.1.1 2002/08/18 08:14:29 comdog Exp $
use ExtUtils::MakeMaker;

WriteMakefile
        (
        'NAME'     => 'Test::Manifest',
        'VERSION'  => '0.5',
        'PM'       => 
        	{
            'lib/Manifest.pm'     => '$(INST_LIBDIR)/Manifest.pm',
            },
        );
