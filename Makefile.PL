use ExtUtils::MakeMaker;

WriteMakefile(
	'NAME' => 'Geo::Distance',
	'VERSION_FROM' => 'Distance.pm',
	'PREREQ_PM' => {},
	($] >= 5.005 ? (
		ABSTRACT_FROM => 'Distance.pm',
		AUTHOR => 'Aran Clary Deltac <aran@arandeltac.com>'
	) : ()),
);
