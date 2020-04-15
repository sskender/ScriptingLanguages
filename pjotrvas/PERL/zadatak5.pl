#!/usr/bin/perl -w

$noRed=0;

chomp ($faktori=<>);
@faktori=split /;/, $faktori;

while (defined ($redak = <>)) {
	@redak=split /;/, $redak;
	$jmbag=shift @redak;
	$prezime=shift @redak;
	$ime=shift @redak;
	
		$i=0;
		$sumRedak=0;
		foreach (@redak) {
			$_=~ s/-/0/;
			$sumRedak+=$faktori[$i]*$_;
			$i++;
		}
	
	$rangLista[$noRed]=sprintf("%06.2f;%s;%s;%s", $sumRedak, $jmbag, $prezime, $ime);
	$noRed++;
}

@rangSorted=reverse sort(@rangLista);

$noRed=1;
foreach (@rangSorted) {
	@redak=split /;/, $_;
	printf("%3d. %-32s:% 6.2f\n", $noRed, "$redak[2], $redak[3] ($redak[1])", $redak[0]);
	$noRed++;
}
	

