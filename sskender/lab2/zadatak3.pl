use strict;
use warnings;
use diagnostics;

my $date;
my %requests;

while (<>) {
    chomp $_;

    my @date_time = ($_ =~ m/(\[.*\])/);
    my @current_date = ($date_time[0] =~ m/(\d{2}\/[A-Za-z]{3}\/\d{4})/);
    my $hour = (split /:/, $date_time[0])[1];

    if (! defined $date) {
        $date = $current_date[0];
    }

    if ($date ne $current_date[0]) {
        print "Datum: $date\n sat : broj pristupa\n-------------------------------\n";
        foreach (sort keys %requests) {
            print "  $_ : $requests{$_}\n";
        }
        print "\n";

        $date = $current_date[0];
        %requests = ();
    }

    $requests{$hour} += 1;
}

print "Datum: $date\n sat : broj pristupa\n-------------------------------\n";
foreach (sort keys %requests) {
    print "  $_ : $requests{$_}\n";
}
print "\n";