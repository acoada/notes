#!/usr/bin/perl
#use strict "vars";

$name="Susanne";
$num = 100;
package friend;
sub welcome {
	print "Who is you pal? ";
	chomp($name=<STDIN>);
	print "in package friend, \$num is $num!\n";
	print "in package friend, \$name is $name!\n";
	print "in package main, \$name is $main::name!\n\n";
}

package main;
&friend::welcome;
print "in package main, \$name is $name\n";
print "in package friend, \$name is $friend::name\n\n";

package birthday;

$name="Alice";
print "in package birthday, \$name is $name\n";
print "the \$::name is $::name\nthe \$friend::name is $friend::name\n\n";
