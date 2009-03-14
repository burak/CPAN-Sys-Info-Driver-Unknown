#!/usr/bin/perl -w
use strict;
use vars qw(%PREREQ %BUILD_REQ);
use ExtUtils::MakeMaker;

do 'PREREQ' or die "Error including PREREQ: $!";

WriteMakefile(
   'NAME'         => 'Sys::Info::Driver::Unknown',
   'VERSION_FROM' => 'lib/Sys/Info/Driver/Unknown.pm',
   'PREREQ_PM'    => { %PREREQ, %BUILD_REQ },
   ($] >= 5.005 ? (
   AUTHOR   => 'Burak Gursoy <burak@cpan.org>',
   ABSTRACT => 'Compatibility layer for Sys::Info',
   ) : ()),
   PL_FILES => {},
);
