#!usr/bin/perl -w
if($#ARGV != 0){
	print "Wrong entry\n";
	exit;
}
$fileName = $ARGV[0];
unless (open(FILE,$fileName)){
	print "Could not open file\n";
	exit;
}
@file = <FILE>;
print"Please enter the code you want to look for. If you want to take a look at all the codes in our current data base, please enter DATALOOK. \n";
$ans = <STDIN>;
chop $ans;
if($ans eq "DATALOOK"){
	foreach $i(@file) {
		@entry =  split /;/,$i;
		print $entry[0];		
		print "\n";
	}
} else {
	foreach $i(@file) {
		@entry =  split /;/,$i;
		if($entry[0] eq $ans){
			$organism = $entry[1];
			$site = $entry[2];
			$cut = $entry[3];
			print "The enzime \"$ans\" belongs to the organism \"$organism\".\n";
			print "The recognition site is: $site \n";
			print "The way the cut is done is: $cut \n";	
			exit;
		}
	}
	print"The enzime \"$ans\" was not found in our database.\n";
}

