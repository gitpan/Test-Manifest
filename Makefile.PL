# $Id: Makefile.PL,v 1.4 2002/10/10 04:19:16 comdog Exp $
use ExtUtils::MakeMaker;

WriteMakefile
        (
        'NAME'          => 'Test::Manifest',
        'VERSION_FROM'  => 'lib/Manifest.pm',
        
		'PREREQ_PM' => {
			'Test::More'       => '0',
			},
			
        'PM'       => 
        	{
            'lib/Manifest.pm'  => '$(INST_LIBDIR)/Manifest.pm',
            },
            
        clean => { FILES => 'Test-Manifest-* t/test_manifest' },
        );
