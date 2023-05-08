module Interface.StringsAndCommand where

import System.Process (callCommand)

-- Main Menu Strings
challengeTypes :: [String]
challengeTypes =
  [ "Desafio com 10 moedas --> Fácil:",
    "     Nesse desafio eu vou pegar leve com você!",
    "     Vou dividir 10 das minhas moedas em 3 pilhas,",
    "     vamor começar leve.",
    "",
    "Desafio com 15 moedas --> Médio:",
    "     Como eu havia avisado quanto maior a",
    "     recompensa maior o desafio, nesse serão",
    "     15 moedas, divididas em 4 pilhas",
    "     mas não se engane, não será fácil.",
    "",
    "Desafio com 20 moedas --> Difícil:",
    "",
    "     Esse eu sei que você nunca irá vencer",
    "     então irei te oferecer todo o resto de ",
    "     minhas moedas(20) divididas em 5 pilhas."
  ]

performsChallenge :: [String]
performsChallenge =
  [ "Para executar os desafio você deve digitar a pilha",
    "que deseja retirar as moedas e a quantidade de",
    "moedas que deseja retirar, por exemplo: ",
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
  ]

presentsChallengesPerforms :: String
presentsChallengesPerforms =
  unwords
    [ "Posso te confessar que isso será muito díficil, porém irei te ensinar",
      "como executar o desafio! [APERTE ENTER PARAR CONTINUAR]"
    ]

presentsChallengesTypes :: String
presentsChallengesTypes =
  unwords
    [ "Abaixo te apresento os meus desafios, caso esteja com medo de me enfrentar",
      "escolha um outro    jogador para dividir essa oportunidade de conquistar as",
      "minhas criptomoedas!                  ",
      "[APERTE ENTER PARAR CONTINUAR]"
    ]

presentsChallenges :: String
presentsChallenges =
  unwords
    [ "Te apresento os meus desafios, se conseguir me vencer você poderá levar",
      "as criptomoedas        respectivas de cada etapa.",
      "Lembre-se quanto maior o valor, maior a dificuldade! Digite um  dos desafios!"
    ]

challengesMenuTitle :: String
challengesMenuTitle = "DESAFIOS"

challengesMenuOptions :: [String]
challengesMenuOptions =
  [ "1 | Conquistar 10 moedas",
    "2 | Conquistar 15 moedas",
    "3 | Conquistar 20 moedas"
  ]

presentsOpponents :: String
presentsOpponents =
  unwords
    [ "Abaixo te apresento as duas maneiras para conquistar minhas criptomoedas,",
      "caso você queira     chamar um amigo para dividir essa oportunidade de ganhar",
      "as minhas criptomoedas lhe oferecerei 15 moedas. Digite uma das opções."
    ]

opponentsMenuTitle :: String
opponentsMenuTitle = "DESAFIANTE"

opponentsMenuOptions :: [String]
opponentsMenuOptions =
  [ "1 | Jogador",
    "2 | Gênio"
  ]

presentsMainChallenge :: String
presentsMainChallenge =
  unwords
    [ "Agora que você já conhece os meus desafios, já podemos iniciar um deles?",
      "Decida pois não quero perder o meu precioso tempo com pessoas indecisas.",
      "Digite uma das opções abaixo para darmos continuidade ao desafio."
    ]

presentsMainPerforms :: String
presentsMainPerforms =
  unwords
    [ "Pronto, já te dei dicas demais para que consiga executar os meus desafios,",
      "vamos conferir se é capaz? Decida se já está pronto(a) e digite uma das",
      "opções abaixo."
    ]

presentsWithdrawal :: String
presentsWithdrawal =
  "Eu já imaginava que você não seria forte o bastante!"

presentsValidEntry :: String
presentsValidEntry = "Digite uma opção válida para darmos continuidade ao desafio.                                       [APERTE ENTER PARAR CONTINUAR]"

initMenuTitle :: String
initMenuTitle = "VOCÊ ACEITA O DESAFIO?"

initMenuOptions :: [String]
initMenuOptions =
  [ "1 | Sim, vamos lá!",
    "2 | Não, deixa pra outro momento."
  ]

presentsMainMenu :: String
presentsMainMenu =
  "Bem vindo(a) ao desafio das criptomoedas, digite uma das opções abaixo!"

presentsInitialWithdrawal :: String
presentsInitialWithdrawal =
  "Quem desiste sem ao menos tentar uma vez não merece as minhas criptomoedas!"

mainMenuTitle :: String
mainMenuTitle = "DESAFIO DAS CRIPTOMOEDAS"

