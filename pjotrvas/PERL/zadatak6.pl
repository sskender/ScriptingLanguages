#!/usr/bin/perl -w

$duljina = pop(@ARGV);

while(<>) {
        chomp;
	
	$tekst=lc $_;	
	$tekst=~ s/\W/\ /g;

	@prefiksi= ($tekst=~ m/[a-z]{$duljina}/g);

	foreach $rijec (@prefiksi){
		$popis{$rijec} += 1;
	}
}
	
@sortPopis=(sort keys %popis);

foreach $r (@sortPopis){
	print "$r : $popis{$r}" . "\n";
}
