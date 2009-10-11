#!/usr/bin/env perl -w
use strict;
use warnings;
BEGIN { $^O = 'SomeFakeValue' }
use Test::Sys::Info;

driver_ok('Unknown');
