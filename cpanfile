requires 'perl' => '5.008001';

requires 'GIS::Distance' => '0.10';
requires 'GIS::Distance::Constants' => '0.10';

requires 'Carp';

recommends 'GIS::Distance::Fast' => '0.09';

on test => sub {
    requires 'Test2::V0' => '0.000094';
};
