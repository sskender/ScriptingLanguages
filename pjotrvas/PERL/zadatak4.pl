#!/usr/bin/perl -w

while(defined($redak=<>)){
	
	chomp ($redak);
	
	@zapis=split /;/,$redak;

	$pocetak=$zapis[3];
	$kraj=$zapis[4];

	@terminPoc=split / /, $pocetak;
	@terminKraj=split / /,$kraj;
	
	@satiPoc=split /:/, $terminPoc[1];
	@satiPred=split /:/, $terminKraj[1];
	
	if($satiPred[0]-$satiPoc[0]){
		print "$zapis[0] $zapis[1] $zapis[2] - PROBLEM: $terminPoc[0] $terminPoc[1] --> $zapis[4] \n";

	}
	
}

