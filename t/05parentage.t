#!perl -w
use strict;
use lib 't/lib';

use Test::More tests => 3;
use_ok( 'Pod::Coverage::CountParents' );

my $pc = Pod::Coverage::CountParents->new(package => 'Child');

is( $pc->coverage, 1, 'picked up parent docs' );

$pc = Pod::Coverage::CountParents->new(package => 'Sibling');

is( $pc->coverage, 1, 'picked up grandparent docs' );
