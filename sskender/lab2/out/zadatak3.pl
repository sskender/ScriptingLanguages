use open ':locale';
use locale;

$file_name = $ARGV[0];
$success = open LOG, "<", $file_name;
if (! $success) {
    die "File $file_name can not be opened";
}

while (defined ($line = <LOG>)) {
    @data = split /\t/, $line;
    push @lab_list, "$data[3]\t$data[4]\t$data[6]\t$data[2]";
}

$i = 1;
foreach (sort @lab_list) {
    printf("%2d.\t%s\n", $i++, $_);
}