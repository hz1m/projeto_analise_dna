#!C:\Strawberry\perl\bin
use strict;
use warnings;

# função para leitura e exibição de sequências DNA e RNA
sub read_and_display_dna_rna {
    my $filename = 'sequencia_dna.txt';  # define o nome do arquivo contendo a sequência de DNA

    # abre o arquivo para leitura, se falhar, exibe erro
    open(my $fh, '<', $filename) or die "nao foi possivel abrir o arquivo '$filename' $!";  
    my $dna_sequence = '';  # variável para armazenar a sequência de DNA
    while (my $line = <$fh>) {  # lê o arquivo linha por linha
        chomp($line);  # remove quebras de linha do final da linha lida
        $dna_sequence .= $line;  # adiciona a linha à sequência de DNA
    }
    close($fh);  # fecha o arquivo após a leitura

    # exibe a sequência de DNA
    print "\nSequencia de DNA:\n$dna_sequence\n";

    my $rna_sequence = $dna_sequence;  # copia a sequência de DNA para RNA
    $rna_sequence =~ tr/T/U/;  # substitui 'T' por 'U' para converter DNA em RNA

    # exibe a sequência de RNA
    print "\nSequencia de RNA:\n$rna_sequence\n";
}

# função para contagem de bases CG no DNA
sub count_cg_bases {
    print "Digite a sequencia de DNA (somente A, T, C e G): ";  # solicita a entrada da sequência de DNA
    chomp(my $dna_sequence = <STDIN>);  # lê a entrada e remove quebras de linha

    # verifica se a sequência contém apenas as bases A, T, C e G
    if ($dna_sequence !~ /^[ATCG]+$/i) {
        die "Erro: A sequencia deve conter apenas as letras A, T, C e G.\n";
    }

    my $count_C = 0;  # contador de 'C'
    my $count_G = 0;  # contador de 'G'

    # percorre cada base da sequência e conta C e G
    foreach my $base (split //, $dna_sequence) {
        if ($base eq 'C') {
            $count_C++;
        } elsif ($base eq 'G') {
            $count_G++;
        }
    }

    my $total_bases = length($dna_sequence);  # calcula o número total de bases na sequência
    my $percent_CG = (($count_C + $count_G) / $total_bases) * 100;  # calcula o percentual de bases CG

    # exibe os resultados da contagem
    print "Contagem de C: $count_C\n";
    print "Contagem de G: $count_G\n";
    print "Percentual de CG: $percent_CG%\n";
}

# função para contagem de todas as bases no DNA
sub count_all_bases {
    print "Digite a sequencia de DNA (somente A, T, C e G): ";  # solicita a entrada da sequência de DNA
    chomp(my $dna_sequence = <STDIN>);  # lê a entrada e remove quebras de linha

    # verifica se a sequência contém apenas as bases A, T, C e G
    if ($dna_sequence !~ /^[ATCG]+$/i) {
        die "Erro: A sequencia deve conter apenas as letras A, T, C e G.\n";
    }

    # inicializa um hash para contar cada base (A, T, C, G)
    my %contagem = (
        'A' => 0,
        'T' => 0,
        'C' => 0,
        'G' => 0,
    );

    # percorre a sequência de DNA e conta as bases
    foreach my $base (split //, $dna_sequence) {
        $contagem{uc($base)}++ if exists $contagem{uc($base)};  # conta as bases maiúsculas
    }

    my $total_bases = length($dna_sequence);  # calcula o número total de bases na sequência

    # exibe a contagem e o percentual de cada base
    print "\nContagem e proporcoes de bases na sequencia de DNA:\n";
    foreach my $base (sort keys %contagem) {
        my $percentual = ($contagem{$base} / $total_bases) * 100;  # calcula o percentual da base
        printf "%s: %d (%.2f%%)\n", $base, $contagem{$base}, $percentual;  # exibe os resultados
    }
}

# função para tradução de RNA para proteína
sub translate_rna_to_protein {
    # tabela de códons RNA -> aminoácidos
    my %codon_table = (
        'AUG' => 'M', 'UUU' => 'F', 'UUC' => 'F',
        'UAA' => '*', 'UAG' => '*', 'UGA' => '*'
    );

    print "Digite a sequencia de RNA: ";  # solicita a sequência de RNA
    my $rna = <STDIN>;
    chomp($rna);  # remove a quebra de linha da entrada

    my $proteina = '';  # variável para armazenar a sequência de proteína

    # percorre a sequência de RNA em pedaços de 3 nucleotídeos (códons)
    for (my $i = 0; $i < length($rna); $i += 3) {
        my $codon = substr($rna, $i, 3);  # extrai o codon
        last if length($codon) < 3;  # se o codon for menor que 3 bases, termina a tradução
        $proteina .= $codon_table{$codon} // '?';  # adiciona o aminoácido correspondente ao codon
    }

    print "Sequencia de proteina: $proteina\n";  # exibe a sequência de proteína
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
    
    my $choice = <STDIN>;  # lê a escolha do usuário
    chomp($choice);  # remove a quebra de linha
    return $choice;  # retorna a opção escolhida
}

# programa principal
while (1) {
    my $choice = show_menu();  # chama a função de menu

    # verifica a opção escolhida e chama a função correspondente
    if ($choice == 1) {
        read_and_display_dna_rna();
    } elsif ($choice == 2) {
        count_cg_bases();
    } elsif ($choice == 3) {
        count_all_bases();
    } elsif ($choice == 4) {
        translate_rna_to_protein();
    } elsif ($choice == 5) {
        print "Saindo...\n";  # imprime mensagem e sai do loop
        last;
    } else {
        print "Opcao invalida! Tente novamente.\n";  # trata opções inválidas
    }
}
