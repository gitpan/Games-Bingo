#pod test courtesy of petdance
#http://use.perl.org/comments.pl?sid=18853&cid=28930

# $Id$

use Test::More tests => 5;

BEGIN { use_ok( 'Games::Bingo' ); }
BEGIN { use_ok( 'Games::Bingo::Constants' ); }
BEGIN { use_ok( 'Games::Bingo::Column' ); }
BEGIN { use_ok( 'Games::Bingo::ColumnCollection' ); }
BEGIN { use_ok( 'Games::Bingo::Card' ); }