#!/usr/bin/perl -w
use strict;
use Test::More tests => 3;
use lib 't/lib';

BEGIN {
    use_ok( 'Pod::Coverage' );
}

my $obj = new Pod::Coverage package => 'UnicodeHeading';
isa_ok( $obj, 'Pod::Coverage' );
is($obj->coverage, 1, "Wasn't confused by Unicode in the header");
