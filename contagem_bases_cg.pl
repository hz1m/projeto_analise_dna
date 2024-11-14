use strict;
use warnings;

# Sequência de DNA
my $dna_sequence = "ATGCGTACGTAGCTAGCTAGCTGACTGATCGTAGCTAGCTGACTAGCGTAGCTAGCTAGCGTAGCTAGCTAGCTAGCTAGCTGACTGACTGACG GCTAGCTAGCTAGGCTAGCTAGCATCGATCGTAGCTGACTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCATGCTAGCTGACTGACTGACGT AGCTAGCTAGCTAGCTAGCTAGCGTAGCATCGTACGTAGCATCGATCGTAGCTAGCATGCTAGCATGCTAGCTGACTGATCGTAGCTAGCTAG GCTAGCTAGCTGACGATCGTAGCTAGCTGATCGTACGTAGCTAGCGTAGCTAGCTAGCATGCTAGCTGACTAGCATGCTAGCTAGCTGACGTG GCTAGCTGACTGACTGATCGTAGCTAGCTAGCTAGCTAGCATGCGTAGCTGACTAGCATGCTAGCTAGCTGACTGACGATCGTACGTAGCTAG CGTAGCTAGCTAGCATCGATCGTAGCTGACTAGCTAGCTAGCTAGCTAGCATGCGTAGCTAGCATGCTAGCTGACTGATCGTACGTAGCTAGC TAGCTAGCTGACTAGCGTAGCTAGCATGCTAGCTGACTGACTGACTGACTGACTGACGTAGCTAGCGTAGCTAGCTAGCTAGCTAGCATCGTA CGTAGCTGACGTAGCTAGCTGATCGTAGCTGACGTAGCATGCTAGCTAGCATGCTAGCTGACTAGCTAGCGTAGCTAGCTAGCATGCTAGCTG ACTGACGATCGTAGCTAGCTGACTAGCTAGCATCGTAGCTAGCATGCGTAGCTAGCTAGCATGCTAGCTAGCTGACGATCGTAGCTAGCTAGC TAGCATGCTAGCTAGCATCGTACGTAGCTGACTAGCTAGCTAGCATCGTACGTAGCTAGCTAGCATGCTAGCTGACTAGCTAGCTAGCTAGCT AGCATGCGTAGCTAGCATGCTAGCTAGCTGACGATCGTAGCTAGCTAGCTAGCTGACTAGCATCGTACGTAGCTAGCATGCTAGCTAGCTGAC GTAGCTAGCTAGCATCGTACGTAGCTAGCGTAGCTAGCTAGCATGCGTAGCTGACTAGCATGCTAGCTAGCATGCTAGCTGACTAGCATGCTA GCTAGCTAGCATCGTACGTAGCTAGCATCGTACGTAGCATGCTAGCTAGCTGACTGATCGTAGCTAGCTGACTAGCTAGCATGCTAGCTGACG TAGCTAGCATGCTAGCTGACTGACGATCGTACGTAGCTAGCATCGTACGTAGCTAGCATGCTAGCTAGCATGCGTAGCTAGCTAGCATCGTAC GTAGCTAGCATCGTAGCTAGCATGCTAGCTGACTAGCATCGTAGCTAGCATGCTAGCTGACTGACGATCGTAGCTAGCTAGCATGCGTAGCTA GCTAGCATCGTACGTAGCTAGCATCGTACGTAGCTAGCATGCTAGCTAGCTAGCTAGCATGCTAGCTGACGTAGCATGCTAGCATCGTACGTA GCTAGCATCGTAGCTAGCATGCGTAGCTAGCTAGCATCGTAGCTAGCTGACGTAGCTAGCATCGTACGTAGCTAGCTAGCTAGCATGCTAGCT";

# Inicializando contadores
my $count_C = 0;
my $count_G = 0;

# Contando as bases C e G
foreach my $base (split //, $dna_sequence) {
    if ($base eq 'C') {
        $count_C++;
    } elsif ($base eq 'G') {
        $count_G++;
    }
}

# Calculando o percentual de CG
my $total_bases = length($dna_sequence);
my $percent_CG = (($count_C + $count_G) / $total_bases) * 100;

# Exibindo os resultados
print "Contagem de C: $count_C\n";
print "Contagem de G: $count_G\n";
print "Percentual de CG: $percent_CG%\n";