# $Id: Makefile.PL,v 1.3 2002/09/30 05:56:00 comdog Exp $
use ExtUtils::MakeMaker;

open IN,  'test_manifest';
open OUT, '> t/test_manifest';
while( <IN> ) { print OUT };
close IN;
close OUT;

WriteMakefile
        (
        'NAME'          => 'Test::Manifest',
        'VERSION_FROM'  => 'lib/Manifest.pm',
        
		'PREREQ_PM' => {
			'File::Find::Rule' => '0',
			'Test::Data'       => '0',
			'Test::More'       => '0',
			'Test::Pod'        => '0',
			'Test::Prereq'     => '0',
			'Text::Diff'       => '0',
			},
			
        'PM'       => 
        	{
            'lib/Manifest.pm'  => '$(INST_LIBDIR)/Manifest.pm',
            },
        );
