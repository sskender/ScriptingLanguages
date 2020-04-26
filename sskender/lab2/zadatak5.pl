use strict;
use warnings;
use diagnostics;

my $file_name = $ARGV[0];
my $success = open LOG, "<", $file_name;
if (! $success) {
    die "File $file_name can not be opened"
}

my @components;             # list of components
my %students_scores;        # map <student,score>

while (defined (my $line = <LOG>)) {
    chomp $line;

    # skip comments
    if ($line =~ /^#/) {
        next;
    }
    # line starting with jmbag
    elsif ($line =~ /^[0-9]{10}/) {
        # prepare data
        $line =~ s/-/0/g;
        my ($jmbag, $last_name, $first_name, @scores) = split /;/, $line;

        # perform calculation
        my $total_score = 0;
        my $i = 0;
        foreach (@scores) {
            $total_score += $components[$i] * $_;
            $i++;
        }

        # save to map
        my $key = "$jmbag;$last_name;$first_name";
        $students_scores{$key} = $total_score;
    }
    # components
    else {
        @components = split /;/, $line;
    }
}

print "Lista po rangu:\n-------------------\n";
my $counter = 1;
foreach (reverse sort { $students_scores{$a} <=> $students_scores{$b} } keys %students_scores) {
    my ($jmbag, $last_name, $first_name) = split /;/, $_;
    my $score = $students_scores{$_};
    printf("%d. %s, %s (%s)\t: %.2f\n", $counter++, $last_name, $first_name, $jmbag, $score);
}