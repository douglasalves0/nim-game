getGennie(1,'\\|  /}      ').
getGennie(2,'./`|\'\\     ').
getGennie(3,'|_~?-_`\\   ').
getGennie(4,'-^O `>/   ').
getGennie(5,'~~~ /_    ').
getGennie(6,'- )\'/    \'- ').
getGennie(7,',-\' _ _    /  \\').
getGennie(8,'>-\'\'\'  ~`\\_/   |').
getGennie(9,'( _ .\'  `-\'  -\'/').
getGennie(10,'@                  \`\'\'  \`-_   _// ').
getGennie(11,'( )                   |     \'\'\'_/  ').
getGennie(12,'/===\\                   \\      /    ').
getGennie(13,',-`-._.-\'\'\'\'\' \'-_..---.           \\     |    ').
getGennie(14,'((\\\'\',\'\\ \'-._____.--\' .---\\..^,     .,)    /    ').
getGennie(15,'\\\'-*^\\::          /     \'{  3   {\'.:   /     ').
getGennie(16,'\\    _    /          \'~.\'\'y`,\'\\~\'      ').
getGennie(17,'\'\'\\- -/\'\'              \'-.{ .3\'       ').
getGennie(18,'_,-\' `-_                   \'          ').
getGennie(19,'`-------\'                             ').

% desenhar o genio
makeSpace(0):- write(""),!.
makeSpace(N):-
    N2 is N - 1,
    write(" "),
    makeSpace(N2).

makeLine(0):- write("").
makeLine(N):-
    N2 is N - 1,
    write("-"),
    makeLine(N2).

fillGenie(_,0):- write("").

fillGenie(N,GenieSize):-
    NextGenie is GenieSize - 1,
    fillGenie(N,NextGenie),
    makeGenie(N,GenieSize).

%desenhar o genio com suas pilhas
drawStack() :-
    makeSpace(2),
    write("[--]").

fillStackGenie([_],N):-
    drawStack(),
    getGennie(19,Genie),
    atom_chars(Genie,GenieList),
    length(GenieList,Length),
    Nspace is N - Length - 6 -1,
    makeSpace(Nspace),write(Genie),nl.

fillStackGenie([_|T],N):-
    drawStack(),
    NextN is N - 6,
    fillStackGenie(T,NextN).

drawCoins(X,N) :-
    makeSpace(4),
    (X >= 19-N -> write("$$") ; write("  ")).

fillCoinsGenie(L,N,19):-
    makeSpace(1),
    fillStackGenie(L,N).

fillCoinsGenie([H],N,GenieSize):-
    drawCoins(H,GenieSize),
    getGennie(GenieSize,Genie),
    atom_chars(Genie,GenieList),
    length(GenieList,Length),
    Nspace is N - Length - 6,
    makeSpace(Nspace),write(Genie),nl.

fillCoinsGenie([H|T],N,GenieSize):-
    drawCoins(H,GenieSize),
    NextN is N - 6,
    fillCoinsGenie(T,NextN,GenieSize).

coinDrawLoop(_,_,0):- write(""),!.

coinDrawLoop(L,N,GenieSize):-
    NextGenie is GenieSize - 1,
    coinDrawLoop(L,N,NextGenie),
    fillCoinsGenie(L,N,GenieSize).
    
% desenhar a fala do genio
topSpeechBubble(0):- write("\\"),nl.

topSpeechBubble(N) :-
    N2 is N - 1,
    write("-"),
    topSpeechBubble(N2).

startTopSpeechBubble(N):- 
    write("/"),
    topSpeechBubble(N).

bottomSpeechBubble(0):- write('_ \\'),nl,!.

bottomSpeechBubble(N) :-
    N2 is N - 1,
    write("-"),
    bottomSpeechBubble(N2).

startLine(Size,[]) :-
    write('|'),
    bottomSpeechBubble(Size).

startLine(Size,LText) :-
    write('|'),
    writeLine(Size,Size,LText),
    write('|'),
    bottomSpeechBubble(Size-1).

writeLine(_,Size,[]) :-
    makeSpace(Size),write('|'),!.

writeLine(_,Size,[X]) :-
    atom_chars(X,WList),
    length(WList,Length),
    Nsize is Size - Length,
    write(X),
    makeSpace(Nsize),write('|'),nl,!.

writeLine(Max,Size,[X|T]) :-
    atom_chars(X,WList),
    length(WList,Length),
    Nsize is Size - Length -1,
    ( Nsize >= 0  ->
        (write(X),write(" "), writeLine(Max, Nsize,T)) ;
        makeSpace(Size),write('|'),nl,write('|'),writeLine(Max,Max,[X|T])
        ).

% desenhar o menu com o genio
genieMenu(MenuName,Menu,MenuWidth,LineWidth) :-
    atom_chars(MenuName,MenuNameList),
    length(MenuNameList,MenuNameLength),
    HMenuW is div(MenuWidth,2),
    NlineW is LineWidth - 4 - HMenuW - MenuNameLength,
    makeSpace(4+HMenuW),write(MenuName),makeGenie(NlineW,1),
    makeGenie(LineWidth,2),
    makeSpace(4),write('|'),makeLine(MenuWidth),write('|'),
    Nline2 is LineWidth - 6 - MenuWidth,makeGenie(Nline2,3),
    genieMenuLoop(Menu,MenuWidth,LineWidth,4).

genieMenuLoop([],_,_,20):- write(""),!.

