## This file is automatically generated by AutoDoc.
## Changes will be discarded by the next call of the AutoDoc method.


LoadPackage( "CddInterface" );

AUTODOC_file_scan_list := [ "../PackageInfo.g", "../examples/30x30.g", "../examples/FourierProjection.g", "../examples/comparing_polyhedrons.g", "../examples/demo.g", "../examples/example1.g", "../examples/intersection.g", "../examples/linear_programs.g", "../examples/minkuwski.g", "../examples/new.g", "../examples/new2.g", "../gap/polyhedra.gd", "../gap/polyhedra.gi", "../gap/simplefunctions.gd", "../gap/simplefunctions.gi", "../init.g", "../makedoc.g", "../maketest.g", "../read.g" ];

LoadPackage( "GAPDoc" );

example_tree := ExtractExamples( Directory("./doc/"), "CddInterface.xml", AUTODOC_file_scan_list, 500 );

RunExamples( example_tree, rec( compareFunction := "uptowhitespace" ) );

QUIT;
