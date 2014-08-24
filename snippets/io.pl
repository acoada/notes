#!/usr/bin/perl
open(FINDIT,"find . -name 'target' -print |") ||
	die $!,"\n";
while( $filename = <FINDIT> ){
	block;
}

# redirect STDOUT from filter to some file
$| = 1;	#Flush buffers
$tmpfile = "temp";
open(DB,"data") || die qq/Failed to open:$!\n/;
open(SAVED,">&STDOUT") || die $!,"\n";
open(STDOUT,">$tmpfile") || die;
while(<DB>){
	print SORT;
}
close SORT;
open(STDOUT,">&SAVED") || die;
print "Now print to screen again.\n";
rename("temp","data");

# the lines in the range from PATTERN until eof(end of file)
while(<DB>){
	print if(/PATTERN/ .. eof); 
}

# mark when each file hit eof
# perl demo.pl file1 file2
while(<>){
	print "$.\t$_";
	if(eof){
			print '-'x30,"\n";
			close(ARGV);	# close FH in order to reset the $. back to 1 for the next file that is opened.
	}
}
