#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

my $str='first,"second","third,third","forth,forth","fifth,fifth"';
#$str =~ s/(".*?),(.*?")/\1-\2/;
#$str =~ s/(".*?),(.*?")/$1-$2/;
$str =~ s/("[^\"]+?),(.*?")/$1-$2/;
my @F=split /,/, $str;
print Dumper(\@F);
