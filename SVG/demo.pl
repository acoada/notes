#!/usr/bin/perl
use strict;
use SVG;
use Data::Dumper;

my $figure = shift;

my $style = {
		'font-family'	=> 'Helvetica',
		'font-size'	=> 18,
		'stroke'	=> 'black',
		'stroke-opacity'=> 0,
		'fill'		=> 'red',
		'fill-opacity'	=> 0.4,
		'stroke-width'	=> 4,
};

my $svg = SVG->new('width',233,'height',233);
$svg->rect('x',100, 'y',100,'rx',8,'ry',8,'width',89,'height',20,%{$style});
open OUT, "> $figure";
print OUT $svg -> xmlify();
