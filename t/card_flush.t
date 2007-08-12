#!/usr/bin/perl -w

# $Id: card_flush.t 1869 2007-08-12 15:52:36Z jonasbn $

use strict;
use Test::More tests => 4;

#test 1
use_ok( 'Games::Bingo::Card' );

use Games::Bingo::Constants qw(NUMBER_OF_NUMBERS_IN_CARD);

my $card = Games::Bingo::Card->new();
$card->populate();

is(scalar $card->get_all_numbers(), NUMBER_OF_NUMBERS_IN_CARD);

ok($card->_flush());

is(scalar $card->get_all_numbers(), 0);