genieMenuLoop([],MenuWidth,LineWidth,GenieSize) :-
    makeGenie(LineWidth,GenieSize),
    NextGenie is GenieSize + 1,
    genieMenuLoop([],MenuWidth,LineWidth,NextGenie).

genieMenuLoop([X],MenuWidth,LineWidth,GenieSize) :-
    genieMenuLine(X,MenuWidth,LineWidth,GenieSize),
    NextGenie is GenieSize + 4,
    genieMenuLoop([],MenuWidth,LineWidth,NextGenie).

genieMenuLoop([X|T],MenuWidth,LineWidth,GenieSize) :-
    genieMenuLine(X,MenuWidth,LineWidth,GenieSize),
    NextGenie is GenieSize + 4,
    genieMenuLoop(T,MenuWidth,LineWidth,NextGenie).

genieMenuLine(X,MenuWidth,LineWidth,GenieSize) :-
    makeMenuLine(MenuWidth,LineWidth,GenieSize),

    makeSpace(4),write('|'),write(X),
    atom_chars(X,MenuList),
    length(MenuList,MenuLength),
    makeSpace(MenuWidth-MenuLength),write('|'),
    Nwidth is LineWidth - 6 - MenuWidth,
    SGenieSize is GenieSize + 1,
    makeGenie(Nwidth,SGenieSize),

    TGenieSize is GenieSize + 2,
    makeMenuLine(MenuWidth,LineWidth,TGenieSize),

    makeSpace(4),write('|'),makeLine(MenuWidth),write('|'),
    Nwidth2 is LineWidth - 6 - MenuWidth,
    BottomGenie is GenieSize + 3,
    makeGenie(Nwidth2,BottomGenie).

makeMenuLine(MenuWidth,LineWidth,GenieSize) :-
    makeSpace(4),write('|'),makeSpace(MenuWidth),write('|'),
    Nwidth is LineWidth - 6 - MenuWidth,
    makeGenie(Nwidth,GenieSize).

makeGenie(LineWidth,GenieSize) :-
    getGennie(GenieSize,Genie),
    atom_chars(Genie,GenieList),
    length(GenieList,Length),
    makeSpace(LineWidth-Length),write(Genie),nl.

% funcoes para desenhar as dicas
genieHint(Hint,MenuWidth,LineWidth) :-
    makeSpace(4),write('|'),makeLine(MenuWidth),write('|'),
    Nwidth is LineWidth - 6 - MenuWidth,
    makeGenie(Nwidth,1),
    genieHintLoop(Hint,MenuWidth,LineWidth,2).

genieHintLoop([],_,_,20):- write(""),!.

genieHintLoop([],_,LineWidth,GenieSize) :-
    makeGenie(LineWidth,GenieSize),
    NextGenie is GenieSize + 1,
    genieHintLoop([],_,LineWidth,NextGenie).

genieHintLoop([Hint],MenuWidth,LineWidth,GenieSize) :-
    genieHintLine(Hint,MenuWidth,LineWidth,GenieSize),
    makeSpace(4),write('|'),makeLine(MenuWidth),write('|'),
    Nwidth is LineWidth - 6 - MenuWidth,
    BottomGenie is GenieSize + 1,
    makeGenie(Nwidth,BottomGenie),
    NextGenie is GenieSize + 2,
    genieHintLoop([],MenuWidth,LineWidth,NextGenie).

genieHintLoop([Hint|T],MenuWidth,LineWidth,GenieSize) :-
    genieHintLine(Hint,MenuWidth,LineWidth,GenieSize),
    NextGenie is GenieSize + 1,
    genieHintLoop(T,MenuWidth,LineWidth,NextGenie).

genieHintLine(Hint,MenuWidth,LineWidth,GenieSize) :-
    makeSpace(4),write('|'),write(Hint),
    atom_chars(Hint,MenuList),
    length(MenuList,MenuLength),
    makeSpace(MenuWidth-MenuLength),write('|'),
    Nwidth is LineWidth - 6 - MenuWidth,
    makeGenie(Nwidth,GenieSize).

% funcoes para desenhar o genio
drawStartGenie(Text) :- 
    SpeechBubbleSize = 96,
    GenieSize = 19,
    LineWidth = 110,
    split_string(Text, ' ', '', LText),
    startTopSpeechBubble(SpeechBubbleSize),
    startLine(SpeechBubbleSize,LText),
    fillGenie(LineWidth,GenieSize).

drawMenuGenie(Text,MenuName,Menu) :-
    SpeechBubbleSize = 96,
    LineWidth = 110,
    MenuWidth = 52,
    split_string(Text, ' ', '', LText),
    startTopSpeechBubble(SpeechBubbleSize),
    startLine(SpeechBubbleSize,LText),
    genieMenu(MenuName,Menu,MenuWidth,LineWidth).

drawHintGenie(Text,Hint) :-
    SpeechBubbleSize = 96,
    LineWidth = 110,
    MenuWidth = 52,
    split_string(Text, ' ', '', LText),
    startTopSpeechBubble(SpeechBubbleSize),
    startLine(SpeechBubbleSize,LText),
    genieHint(Hint,MenuWidth,LineWidth).

drawGameLoop(Stack,Text) :-
    SpeechBubbleSize = 96,
    GenieSize = 19,
    LineWidth = 110,
    split_string(Text, ' ', '', LText),
    startTopSpeechBubble(SpeechBubbleSize),
    startLine(SpeechBubbleSize,LText),
    coinDrawLoop(Stack,LineWidth,GenieSize).
