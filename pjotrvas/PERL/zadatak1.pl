#!/usr/bin/perl

print "Unesite niz znakova:\n";

chomp($line=<STDIN>);

print "Unesite zeljeni broj ponavljanja niza:\n";

chomp($num=<STDIN>);

print "Izlazni niz:\n";

print (($line . "\n") x $num );


