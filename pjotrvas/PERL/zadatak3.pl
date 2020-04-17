#!/usr/bin/perl -w

foreach $file (@ARGV) {

	open LOGDAT, "<", "$file";

	foreach (0..23){
		$sati[$_] = 0;
	}
	
	while (defined ($redak = <LOGDAT>)) {
		 @splitRed = split /:/, $redak;
		 $sat = $splitRed[1];
		 $sati[$sat] += 1;		
	}
	@datum = split / /, $splitRed[0];
	$datum[3]=~ s|^.*\[(.{2}/.{3}/.{4}).*$|$1|;

	print "Datum: " . $datum[3] . "\n" . "sat : broj pristupa\n";
	print "-------------------------------\n";				

	$indeks = 0;
	foreach (@sati) {
		printf (" %02d : %s", $indeks++ , $_ . "\n");
         }
	print "\n";
}


