#!/usr/bin/perl -w

foreach $file (@ARGV) {

	open LOGDAT, "<", "$file" or die "Cant open file: $_";
   
    chomp($faktori=<LOGDAT>);
    @faktori=split /;/, $faktori;
    
    $noRed=0;
	while (defined ($redak = <LOGDAT>)) {
        ($jmbag, $ime, $prezime, @komponente) = split /;/, $redak;

    $sumaRedak = &racunajSumu(@komponente);     
   
    $rang[$noRed]=sprintf("%06.2f;%s;%s;%s", $sumaRedak, $jmbag, $prezime, $ime);
    $noRed++; 
}

@sortRang = reverse sort (@rang);
&printer(@sortRang);
}

sub racunajSumu {
    @komponente = @_;
    $sumaRedak=0;
    $i=0;
            foreach (@komponente){
            $_=~ s/-/0/;
            $sumaRedak+=$faktori[$i]*$_;
            ++$i;
    } 
    return $sumaRedak;
}

sub printer {
    @rang =  @_;
    $pozicija = 1;

    foreach (@rang) {
    ($sumaRedak, $jmbag, $prezime, $ime) = split /;/, $_;
    printf("%3d. %-32s:% 6.2f\n", $pozicija, "$ime, $prezime ($jmbag)", $sumaRedak);
    $pozicija++;
 }
}