makeSpeachBubble:: Int -> Int -> String -> String
makeSpeachBubble 0 spaces "1" = "/"++['-' | x <- [1..spaces]]++"\\"
makeSpeachBubble 0 spaces "2" = "|"++[' ' | x <- [0..spaces]]++"\\"
makeSpeachBubble 0 spaces "3" = "\\"++['-' | x <- [1..spaces]]++"_ \\"
makeSpeachBubble index spaces str = "|" ++ fitText (index-1) spaces str ++ "|"

menu :: IO ()
menu = do
  putStrLn "Escolha uma opção:"
  putStrLn "1 - Opção 1"
  putStrLn "2 - Opção 2"
  putStrLn "3 - Sair"
  opcao <- getLine
  case opcao of
    "1" -> putStrLn "Você escolheu a opção 1"
    "2" -> putStrLn "Você escolheu a opção 2"
    "3" -> putStrLn "Saindo..."
    _   -> do
      putStrLn "Opção inválida!"
      menu