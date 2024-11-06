#!C:\Strawberry\perl\bin
use strict;
use warnings;

# função para leitura e exibição de sequências DNA e RNA
sub read_and_display_dna_rna {
    # nome do arquivo que contém a sequência de DNA
    my $filename = 'sequencia_dna.txt';

    # abre o arquivo para leitura
    open(my $fh, '<', $filename) or die "não foi possível abrir o arquivo '$filename' $!";

    # lê a sequência de DNA
    my $dna_sequence = '';
    while (my $line = <$fh>) {
        chomp($line);
        $dna_sequence .= $line;
    }
    close($fh);

    # exibe a sequência de DNA
    print "\nsequência de DNA:\n$dna_sequence\n";

    # converte DNA para RNA (substituindo T por U)
    my $rna_sequence = $dna_sequence;
    $rna_sequence =~ tr/T/U/;

    # exibe a sequência de RNA
    print "\nsequência de RNA:\n$rna_sequence\n";
}

# função para contagem de bases CG no DNA
sub count_cg_bases {
    print "executando: contagem de bases CG no DNA...\n";
    # a implementação será adicionada aqui
}

# função para contagem de todas as bases no DNA
sub count_all_bases {
    print "executando: contagem de todas as bases no DNA...\n";
    # a implementação será adicionada aqui
}

# função para tradução de RNA para proteína
sub translate_rna_to_protein {
    print "executando: tradução de RNA para Proteína...\n";
    # a implementação será adicionada aqui
}

# menu de opções
sub show_menu {
    print "\nescolha uma funcionalidade:\n";
    print "1. leitura e exibição de sequências DNA e RNA\n";
    print "2. contagem de bases CG no DNA\n";
    print "3. contagem de todas as bases no DNA\n";
    print "4. tradução de RNA para Proteína\n";
    print "5. sair\n";
    print "escolha uma opção: ";
    
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
        print "saindo...\n";
        last;
    } else {
        print "opção inválida! tente novamente.\n";
    }
}
