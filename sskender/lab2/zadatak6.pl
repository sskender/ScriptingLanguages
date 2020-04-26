use strict;
use warnings;
use diagnostics;
use open ':locale';
use locale;

if (@ARGV != 2) {
    die "Wrong number of arguments";
}

my $prefix_len = pop(@ARGV);

my $file_name = $ARGV[0];
my $success = open LOG, "<", $file_name;
if (! $success) {
    die "File $file_name can not be opened";
}

my %words;  # map <word,number>

while (defined(my $line = <LOG>)) {
    chomp $line;
    $line = lc $line;
    $line =~ s/\W+/\ /g;
    my @words = split /\ /, $line;

    foreach (@words) {
        my @matches = ($_ =~ m/^.{$prefix_len}/g);
        if (scalar @matches) {
            $words{$matches[0]} += 1;
        }
    }
}

foreach (sort keys %words) {
    print "$_ : $words{$_}\n";
}
