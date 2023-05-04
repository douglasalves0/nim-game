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

drawGenie:: Int -> Int -> IO()
drawGenie spaces index = do
    putStrLn (fillSpacesFront spaces (getGennie index))

drawGenieLoop:: Int -> Int-> IO()
drawGenieLoop 1 spaces = drawGenie spaces 1
drawGenieLoop n spaces = do
    drawGenieLoop (n-1) spaces
    drawGenie spaces n


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

-- stacks
insert :: Int -> String -> String-> String
insert index str1 str2 = take index str1 ++ str2 ++ drop (index + length str2) str1

blanks:: Int -> String
blanks n = [' ' | x <- [1..n]]

drawBases:: Int -> String
drawBases n =  blanks n ++ "[--]"

drawMoney:: Int -> Int -> String
drawMoney x y| x >= y = blanks (4+2) ++ "$$"
             | otherwise = blanks (4+2) ++ "  " 

drawStackPillars:: [Int] ->  Int -> String
drawStackPillars [] length = ""
drawStackPillars (x:xs) length = drawMoney x (19-length) ++ drawStackPillars xs length

drawStackBase:: [Int] -> Int -> Int -> Int -> String
drawStackBase l 0 1 length = drawBases length
drawStackBase l 0 n length = drawStackBase l 0 (n-1) length ++ drawBases length

-- drawOponentLoop:: Int -> Int -> String -> String
drawGenieWStacks:: [Int] -> Int -> Int -> IO()
drawGenieWStacks l 19 spaces = do
    putStrLn (insert 0 (fillSpacesFront spaces (getGennie 19)) (" " ++ drawStackBase l 0 (length l) 4))
drawGenieWStacks l index spaces = do
    putStrLn (insert 0 (fillSpacesFront spaces (getGennie index)) (drawStackPillars l index))

drawGenieStacksLoop:: [Int] -> Int -> Int-> IO()
drawGenieStacksLoop l 1 spaces = drawGenieWStacks l 1 spaces
drawGenieStacksLoop l n spaces = do
    drawGenieStacksLoop l (n-1) spaces
    drawGenieWStacks l n spaces

--main function
drawMenu:: String -> IO()
drawMenu str = do
    drawSpeachBubble 95 str
    drawGenieLoop 19 110
    putStrLn " "

drawGameLoop:: [Int] -> String -> IO()
drawGameLoop l str = do
    drawSpeachBubble (110-15) str
    drawGenieStacksLoop l 19 110
    putStrLn " "
