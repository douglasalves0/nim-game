module GeniusDraw.DrawingFunctions where
-- Genie drawing function
getGennie:: Int -> String
getGennie 1 = "\\|  /}      "
getGennie 2 = "./`|´\\     "
getGennie 3 = "|_~?¬_`\\   "
getGennie 4 = "¬^Ö `>/   "
getGennie 5 = "~~~ /_    "
getGennie 6 = "- )¨/    ¨- "
getGennie 7 = ",-´ _ _    /  \\"
getGennie 8 = ">-'´  ~`\\_/   |"
getGennie 9 = "( _ .´  `-´  -´/"
getGennie 10 = "@                  `'´  `¬_   _// "
getGennie 11 = "( )                   |     ¨'¨_/  "
getGennie 12 = "/===\\                   \\      /    "
getGennie 13 = ",-`-._.-´¨¨¨¨ ¨¬_..---.           \\     |    "
getGennie 14 = "((¨,¨\\ ¨-._____.--¨ .¬--\\..^,     .,)    /    "
getGennie 15 = "\\'-°^\\::          /     '{  3   {¨.:   /     "
getGennie 16 = "\\    _    /          ¨~.´'y`,¨\\~¨      "
getGennie 17 = "¨¨\\- -/¨¨              ¨¬.{ .3´       "
getGennie 18 = "_,-´ `-_                   ¨          "
getGennie 19 = "`-------´                             "

fillSpacesFront:: Int -> String -> String
fillSpacesFront n str = take (n-length str) ([' ' | x <- [1..n]]) ++ str

fitGenie:: Int -> Int -> String
fitGenie spaces index = fillSpacesFront spaces (getGennie index)

drawGenieLoop:: Int -> Int-> String
drawGenieLoop 1 spaces = fitGenie spaces 1
drawGenieLoop index spaces = drawGenieLoop (index-1) spaces ++ "\n" ++ fitGenie spaces index

drawGenie:: Int -> Int -> IO()
drawGenie index spaces = do
    putStrLn (drawGenieLoop index spaces)


-- speach bubble
makeSpeachBubble:: Int -> Int -> String -> String
makeSpeachBubble 0 spaces "1" = "/"++['-' | x <- [1..spaces]]++"\\"
makeSpeachBubble 0 spaces "2" = "|"++[' ' | x <- [0..spaces]]++"\\"
makeSpeachBubble 0 spaces "3" = "\\"++['-' | x <- [1..spaces]]++"_ \\"
makeSpeachBubble index spaces str = "|" ++ fitText (index-1) spaces str ++ "|"

fillSpacesLast:: Int -> String -> String
fillSpacesLast n str = str ++ [' ' | x <- [1..n-length str]]

fitText:: Int -> Int -> String -> String
fitText index size str = fillSpacesLast size (take size (drop (index*size) str))

drawSpeachBubbleLoop:: Int -> Int -> String -> String
drawSpeachBubbleLoop 0 spaces str = makeSpeachBubble 0 spaces "1"
drawSpeachBubbleLoop index spaces str = drawSpeachBubbleLoop (index-1) spaces str ++ "\n" ++ makeSpeachBubble index spaces str

drawSpeachBubble:: Int -> String -> IO()
drawSpeachBubble spaces str = do
    putStrLn (drawSpeachBubbleLoop (div (length str) spaces + 1) spaces str)
    putStrLn (makeSpeachBubble 0 spaces "2")
    putStrLn (makeSpeachBubble 0 spaces "3")

-- menu
fitToMiddle:: String -> String -> String
fitToMiddle str1 str2 = take (div (length str1-length str2) 2) str1 ++ str2 ++ drop (div (length str1+length str2) 2) str1

blankMenuBox:: Int -> String
blankMenuBox n = "|"++[' ' | x <- [1..n]]++"|"

boxDivider:: Int -> String
boxDivider n = "|"++['-' | x <- [1..n]]++"|"

createItem:: Int -> String -> [String]
createItem size str = [boxDivider size] ++
                        [blankMenuBox size] ++
                        [fitToMiddle (blankMenuBox size) str] ++
                        [blankMenuBox size]

createMenu:: Int -> [String] -> [String]
createMenu size = foldr ((++) . createItem size) [boxDivider size]

