use strict;
use Module::Build;

Module::Build
  ->new( module_name => "Pod::Coverage",
         license     => 'perl',
         script_files => [ 'bin/pod_cover' ],
         build_requires => {
             'Test::More'       => 0,
         },
         requires    => {
             'Devel::Symdump' => 2.01,
             'Pod::Parser'    => 1.13,
             'Pod::Find'      => 0.21,
         },
         create_makefile_pl => 'traditional',
       )
  ->create_build_script;
