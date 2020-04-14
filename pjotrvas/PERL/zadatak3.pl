#!/usr/bin/perl -w

foreach $file (@ARGV) {

	@datoteka = split /\./, $file;
	$datum=$datoteka[1];

	print "Datum: " . $datum . "\n" . "sat : broj pristupa\n";
	print "-------------------------------\n";				
	open LOGDAT, "<", "$file";

	while (defined ($redak = <LOGDAT>)) {
		 @parts = split(/:/, $redak);
                 $sat = $parts[1];
		 $sati[$sat] += 1;		

	}

	$indeks = 0;
	foreach (@sati) {
		printf (" %02d : %s", $indeks++ , $_ . "\n");
         }
	print "\n";
}


