# Sumário
1. [História do jogo](#Jogo do nim)

# Jogo do nim
Nim é um gênio que perdeu todos os seus desejos para o mercado financeiro, agora ele só tem moedas.
Porém, ele está disposto a da-las para você caso você seja bom o suficiente para vencê-lo no jogo dele.
``` 
                                                                                            /}
                                                                                         ./`|´\
                                                                                         |_~?¬_`\
                                                                                          ¬^Ö `>/
                                                                                          ~~~ /_
                                                                                        - )¨/    ¨-
      $$                                                                             ,-´ _ _    /  \
      $$                                                                             >-'´  ~`\_/   |
      $$                                                                            ( _ .´  `-´  -´/
      $$                                                          @                  `'´  `¬_   _//
      $$                                                         ( )                   |     ¨'¨_/
      $$                                                        /===\                   \      /
      $$                                               ,-`-._.-´¨¨¨¨ ¨¬_..---.           \     |
      $$      $$                      $$              ((¨,¨\ ¨-._____.--¨ .¬--\..^,     .,)    /
      $$      $$              $$      $$               \'-°^\::          /     '{  3   {¨.:   /
      $$      $$              $$      $$                      \    _    /          ¨~.´'y`,¨\~¨
      $$      $$      $$      $$      $$                       ¨¨\- -/¨¨              ¨¬.{ .3´
      $$      $$      $$      $$      $$                       _,-´ `-_                   ¨
     [--]    [--]    [--]    [--]    [--]                      `-------´
```
No jogo de nim várias moedas são distribuídas em pilhas diferentes, duas pessoas competem retirando entre 1 a 3 moedas por vez.
O jogador que tirar a última moeda da última pilha ganha o jogo e fica com a última moeda

[GDD](https://docs.google.com/document/d/1nVfF6Y8iGiXYGT0KAk8fnfvtpAoslR0qrq0_m6Bhn2w/edit?usp=sharing)

# PLP
Este github é produto do projeto em grupo da matéria _paradigmas de linguagens de programação_.
Ao longo do período esse jogo será desenvolvido por 5 pessoas em duas linguagens de programação com paradigmas diferentes
- haskell (paradigma funcional)
- prolog (paradigma logico)
---

## Arquitetura
A arquitetura e conexão entre os módulos da aplicação usada para basear a implementação está representada nesse fluxograma, definindo o que cada função/módulo faz e suas devidas entradas e saídas.
### Legenda dos nós:
- Azuis = Funções de utilidades;
- Laranja = Funções de lógica do jogo;
- Vermelho = Funções de validação de entrada;
- Roxo = Funções das engines de bot;
- Verde = Fluxograma do jogo.

## Jogando em **Haskell**
Para conseguir executar o código em haskell é necessário baixar a biblioteca Random
> cabal install --lib random

Após isso é possível jogá-lo sem nem precisar compilar usando esse código dentro da pasta src:
> runghc StartGame.hs

---

# Equipe
| Nome                            | Matrícula | E-mail                           |
| :-----------------------------  | :-------: |  ------------------------------: |
|Douglas Alves de Sousa           | 121111728 |douglas.sousa@ccc.ufcg.edu.br     |
|Gabriel Pombo Almeida Cirne Diniz| 121111468 | gabriel.diniz@ccc.ufcg.edu.br    |
|Guilherme Silva Toledo           | 121110792 | guilherme.toledo@ccc.ufcg.edu.br |
|Jackson Alves da Silva Souza     | 121110759 | jackson.souza@ccc.ufcg.edu.br    |
|Mayara Brito Pinheiro            | 121110615 | mayara.pinheiro@ccc.ufcg.edu.br  |
