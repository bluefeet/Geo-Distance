use strict;
use warnings;

use inc::Module::Install;

name     'Geo-Distance';
perl_version '5.008003';
all_from 'lib/Geo/Distance.pm';

build_requires 'Test::More' => 0.62;

requires 'Math::Complex';
recommends 'Geo::Distance::XS';

WriteAll;

