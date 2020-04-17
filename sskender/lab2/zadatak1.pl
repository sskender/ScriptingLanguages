use strict;
use warnings;
use diagnostics;

my $string = <STDIN>;
my $number = <STDIN>;

chomp $string;
chomp $number;

print "$string\n" x $number;
