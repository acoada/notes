#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;
use Getopt::Long;
use Data::Dumper;
use FindBin '$RealBin';          # absulute path of this script: $RealBin/$0
use Cwd;                         # current working directory

my ($mode, $input, $help);
my $current_dir = getcwd();
GetOptions(
	"mode:i"		=> \$mode,    # integer
	"input:s"		=> \$input,   # string
	"help"			=> \$help,
)or die "Unknown option!\n";

print "/path/to/script:   $RealBin/$0\n";
print "/where/am/I:       $current_dir\n";
