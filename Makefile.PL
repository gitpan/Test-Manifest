# $Id: Makefile.PL,v 1.2 2002/08/19 05:20:13 comdog Exp $
use ExtUtils::MakeMaker;

WriteMakefile
        (
        'NAME'     => 'Test::Manifest',
        'VERSION'  => '0.6',
		'PREREQ_PM' => {
			'Text::Diff'       => 0,
			'Test::Pod'        => 0,
			'File::Find::Rule' => 0,
			},
        'PM'       => 
        	{
            'lib/Manifest.pm'  => '$(INST_LIBDIR)/Manifest.pm',
            },
        );
