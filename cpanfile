requires 'perl' => '5.008001';

requires 'GIS::Distance' => '0.11';
requires 'GIS::Distance::Constants' => '0.11';

requires 'Carp';

on test => sub {
    requires 'Test2::V0' => '0.000094';

    recommends 'DBD::SQLite' => '1.46';
};
