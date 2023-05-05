import System.Console.ANSI
import System.Console.Terminal.Size

-- Define um tipo para representar as opções do menu
data MenuOption = MenuOption { label :: String, action :: IO () }

-- Define as opções do menu
menuOptions :: [MenuOption]
menuOptions = [ MenuOption "Opção 1" (putStrLn "Executando a opção 1")
              , MenuOption "Opção 2" (putStrLn "Executando a opção 2")
              , MenuOption "Opção 3" (putStrLn "Executando a opção 3")
              ]

-- Desenha o menu no terminal
drawMenu :: Int -> IO ()
drawMenu selected = do
    clearScreen
    Just (Window _ rows _ _) <- size
    let halfRows = rows `div` 2
    let menuTop = halfRows - (length menuOptions `div` 2)
    mapM_ drawOption (zip [menuTop..] menuOptions)
  where
    drawOption (n, opt) = do
        setCursorPosition n 0
        setSGR [ if n == selected then SetConsoleIntensity BoldIntensity : SetColor Foreground Vivid White
                                 else SetConsoleIntensity NormalIntensity : SetColor Foreground Vivid Black
              ]
        putStr $ label opt ++ "\n"

-- Executa o menu
runMenu :: IO ()
runMenu = do
    drawMenu 0
    loop 0
  where
    loop selected = do
        c <- getChar
        case c of
            '\n' -> action (menuOptions !! selected)
            '\ESC' -> return ()
            '\SI' -> loop (min (length menuOptions - 1) (selected + 1))
            '\SO' -> loop (max 0 (selected - 1))
            _ -> loop selected

main :: IO ()
main = runMenu