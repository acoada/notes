#!/usr/bin/perl
use strict;
use warning;
use constant NEXT => 0;
use constant VAL => 1; $four = $list->[NEXT];

$list = undef;
foreach (reverse 1..5 ) {
		$list = [ $list, $_ * $_ ];
}
$nine = $four->[NEXT];
$sixteen = $nine->[NEXT];

$nine->[NEXT] = $sixteen->[NEXT];
$sixteen->[NEXT] = $nine;
$four->[NEXT] = $sixteen;
