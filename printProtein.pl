#!/usr/bin/perl -w
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
	print "Could not open file $proteinFilename!\n";
	exit;
}
my @protein = <PROTEINFILE>;
my $protein = join( "",@protein);
$protein =~ s/\s//g;
my $proteinSize = length($protein);
#print "$protein\n\n";
print("Nuevo print");
print "It has $proteinSize nucleotides, where the codons and the aminoacid that they code to are: \n";

for (my $i=0; $i<(length($protein)-2); $i+=3){
	my $codon = substr $protein, $i,3;
	my $aa = codon2aa($codon);
	if($aa eq "_"){
		$aa = "STOP";
	}
	print "$codon => $aa\n";
}
close PROTEINFILE;
exit;
