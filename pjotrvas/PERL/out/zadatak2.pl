%names = ();
%email_count = ();

while (<>) {
    chomp $_;

    @from_field = ($_ =~ m/^(From.*<.*\@.*>)/);
    @form_splitted = split /</, $from_field[0];

    @name_splitted = split /:/, $form_splitted[0];

    $name = $name_splitted[1];

    @email_splitted = split />/, $form_splitted[1];
    $email = $email_splitted[0];

    if (! defined ($name) || ! defined ($email)) {
        next;
    }

    $names{$email} = $name;
    $email_count{$email} += 1;
}

foreach $email (sort { $email_count{$a} <=> $email_count{$b} } keys %email_count) {
    printf("%40s : %s (%d)\n", $email, "*" x $email_count{$email}, $email_count{$email})
}