fullMenu:: Int ->String -> [String] -> [String]
fullMenu size menuName options = [fitToMiddle (blanks size) menuName] ++ [""] ++ createMenu size options ++ createBlankLines (4*(4-length options))

createBlankLines:: Int -> [String]
createBlankLines n = [" " | x <- [1..n]]

drawGenieWMenuLoop:: Int -> Int -> [String] -> String
drawGenieWMenuLoop 1 spaces l = insert (div (spaces-20) 4) (fitGenie spaces 19) (head l)
drawGenieWMenuLoop index spaces (x:xs) = insert (div (spaces-20) 4) (fitGenie spaces (20-index)) x ++ "\n" ++ drawGenieWMenuLoop (index-1) spaces xs

drawGenieWmenu:: Int -> Int -> Int -> String -> [String] -> IO()
drawGenieWmenu index spaces menuSize menuName options = do
    putStrLn (drawGenieWMenuLoop index spaces (fullMenu menuSize menuName options))

-- hint
createHint::Int -> [String] -> [String]
createHint size l = [boxDivider size] ++ ["|" ++ fillSpacesLast size x ++"|"| x <- l] ++ [boxDivider size]

fullHint:: Int -> [String] -> [String]
fullHint size l = createHint size l ++ createBlankLines (19-length l)

drawHintLoop:: Int -> Int -> [String] -> String
drawHintLoop 1 spaces l = insert 4 (fitGenie spaces 19) (head l)
drawHintLoop index spaces (x:xs) = insert 4 (fitGenie spaces (20-index)) x ++ "\n" ++ drawHintLoop (index-1) spaces xs

drawHint:: Int -> Int -> Int -> [String] -> IO()
drawHint index spaces menuSize l = do
    putStrLn (drawHintLoop index spaces (fullHint menuSize l))


-- stacks
insert :: Int -> String -> String-> String
insert index str1 str2 = take index str1 ++ str2 ++ drop (index + length str2) str1

blanks:: Int -> String
blanks n = [' ' | x <- [1..n]]

drawBases:: Int -> String
drawBases n =  blanks n ++ "[--]"

drawMoney:: Int -> Int -> String
drawMoney x y| x >= y = blanks (4+2) ++ "¢¢"
             | otherwise = blanks (4+2) ++ "  "

drawStackPillars:: [Int] ->  Int -> String
drawStackPillars [] length = ""
drawStackPillars (x:xs) length = drawMoney x (19-length) ++ drawStackPillars xs length

drawStackBase:: [Int]  -> Int -> Int -> String
drawStackBase l 1 length = drawBases length
drawStackBase l n length = drawStackBase l (n-1) length ++ drawBases length

drawGenieWStacks:: [Int] -> Int -> Int -> IO()
drawGenieWStacks l 19 spaces = do
    putStrLn (insert 0 (fillSpacesFront spaces (getGennie 19)) (" " ++ drawStackBase l (length l) 4))
drawGenieWStacks l index spaces = do
    putStrLn (insert 0 (fillSpacesFront spaces (getGennie index)) (drawStackPillars l index))

drawGenieStacksLoop:: [Int] -> Int -> Int-> IO()
drawGenieStacksLoop l 1 spaces = drawGenieWStacks l 1 spaces
drawGenieStacksLoop l n spaces = do
    drawGenieStacksLoop l (n-1) spaces
    drawGenieWStacks l n spaces

--main function
drawStartGenie:: String -> IO()
drawStartGenie str = do
    drawSpeachBubble 95 str
    drawGenie 19 110
    putStrLn " "

drawMenuGenie:: String -> String -> [String] -> IO()
drawMenuGenie speach menuName options = do
    drawSpeachBubble 95 speach
    drawGenieWmenu 19 110 30 menuName options
    putStrLn " "

drawHintGenie:: String -> [String] -> IO()
drawHintGenie speach l = do
    drawSpeachBubble 95 speach
    drawHint 19 110 50 l
    putStrLn " "

drawGameLoop:: [Int] -> String -> IO()
drawGameLoop l str = do
    drawSpeachBubble (110-15) str
    drawGenieStacksLoop l 19 110
    putStrLn " "
