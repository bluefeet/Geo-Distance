#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use Math::Trig;

BEGIN {
    $ENV{GEO_DISTANCE_PP} = 1;
    use Geo::Distance;
}

# Note that Geo::Distance always wants longitude before latitude.
my %lonlat = (
    zero => [0, 0],
    plus_180 => [180, 0],
    minus_180 => [-180, 0],
    north_pole => [0, 90],
    south_pole => [0, -90],
    london => [-0.1275, 51.5072],
    new_york => [-74.0059, 40.7127],
);

my @tests = (
    [ qw/north_pole south_pole/, pi ],
    [ qw/zero plus_180/, pi ],
    [ qw/zero zero/, 0 ],
    [ qw/plus_180 minus_180/, 0 ], # Same point
    [ qw/london new_york/, 0.874313181408859 ],
);

for my $formula (qw(hsin cos gcd mt)) {
    my $geo = Geo::Distance->new;
    $geo->reg_unit( 1, 'earth radius' );
    $geo->formula($formula);

    for my $test (@tests) {
        my $got = $geo->distance( 'earth radius', @{$lonlat{$test->[0]}}, @{$lonlat{$test->[1]}} );
        is_roughly( $got, $test->[2], "$test->[0] to $test->[1] is roughly $test->[2] using $formula" );
    }
}

done_testing();

sub is_roughly {
    my ($got, $expected, $message) = @_;

    ok( abs($got - $expected) < 1e-10, $message )
        or diag "Expected $expected, got $got";
}
