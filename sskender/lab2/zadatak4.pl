use strict;
use warnings;
use diagnostics;

my $line;
while (defined($line = <>)) {
    chomp $line;

    # skip if not starting with jmbag
    if ($line =~ /^[^0-9]{10}/) {
        next;
    }

    my @students = split /;/, $line;

    # extract student info
    my $jmbag = $students[0];
    my $last_name = $students[1];
    my $first_name = $students[2];

    # extract term values
    my @term = split / /, $students[3];
    my $term_date = $term[0];
    my $term_time_start = $term[1];

    # convert to seconds
    my @term_end_array = split /:/, $term_time_start;
    my $term_deadline_seconds = ($term_end_array[0] * 60 * 60 + $term_end_array[1] * 60);

    # extract locked values
    my @locked = split / /, $students[4];
    my $locked_date = $locked[0];
    my $locked_time = $locked[1];

    # convert to seconds
    my @locked_time_array = split /:/, $locked_time;
    my $locked_seconds = ($locked_time_array[0] * 60 * 60 + $locked_time_array[1] * 60 + $locked_time_array[2]);

    if ($term_date ne $locked_date || $locked_seconds - $term_deadline_seconds > 60 * 60) {
        print "$jmbag $last_name $first_name - PROBLEM: $term_date $term_time_start --> $locked_date $locked_time\n";
    }
}
