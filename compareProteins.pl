#!/usr/bin/perl -w
use strict;
use warnings;
use FindBin qw( $RealBin );
use lib $RealBin;
use MyCode;
if($#ARGV != 1){
	print "Wrong entry\n";
	exit;
}
my $protein1Filename = $ARGV[0];
my $protein2Filename = $ARGV[1];
unless (open(PROTEIN1FILE,$protein1Filename) && open(PROTEIN2FILE,$protein2Filename) ){
	print "Could not open files\n";
	exit;
}
my@protein1 = <PROTEIN1FILE>;
my @protein2 = <PROTEIN2FILE>;
my $protein1 = join( "",@protein1);
$protein1 =~ s/\s//g;
my $protein2 = join( "",@protein2);
$protein2 =~ s/\s//g;
protCompare($protein1,$protein2);
print"Would you like to insert a new sequence to compare? [y/n]\n";
my $ans = <STDIN>;
chomp $ans;
if($ans eq 'n'){
	print "Ok, bye \n";
	exit;
}
if($ans eq 'y'){
	print "Please enter sequence: \n";
}
else {
	print "Wrong answer, bye\n";
	exit;
}
my $newProt = <STDIN>;
chomp $ans;
print"Would you like to compare it with protein number 1 or number 2? [1/2]\n";
$ans = <STDIN>;
chomp $ans;
if($ans == 1){
	protCompare($protein1,$newProt);
	exit;
}
if($ans == 2){
	protCompare($protein2,$newProt);
	exit;
}
else {
	print "Wrong answer, bye\n";
	exit;
}

