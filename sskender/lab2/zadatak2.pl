use strict;
use warnings;
use diagnostics;

my $input_number;
my @all_numbers;
my $sum = 0;

while (defined(chomp($input_number = <STDIN>)) && $input_number ne "") {
    push @all_numbers, $input_number;
    $sum += $input_number;
}

print "Average: " . $sum / scalar @all_numbers;
