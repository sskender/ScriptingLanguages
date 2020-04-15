#!/usr/bin/perl -w

$noRed=0;

chomp($faktori=<>);

@faktori=split /;/, $faktori;

while(defined ($redak=<>)){
    @redak=split /;/, $redak;
    $jmbag=$redak[0];
    $ime=$redak[1];
    $prezime=$redak[2];

    splice @redak, 0, 3;
    $sumaRedak=0;
    $i=0;
    foreach (@redak){
        $_=~ s/-/0/;
        $sumaRedak+=$faktori[$i]*$_;
        ++$i;
    } 
    $rang[$noRed]=sprintf("%06.2f;%s;%s;%s", $sumaRedak, $jmbag, $prezime, $ime);
   $noRed++; 
}

@sortRang=reverse sort (@rang);
$noRed=1;

foreach (@sortRang) {
    @redak=split /;/, $_;
    printf("%3d. %-32s:% 6.2f\n", $noRed, "$redak[2], $redak[3] ($redak[1])", $redak[0]);
     $noRed++;
 }

