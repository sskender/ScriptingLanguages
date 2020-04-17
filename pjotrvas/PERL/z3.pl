#!/usr/bin/perl -w

if(@ARGV ne "-"){

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

    $datum = &datum();
    &printer($datum);
	
    }
}

if (! @ARGV){

    @zapisi=<STDIN>;

    foreach (@zapisi){
        @splitRed = split /:/, $_;
        $datum = &datum();
        $mjeseci{$datum} += 1;
    }

    while (my ($k,$v)= each %mjeseci){
        
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