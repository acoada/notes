#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;
use Getopt::Long;
use Data::Dumper;
use FindBin '$RealBin';          # absulute path of this script: $RealBin/$0
use Cwd;                         # current working directory

my $current_dir = getcwd();
my ($mode, $input, $help);
GetOptions(
	"mode:i"		=> \$mode,    # integer
	"input:s"		=> \$input,   # string
	"help"			=> \$help,
)or die "Unknown option!\n";

die `pod2text $0` if ( @ARGV == 0 || $help);

<+START_HERE>
####################################################
################### Sub Routines ###################
####################################################

sub proportional_binary_string_search {
		my ($array, $target) = @_;

		# $low is first element that is not too low;
		# $high is the first that is too high
		# $common is the index of the last character tested for
		#    equality in the elements at $low-1 and $high.
		#    Rather than compare the entire string value, we only
		#    use the "first different character".
		#    We start with character position -1 so that character
		#    0 is the one to be compared.
		#
		my ( $low, $high, $common ) = ( 0, scalar(@$array), -1 );

		return 0 if $high == -1 || $array->[0] ge $target;
		return $high if $array->[$high-1] lt $target;
		--$high;

		my ($low_ch,  $high_ch,  $targ_ch ) = (0, 0);
		my ($low_ord, $high_ord, $targ_ord);

		# Keep trying as long as there are elements that might work.
		#
		while( $low < $high ) {
				if ($low_ch eq $high_ch) {
						while ($low_ch eq $high_ch) {
								return $low if $common == length($array->[$high]);
								++$common;
								$low_ch  = substr( $array->[$low],  $common, 1 );
								$high_ch = substr( $array->[$high], $common, 1 );
								}
						$targ_ch = substr( $target, $common, 1 );
						$low_ord  = ord( $low_ch  );
						$high_ord = ord( $high_ch );
						$targ_ord = ord( $targ_ch );
						}
				# Try the proportional element (the preceding code has
				# ensured that there is a nonzero range for the proportion
				# to be within).

				my $cur = $low;
				$cur += int( ($high - 1 - $low) * ($targ_ord - $low_ord)
						                        / ($high_ord - $low_ord) );
				my $new_ch = substr( $array[…]
		}
}
