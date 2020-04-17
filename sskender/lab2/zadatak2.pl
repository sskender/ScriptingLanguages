use strict;
use warnings;
use diagnostics;

my $input_number;
my @all_numbers;
my $sum = 0;

while (chomp($input_number= <STDIN>)) {
    push @all_numbers, $input_number;
    $sum += $input_number;
}

print "Average: " . $sum / scalar @all_numbers;
