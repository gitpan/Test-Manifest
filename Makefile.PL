# $Id: Makefile.PL,v 1.6 2002/12/11 06:46:25 comdog Exp $
use ExtUtils::MakeMaker;

WriteMakefile
        (
        'NAME'          => 'Test::Manifest',
        'VERSION_FROM'  => 'lib/Manifest.pm',
        
		'PREREQ_PM' => {
			'Test::More'          => '0',
			'ExtUtils::MakeMaker' => '6.03',
			},
			
        'PM'       => 
        	{
            'lib/Manifest.pm'  => '$(INST_LIBDIR)/Manifest.pm',
            },
          
        'MAN3PODS' =>
        	{
        	'lib/Manifest.pm' => '$(INST_MAN3DIR)/Test::Manifest.3',
        	},
        	
        clean => { FILES => 'Test-Manifest-* t/test_manifest' },
        );