mainMenuOptions :: [String]
mainMenuOptions =
  [ "1 | Desafiar",
    "2 | Conhecer os desafios",
    "3 | Como executar os desafios",
    "4 | Sair"
  ]

presentsNamePlayer :: String
presentsNamePlayer =
  unwords
    [ "Antes de iniciarmos o desafio, gostaria de",
      "saber o seu nome, assim poderei te chamar pelo nome e não de desafiante.",
      "Digite o seu nome abaixo."
    ]

presentsNamePlayer1 :: String
presentsNamePlayer1 =
  unwords
    [ "Primeiro desafiante, antes de iniciarmos o desafio, gostaria de",
      "saber o seu nome, assim poderei te chamar pelo nome e não de desafiante.",
      "Digite o seu nome abaixo."
    ]

presentsNamePlayer2 :: String
presentsNamePlayer2 =
  unwords
    [ "Segundo desafiante, antes de iniciarmos o desafio, gostaria de",
      "saber o seu nome, assim poderei te chamar pelo nome e não de desafiante.",
      "Digite o seu nome abaixo."
    ]

presentsNameError :: String
presentsNameError = "Digite um nome válido para darmos continuidade ao desafio."

clear :: String
clear = "clear"

-- Star Game String
initialPresentation :: String
initialPresentation =
  unwords
    [ "Seja bem vindo(a)! Hoje é o seu dia de sorte, quer dizer, depende do",
      "que você considera sorte  HAHAHAHAHA. Primeiro tenho que lhe informar",
      "que atualmente não possuo mais desejos para lhe    oferecer, entretanto",
      "gostaria de lhe propor um desafio e em troca você ganhará todas as       ",
      "criptomoedas que estiverem disponíveis. Digite uma das opções abaixo."
    ]

-- Game Loop Strings
player1Turn :: String
player1Turn =
  unwords
    [ ", é a sua vez de jogar!                                                                           ",
      "[APERTE ENTER PARAR CONTINUAR E INFORMAR SUA JOGADA.]"
    ]

player1Winner :: String
player1Winner =
  unwords
    [ ", você venceu o desafio!",
      "Agora você pode levar todas as minhas criptomoedas!         ",
      "Use essa chave para acessar a carteira digital.                                              ",
      "  ----------> Chave de acesso: 86357cd29761145ac5aecaa3b8053f0d2c809b6387ff11a318d4898282db6b3d",
      "Obrigado por me desafiar, me diverti com você!"
    ]

player2Winner :: String
player2Winner =
  unwords
    [ ", você venceu o desafio!",
      "Agora você pode levar todas as minhas criptomoedas!       ",
      "Use essa chave para acessar a carteira digital.                                              ",
      "  ----------> Chave de acesso: 86357cd29761145ac5aecaa3b8053f0d2c809b6387ff11a318d4898282db6b3d",
      "Agora você quem decide se irá dividir as criptomoedas com o seu amigo ou não."
    ]

player2Turn :: String
player2Turn =
  unwords
    [ ", é a sua vez de jogar!                                                                   ",
      "[APERTE ENTER PARAR CONTINUAR E INFORMAR SUA JOGADA.]"
    ]

gennieWinner :: String
gennieWinner =
  unwords
    ["Você não conseguiu me vencer, sinto lhe informar mas eu já esperava!                                                            "]

wallet10Title :: String
wallet10Title = "CARTEIRA DIGITAL COM AS 10 CRIPTOMOEDAS"

wallet10 :: [String]
wallet10 =
  [ "    ¢        ¢       ¢        ¢       ¢       ",
    "      ¢        ¢       ¢        ¢       ¢       "
  ]

wallet15Title :: String
wallet15Title = "CARTEIRA DIGITAL COM AS 15 CRIPTOMOEDAS"

wallet15 :: [String]
wallet15 =
  [ "    ¢        ¢       ¢        ¢       ¢       ",
    "      ¢        ¢       ¢        ¢       ¢       ",
    "    ¢        ¢       ¢        ¢       ¢       "
  ]

wallet20Title :: String
wallet20Title = "CARTEIRA DIGITAL COM AS 20 CRIPTOMOEDAS"

wallet20 :: [String]
wallet20 =
  [ "    ¢        ¢       ¢        ¢       ¢       ",
    "      ¢        ¢       ¢        ¢       ¢       ",
    "    ¢        ¢       ¢        ¢       ¢       ",
    "      ¢        ¢       ¢        ¢       ¢       "
  ]

-- GetPlayerInput Strings
takeStack :: String
takeStack = "Digite a pilha que deseja retirar moedas: "

takeCoins :: String
takeCoins = "Digite a quantidade de moedas que deseja retirar da pilha informada: "

-- Command Clear
clearT :: IO ()
clearT = callCommand clear