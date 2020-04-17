#!/usr/bin/perl -w

while(<>){
    push @zapisi, $_;
    @splitRed = split /:/, $_;
    $datum = &datum();
    $datumi{$datum} += 1;
}

    while (my ($k,$v)= each %datumi){
        foreach (0..23){
		    $sati[$_] = 0;
	    }

        foreach (@zapisi){
        @splitRed = split /:/, $_;
        $datum = &datum();

            if($datum eq $k){
                $sat = $splitRed[1];
                $sati[$sat] += 1;
            }
        }
        &printer($k);
    }

sub printer{
    my ($datum) = @_;
	print "Datum: " . $datum . "\n" . "sat : broj pristupa\n";
	print "-------------------------------\n";

    $indeks = 0;
	foreach (@sati) {
		printf (" %02d : %s", $indeks++ , $_ . "\n");
         }
	print "\n";
}

sub datum{
    @dio = split / /, $splitRed[0];
    $dio[3]=~ s|^.*\[(.{2}/.{3}/.{4}).*$|$1|;
    return $dio[3];
}