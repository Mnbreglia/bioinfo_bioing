package MyCode;
use strict;
use warnings;
=head
Libreria con codigo para usar en bioinformatica. Tiene las
siguientes funciones:

* protCompare
* codon2aa

Para cargar esta libreria en otro archivo, pegar esto
despues de la primera línea:

use strict;
use warnings;
use FindBin qw( $RealBin );
use lib $RealBin;
use MyCode;
=cut
 
use Exporter qw(import);
 
our @EXPORT = qw(protCompare codon2aa);
 

=head
La funcion protCompare toma como input dos strings que son
proteinas en formato ACGT e imprime la cantidad de matches,
missmatches y el porcentaje de identificacion. Esto se calcula
recorriendo ambas y comparando posicion por posicion si las
bases coinciden. Finalmente se toman todas las bases sobrantes 
(los de la cadena mas larga) como missmatches. El porcentaje de
identificacion es el numero de matches dividido el largo de la
cadena mayor.
=cut
sub protCompare{
	my ($prot1,$prot2) = @_;
	my $prot1l = length($prot1);
	my $prot2l = length($prot2);
	my $proteinLong;
	my $proteinShort;
	if($prot1l>=$prot2l){
		$proteinLong = $prot1;
		$proteinShort = $prot2;
	} 
	else {
		$proteinLong = $prot2;
		$proteinShort = $prot1;
	}
	my $missmatch = 0;
	my $match = 0;
	for(my $i=0; $i<length($proteinShort); $i++){
		my $uno = substr $proteinShort,$i,1;
		my $dos = substr $proteinLong,$i,1;
		if($uno eq $dos){
			$match++;
		} 
		else {
			$missmatch++;
		}
	}
	$missmatch += length($proteinLong)-length($proteinShort); 
	print "Matches: $match\n";
	print "Missmatches: $missmatch\n";
	my $identity = 100*$match/length($proteinLong);
	$identity = sprintf "%.2f", $identity;
	print "Percentage of identity: $identity %\n";
}

my %c2aaDict = (
    'TCA' => 'S',    # Serine
    'TCC' => 'S',    # Serine
    'TCG' => 'S',    # Serine
    'TCT' => 'S',    # Serine
    'TTC' => 'F',    # Phenylalanine
    'TTT' => 'F',    # Phenylalanine
    'TTA' => 'L',    # Leucine
    'TTG' => 'L',    # Leucine
    'TAC' => 'Y',    # Tyrosine
    'TAT' => 'Y',    # Tyrosine
    'TAA' => '_',    # Stop
    'TAG' => '_',    # Stop
    'TGC' => 'C',    # Cysteine
    'TGT' => 'C',    # Cysteine
    'TGA' => '_',    # Stop
    'TGG' => 'W',    # Tryptophan
    'CTA' => 'L',    # Leucine
    'CTC' => 'L',    # Leucine
    'CTG' => 'L',    # Leucine
    'CTT' => 'L',    # Leucine
    'CCA' => 'P',    # Proline
    'CCC' => 'P',    # Proline
    'CCG' => 'P',    # Proline
    'CCT' => 'P',    # Proline
    'CAC' => 'H',    # Histidine
    'CAT' => 'H',    # Histidine
    'CAA' => 'Q',    # Glutamine
    'CAG' => 'Q',    # Glutamine
    'CGA' => 'R',    # Arginine
    'CGC' => 'R',    # Arginine
    'CGG' => 'R',    # Arginine
    'CGT' => 'R',    # Arginine
    'ATA' => 'I',    # Isoleucine
    'ATC' => 'I',    # Isoleucine
    'ATT' => 'I',    # Isoleucine
    'ATG' => 'M',    # Methionine
    'ACA' => 'T',    # Threonine
    'ACC' => 'T',    # Threonine
    'ACG' => 'T',    # Threonine
    'ACT' => 'T',    # Threonine
    'AAC' => 'N',    # Asparagine
    'AAT' => 'N',    # Asparagine
    'AAA' => 'K',    # Lysine
    'AAG' => 'K',    # Lysine
    'AGC' => 'S',    # Serine
    'AGT' => 'S',    # Serine
    'AGA' => 'R',    # Arginine
    'AGG' => 'R',    # Arginine
    'GTA' => 'V',    # Valine
    'GTC' => 'V',    # Valine
    'GTG' => 'V',    # Valine
    'GTT' => 'V',    # Valine
    'GCA' => 'A',    # Alanine
    'GCC' => 'A',    # Alanine
    'GCG' => 'A',    # Alanine
    'GCT' => 'A',    # Alanine
    'GAC' => 'D',    # Aspartic Acid
    'GAT' => 'D',    # Aspartic Acid
    'GAA' => 'E',    # Glutamic Acid
    'GAG' => 'E',    # Glutamic Acid
    'GGA' => 'G',    # Glycine
    'GGC' => 'G',    # Glycine
    'GGG' => 'G',    # Glycine
    'GGT' => 'G',    # Glycine
    );

=head
La funcion codon2aa toma como input un conjunto
de tres letras (codon) y devuelve una letra que
representa el aa al que codifica este codon. Si
el codon no se reconoce, se devuelve la letra X.
=cut

sub codon2aa{
	my ($thisCodon) = @_;
	if (exists $c2aaDict{$thisCodon}){
		return $c2aaDict{$thisCodon};
	}
	else {
		return "X";
	}	
}
 
1;
