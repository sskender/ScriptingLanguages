#!/usr/bin/perl -w

print "Upisite brojeve ciju aritemticku sredinu zelite izracunati:\n(niz zakljucite s ctrl-D za Unix ili s ctrl-Z za Windows).\n";

@list=<STDIN>;

foreach(@list){
	$sum+=$_;
}

print "Aritmeticka sredina je: " . $sum/@list; 
