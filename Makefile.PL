use strict;
use warnings;

use 5.008001;

use ExtUtils::MakeMaker 6.17;

my %WriteMakefileArgs = (
  "ABSTRACT" => "List prereqs conditional on operating system",
  "AUTHOR" => "David Golden <dagolden\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.17"
  },
  "DISTNAME" => "Dist-Zilla-Plugin-OSPrereqs",
  "LICENSE" => "apache",
  "MIN_PERL_VERSION" => "5.008001",
  "NAME" => "Dist::Zilla::Plugin::OSPrereqs",
  "PREREQ_PM" => {
    "Dist::Zilla::Role::InstallTool" => 0,
    "Dist::Zilla::Role::MetaProvider" => 0,
    "List::Util" => "1.33",
    "Moose" => 0,
    "namespace::autoclean" => 0,
    "strict" => 0,
    "utf8" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Dist::Zilla::Tester" => 0,
    "ExtUtils::MakeMaker" => 0,
    "File::Spec" => 0,
    "JSON" => 2,
    "Params::Util" => 0,
    "Sub::Exporter" => 0,
    "Test::Deep" => 0,
    "Test::More" => "0.88",
    "YAML::Tiny" => 0,
    "lib" => 0
  },
  "VERSION" => "0.008",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Dist::Zilla::Role::InstallTool" => 0,
  "Dist::Zilla::Role::MetaProvider" => 0,
  "Dist::Zilla::Tester" => 0,
  "ExtUtils::MakeMaker" => 0,
  "File::Spec" => 0,
  "JSON" => 2,
  "List::Util" => "1.33",
  "Moose" => 0,
  "Params::Util" => 0,
  "Sub::Exporter" => 0,
  "Test::Deep" => 0,
  "Test::More" => "0.88",
  "YAML::Tiny" => 0,
  "lib" => 0,
  "namespace::autoclean" => 0,
  "strict" => 0,
  "utf8" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);