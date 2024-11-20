#!C:\Strawberry\perl\bin
use strict;
use warnings;

# função para leitura e exibição de sequências DNA e RNA
sub read_and_display_dna_rna {
    my $filename = 'sequencia_dna.txt';

    open(my $fh, '<', $filename) or die "nao foi possivel abrir o arquivo '$filename' $!";
    my $dna_sequence = '';
    while (my $line = <$fh>) {
        chomp($line);
        $dna_sequence .= $line;
    }
    close($fh);

    print "\nSequencia de DNA:\n$dna_sequence\n";

    my $rna_sequence = $dna_sequence;
    $rna_sequence =~ tr/T/U/;

    print "\nSequencia de RNA:\n$rna_sequence\n";
}

# função para contagem de bases CG no DNA
sub count_cg_bases {
    print "Digite a sequencia de DNA (somente A, T, C e G): ";
    chomp(my $dna_sequence = <STDIN>);

    if ($dna_sequence !~ /^[ATCG]+$/i) {
        die "Erro: A sequencia deve conter apenas as letras A, T, C e G.\n";
    }

    my $count_C = 0;
    my $count_G = 0;

    foreach my $base (split //, $dna_sequence) {
        if ($base eq 'C') {
            $count_C++;
        } elsif ($base eq 'G') {
            $count_G++;
        }
    }

    my $total_bases = length($dna_sequence);
    my $percent_CG = (($count_C + $count_G) / $total_bases) * 100;+

    print "Contagem de C: $count_C\n";
    print "Contagem de G: $count_G\n";
    print "Percentual de CG: $percent_CG%\n";
}

# função para contagem de todas as bases no DNA
sub count_all_bases {
    print "Digite a sequencia de DNA (somente A, T, C e G): ";
    chomp(my $dna_sequence = <STDIN>);

    if ($dna_sequence !~ /^[ATCG]+$/i) {
        die "Erro: A sequencia deve conter apenas as letras A, T, C e G.\n";
    }

    my %contagem = (
        'A' => 0,
        'T' => 0,
        'C' => 0,
        'G' => 0,
    );

    foreach my $base (split //, $dna_sequence) {
        $contagem{uc($base)}++ if exists $contagem{uc($base)};
    }

    my $total_bases = length($dna_sequence);

    print "\nContagem e proporcoes de bases na sequencia de DNA:\n";
    foreach my $base (sort keys %contagem) {
        my $percentual = ($contagem{$base} / $total_bases) * 100;
        printf "%s: %d (%.2f%%)\n", $base, $contagem{$base}, $percentual;
    }
}

# função para tradução de RNA para proteína
sub translate_rna_to_protein {
    my %codon_table = (
        'AUG' => 'M', 'UUU' => 'F', 'UUC' => 'F',
        'UAA' => '*', 'UAG' => '*', 'UGA' => '*'
    );

    print "Digite a sequencia de RNA: ";
    my $rna = <STDIN>;
    chomp($rna);

    my $proteina = '';
    for (my $i = 0; $i < length($rna); $i += 3) {
        my $codon = substr($rna, $i, 3);
        last if length($codon) < 3;
        $proteina .= $codon_table{$codon} // '?';
    }

    print "Sequencia de proteina: $proteina\n";
}

# menu de opções
sub show_menu {
    print "\nEscolha uma funcionalidade:\n";
    print "1. Leitura e exibicao de sequencias DNA e RNA\n";
    print "2. Contagem de bases CG no DNA\n";
    print "3. Contagem de todas as bases no DNA\n";
    print "4. Traducao de RNA para Proteina\n";
    print "5. Sair\n";
    print "Escolha uma opcao: ";
    
    my $choice = <STDIN>;
    chomp($choice);
    return $choice;
}

# programa principal
while (1) {
    my $choice = show_menu();

    if ($choice == 1) {
        read_and_display_dna_rna();
    } elsif ($choice == 2) {
        count_cg_bases();
    } elsif ($choice == 3) {
        count_all_bases();
    } elsif ($choice == 4) {
        translate_rna_to_protein();
    } elsif ($choice == 5) {
        print "Saindo...\n";
        last;
    } else {
        print "Opção inválida! Tente novamente.\n";
    }
}
