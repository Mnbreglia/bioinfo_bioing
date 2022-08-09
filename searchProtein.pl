#!usr/bin/perl -w
use strict;
use warnings;
use FindBin qw( $RealBin );
use lib $RealBin;
use MyCode;
if($#ARGV != 0){
	print "Wrong entry\n";
	exit;
}
my $proteinFilename = $ARGV[0];
unless (open(PROTEINFILE,$proteinFilename)){
	print "Could not open file\n";
	exit;
}
my @protein = <PROTEINFILE>;
my $protein = join( "",@protein);
$protein =~ s/\s//g;
print "Enter the one-letter code of the aminoacid to search for: \n";
my $ans = <STDIN>;
chop $ans;
my $sum = 0;
for (my $i=0; $i<(length($protein)-2); $i+=3){
	my $codon = substr $protein, $i,3;
	my $aa = codon2aa($codon);
	if($aa eq $ans){
		$sum++;
	}
}
if($sum != 0){
	print"$ans was found $sum times in the sequence. \n";
	exit;
}
else {
	print"$ans was not found in the sequence. \n";
	exit;
}

