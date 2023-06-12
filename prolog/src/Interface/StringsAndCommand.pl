challengeTypes(Lista) :-
    Lista = [
        "Desafio com 10 moedas --> Fácil:",
        "  Nesse desafio eu vou pegar leve com você!",
        "  Vou dividir 10 das minhas moedas em 3 pilhas,",
        "  vamos começar leve.",
        "",
        "Desafio com 15 moedas --> Médio:",
        "  Como eu havia avisado quanto maior a",
        "  recompensa maior o desafio, nesse serão",
        "  15 moedas, divididas em 4 pilhas",
        "  mas não se engane, não será fácil.",
        "",
        "Desafio com 20 moedas --> Difícil:",
        "",
        "  Esse eu sei que você nunca irá vencer",
        "  então irei te oferecer todo o restante das ",
        "  minhas moedas(20) divididas em 5 pilhas."
    ].

performsChallenge(Lista) :-
    Lista = [
        "Para executar os desafio você deve digitar a pilha",
        "que deseja retirar as moedas e a quantidade de",
        "moedas, um valor por vez, veja esse exemplo: ",
        " -------> (1 2) irá retirar 2 moedas da pilha 1.",
        "",
        "Lembre-se que você só pode retirar moedas de uma",
        "pilha por vez, e que você não pode retirar mais",
        "moedas do que a pilha possui.",
        "",
        "Caso você digite uma pilha que não existe ou uma",
        "quantidade de moedas maior do que a pilha possui,",
        "vou ser bondoso contigo e vou te avisar, e ainda",
        "te dar outra chance de digitar a opção correta.",
        "",
        "Você conquista as minhas moedas quando sua última",
        "jogada zerar todas as pilhas, caso contrário eu",
        "ficarei com as moedas e você perde o desafio."
    ].

presentsChallengesPerforms(String) :-
    Lista = [
        "Posso te confessar que isso será muito difícil,",
        "porém irei te ensinar como executar o desafio!",
        "[APERTE ENTER PARA CONTINUAR]"
    ],
    atomics_to_string(Lista, ' ', String).

presentsChallengesTypes(String) :-
    Lista = [
        "Abaixo te apresento os meus desafios, caso esteja com medo de me enfrentar",
        "escolha um outro jogador para dividir essa oportunidade de conquistar as",
        "minhas criptomoedas!"
    ],
    atomics_to_string(Lista, ' ', String).

presentsChallenges(String) :-
    Lista = [
        "Te apresento os meus desafios, se conseguir me vencer você poderá levar",
        "as criptomoedas respectivas de cada etapa. Digite um dos desafios!"
    ],
    atomics_to_string(Lista, ' ', String),
    !.

challengesMenuTitle(Title) :-
    Title = "DESAFIOS".

challengesMenuOptions(Lista) :-
    Lista = [
        "1 | Conquistar 10 moedas",
        "2 | Conquistar 15 moedas",
        "3 | Conquistar 20 moedas"
    ].

presentsOpponents(String) :-
    Lista = [
        "Abaixo te apresento as duas maneiras para conquistar minhas criptomoedas,",
        "caso você queira chamar um amigo para dividir essa oportunidade de ganhar",
        "as minhas criptomoedas, lhe oferecerei 15 moedas. Digite uma das opções."
    ],
    atomic_list_concat(Lista, ' ', String).

opponentsMenuTitle(Title) :-
    Title = "DESAFIANTE".

opponentsMenuOptions(Lista) :-
    Lista = [
        "1 | Jogador",
        "2 | Gênio"
    ].

presentsMainChallenge(String) :-
    Lista = [
        "Agora que você já conhece os meus desafios, já podemos iniciar um deles?",
        "Decida pois não quero perder o meu precioso tempo com pessoas indecisas.",
        "Digite uma das opções abaixo para darmos continuidade ao desafio."
    ],
    atomic_list_concat(Lista, ' ', String).

presentsMainPerforms(String) :-
    Lista = [
        "Pronto, já te dei dicas demais para que consiga executar os meus desafios,",
        "vamos conferir se é capaz? Decida se já está pronto(a) e digite uma das",
        "opções abaixo."
    ],
    atomic_list_concat(Lista, ' ', String).

presentsWithdrawal(String) :-
    String = "Eu já imaginava que você não seria forte o bastante!".

presentsValidEntry(String) :-
    String = "Digite uma opção válida para darmos continuidade ao desafio. [APERTE ENTER PARAR CONTINUAR]".    

initMenuTitle(String) :-
    String = "VOCÊ ACEITA O DESAFIO?".

initMenuOptions(Lista) :-
    Lista = [ 
        "1 | Sim, vamos lá!",
        "2 | Não, deixa pra outro momento."
    ].

presentsMainMenu(String) :-
    String = "Bem vindo(a) ao desafio das criptomoedas, digite uma das opções abaixo!".

presentsInitialWithdrawal(String) :-
    String =  "Quem desiste sem ao menos tentar uma vez não merece as minhas criptomoedas!".

mainMenuTitle(Title) :-
    Title = "DESAFIO DAS CRIPTOMOEDAS".

mainMenuOptions(Lista) :-
    Lista = [ 
        "1 | Desafiar",
        "2 | Conhecer os desafios",
        "3 | Como executar os desafios",
        "4 | Sair"
    ].

