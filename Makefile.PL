use strict;
use warnings;
use ExtUtils::MakeMaker;

# Normalize version strings like 6.30_02 to 6.3002,
# so that we can do numerical comparisons on it.
my $eumm_version = $ExtUtils::MakeMaker::VERSION;
$eumm_version =~ s/_//;

WriteMakefile(
    NAME                => 'Cookbook',
    AUTHOR              => q{Phin Jensen <phin@zayda.net>},
    VERSION_FROM        => 'lib/Cookbook.pm',
    ABSTRACT            => 'A simple cookbook app',
    ($eumm_version >= 6.3001
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More'                   => 0,
        'YAML'                         => 0,
        'Dancer'                       => 1.3117,
        'Dancer::Plugin::DBIC'         => 0.1802,
        'Dancer::Plugin::Passphrase'   => 2.0.0,
        'Dancer::Plugin::ValidateTiny' => 0.05,
        'DBIx::Class'                  => 0.08250,
        'DBD::Pg'                      => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Cookbook-*' },
);
