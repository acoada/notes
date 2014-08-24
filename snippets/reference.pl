#!/usr/bin/perl
# liujingyi(songlart@gmail.com)
use strict;
no strict "refs";

#symbolic reference
my $animal="dog";
our $dog="lady";

print "${$animal}\n";
eval "\$$animal='New';";
print "${$animal}\n";

#hard reference
my @toy = qw( TABLE, PC, FOOTBALL);
my $num = @toy;
my %games = (
		Nintendo	=> "Wii",
		Sony		=> "PS3",
		Microsoft	=> "XBOX",
);

my $ref_scale = \$num;
my $ref_array = \@toy;
my $ref_hash = \%games;

print "ref_scale: $$ref_scale\n";
printf "ref_array: %s\n", join(" ", @$ref_array);
while ( my($key,$value ) = each(%$ref_hash)) {
	print "$key => $value\n"
}

my $ref_array = ['Woody', 'Buzz', 'Bo'];
print "the raw value of \$ref_array: $ref_array\n";
print "$ref_array->[0]","\n";
print "$$ref_array[1]","\n";
print "${$ref_array}[1]","\n";
print "@{$ref_array}","\n";
print "same thing:@{$ref_array}","\n";

my $ref_hash = { 
		Name => 'Woody',
		Type => 'Cowboy',
};

print "Name is ",$ref_hash->{'Name'},"\n";
print keys %$ref_hash,"\n";
print values %$ref_hash,"\n";

#array of array
my $matrix = [
		[0,1,2],
		[3,4,5],
		[6,7,8],
];
print "matrix Row 3 column 2 : $matrix->[2]->[1]\n";

# Derefencing with two loops
for ( my $x=0; $x<3; $x++ ) {
		for ( my $y=0; $y<3; $y++ ) {
				print "$matrix->[$x]->[$y]";
		}
		print "\n\n";
}
# Derefencing with one loop
for ( my $i=0; $i<3; $i++ ) {
		print "@{$matrix->[$i]}","\n\n";
}

my $p_matrix = \$matrix;
print $$p_matrix->[2]->[1],"\n";
print $$p_matrix->[2][1],"\n";
print ${$p_matrix}->[2][1],"\n";

#array of hash
my $petref=[
		{
				name	=> "Rover",
				type	=> "dog",
				owner	=> "Jones",
		},
		{
				name	=> "Sylve",
				type	=> "cat",
				owner	=> "Black",
		}
];

print ref($petref),"\n";
#print_hash ($petref);
print_hash (\$petref,2);
# add a hash
push @{$petref}, {name	=> "Ben",type	=> "bird",owner	=> "Crow"};
while (my ($key, $value)=each %{$petref->[2]}) {
		print "$key => $value\n";
}

print "after\n";
print_hash (\$petref,3);

#sub
sub print_hash {
		my $ref = shift;
		my $lim = shift;
		for( my $i=0; $i<$lim; $i++ ) {
				#while(my ($key, $value)=each %{$ref->[$i]}) {
				while(my ($key, $value)=each %{$$ref->[$i]}) {
						print "$key => $value\n";
				}
				print "\n";
		}
}

#hash of hash
my $hashref = {
		Math	=>	{
				Anna	=>	100,
				Hao		=>	30,
				Dan		=>	50,
		},
		English	=>	{
				Sam		=> 80,
				Liu		=> 100,
				Wang	=> 89,
		},
};

foreach my $key (keys %{$hashref}) {
		print "Outer Key: $key \n";
		while (my ( $ikey, $ivalue) = each %{$hashref->{$key}} ) {
				printf "\tInner key: %-5s => Value: %-8s\n", $ikey,$ivalue;
		}
}