presentsNamePlayer(String) :-
    Lista = [
        "Antes de iniciarmos o desafio, gostaria de saber o seu nome, assim poderei",
        "te chamar pelo nome e não de desafiante. Digite o seu nome abaixo."
    ],
    atomic_list_concat(Lista, ' ', String).

presentsNamePlayer1(String) :-
    Lista = [
        "Primeiro desafiante, antes de iniciarmos o desafio, gostaria de",
        "saber o seu nome, assim poderei te chamar pelo nome e não de desafiante.",
        "Digite o seu nome abaixo."
    ],
    atomic_list_concat(Lista, ' ', String).

presentsNamePlayer2(String) :-
    Lista = [
        "Segundo desafiante, antes de iniciarmos o desafio, gostaria de",
        "saber o seu nome, assim poderei te chamar pelo nome e não de desafiante.",
        "Digite o seu nome abaixo."
    ],
    atomic_list_concat(Lista, ' ', String).

presentsNameError(String) :-
    String =  "Digite um nome válido para darmos continuidade ao desafio.".

initialPresentation(String) :-
    Lista = [
        "Seja bem vindo(a)! Hoje é o seu dia de sorte, quer dizer, depende do",
        "que você considera sorte HAHAHAHAHA. Primeiro tenho que lhe informar",
        "que atualmente não possuo mais desejos para lhe oferecer, entretanto",
        "gostaria de lhe propor um desafio e em troca você ganhará todas as ",
        "criptomoedas que estiverem disponíveis. Digite uma das opções abaixo."
    ],
    atomic_list_concat(Lista, ' ', String).

player1Turn(String) :-
    Lista = [
        ", é a sua vez de jogar!                                                                        ",
        "[APERTE ENTER PARA CONTINUAR E INFORMAR SUA JOGADA.]"
    ],
    atomic_list_concat(Lista, ' ', String).

player1Winner(String) :-
    Lista = [
        ", você venceu o desafio!",
        "Agora você pode levar todas as minhas criptomoedas! ",
        "Use essa chave para acessar a carteira digital:                                         ",
        "  ----------> Chave de acesso: 86357cd29761145ac5aecaa3b8053f0d2c809b6387ff11a318d4898282db6b3d",
        "Obrigado por me desafiar, me diverti com você!"
    ],
    atomic_list_concat(Lista, ' ', String).

player2Winner(String) :-
    Lista = [
        ", você venceu o desafio!",
        "Agora você pode levar todas as minhas criptomoedas!       ",
        "Use essa chave para acessar a carteira digital:                                              ",
        "  ----------> Chave de acesso: 86357cd29761145ac5aecaa3b8053f0d2c809b6387ff11a318d4898282db6b3d",
        "Agora você quem decide se irá dividir as criptomoedas com o seu amigo ou não."
    ],
    atomic_list_concat(Lista, ' ', String).

player2Turn(String) :-
    Lista = [
        ", é a sua vez de jogar!                                                                        ",
        "[APERTE ENTER PARA CONTINUAR E INFORMAR SUA JOGADA.]"
    ],
    atomic_list_concat(Lista, ' ', String).

gennieWinner(String) :-
    String =  "Você não conseguiu me vencer, sinto lhe informar mas eu já esperava!".

wallet10Title(String) :-
    String =  "CARTEIRA DIGITAL COM AS 10 CRIPTOMOEDAS".

wallet10(Lista) :-
    Lista = [ 
        "    $        $       $        $       $       ",
        "      $        $       $        $       $       "
    ].

wallet15Title(String) :-
    String =  "CARTEIRA DIGITAL COM AS 15 CRIPTOMOEDAS".

wallet15(Lista) :-
    Lista = [ 
        "    $        $       $        $       $       ",
        "      $        $       $        $       $       ",
        "    $        $       $        $       $       "
    ].

wallet20Title(String) :-
    String =  "CARTEIRA DIGITAL COM AS 20 CRIPTOMOEDAS".

wallet20(Lista) :-
    Lista = [ 
         "    $       $       $        $       $       ",
        "      $        $       $        $       $       ",
        "    $        $       $        $       $       ",
        "      $        $       $        $       $       "
    ].    

takeStack(String) :-
    String =  "Digite a pilha que deseja retirar moedas: ".

takeCoins(String) :-
    String =   "Digite a quantidade de moedas que deseja retirar da pilha informada: ".

presentsValidEntryNumber(String) :-
    String =  "Digite um número positivo válido!".

presentsValidEntryPositive(String) :-
    String =  "O valor de moedas deve ser um número positivo.".

presentsValidEntryNumberStack(String) :-
    String =  "O valor da pilha dever ser um número positivo.".

presentsValidEntryStack(String) :-
    String =  "Escolha uma pilha válida para retirar as moedas.".

presentsValidEntryCoins(String) :-
    String =  "Você só pode retirar entre 1 ou 3 moedas por pilha por vez.".

presentsValidEntryStackCoins(String) :-
    String =  "Você não pode retirar um valor maior de uma pilha menor.".

clearT :-
    current_prolog_flag(windows, true), !,
    shell('cls'), ! .

clearT :-
    current_prolog_flag(unix, true), ! ,
    shell('clear'), ! .

input(X) :- 
  read_line_to_codes(user_input, X2),
  string_to_atom(X2,X).
