#!/usr/bin/perl -w
use strict;
use Test::More tests => 5;
use lib 't/lib';
use Pod::Coverage ();
use Pod::Coverage::ExportOnly ();

my $obj = new Pod::Coverage package => 'Trustme';
ok( $obj, 'it instantiated' );
is($obj->coverage, 3/7, "without private or trustme it gets it right");

$obj = new Pod::Coverage package => 'Trustme', private => [qr/^private$/];
is($obj->coverage, 3/6, "with just private it gets it right");

$obj = new Pod::Coverage
    package => 'Trustme',
    private => [qr/^private$/],
    trustme => [qr/u/];
is($obj->coverage, 5/6, "with private and trustme it gets it right");

$obj = new Pod::Coverage
    package => 'Trustme',
    trustme => [qr/u/];
is($obj->coverage, 5/7, "with just trustme it gets it right");

