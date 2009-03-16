#!/usr/bin/env perl -w
use strict;
BEGIN { $^O = 'SomeFakeValue' }
use Test::Sys::Info;

driver_ok('Unknown');
