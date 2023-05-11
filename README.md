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

![image](https://github.com/douglasalves0/nim-game-haskell/assets/81260717/1cd1f502-7d16-4e0c-bbb5-9e9feaee6975)

Link para o mapa: https://excalidraw.com/#json=cwhNg7nB5eGvZCaGwaVOZ,P9ILKHqmtWaUl6-FTzPr0g
### Legenda
#### Nós:
- **Azul** = Funções de utilidades (Funções que printam na tela, retornam as pilhas feitas, retornam as dificuldades, não necessariamente possuem a lógica do jogo por trás);
- **Amarelo** = Funções de lógica do jogo (Funções que possuem a lógica do jogo por trás, onde o jogo acontece);
- **Vermelho** = Funções de validação de entrada (Funções que validam as entradas dos jogadores);
- **Roxo** = Funções das engines de bot (Funções que representam o bot e seus cálculos);
- **Verde** = Fluxograma do jogo (Caminhos que podem ser tomados).
#### Textos:
- **Preto** = Textos de explicação da função (O que ela faz e como ela faz);
- **Laranja** = Textos de explicação da entrada da função (Variáveis, nomes e seus tipos);
- **Verde** = Textos de explicação da saída (Qual o tipo da saída e o que aquela saída representará no jogo).

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
