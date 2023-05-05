import System.Console.ANSI
import System.IO
import System.IO.Error
import Control.Monad
import System.Console.Haskeline

main :: IO ()
main = do
  tputInit
  menu

tputInit :: IO ()
tputInit = do
  hSetBuffering stdin NoBuffering
  hSetBuffering stdout NoBuffering
  hSetEcho stdin False
  hPutStr stdout "\ESC[?1049h"
  setCursorPosition 0 0
  clearScreen

tputClose :: IO ()
tputClose = do
  hPutStr stdout "\ESC[?1049l"

menu :: IO ()
menu = do
  putStrLn "=== Meu Menu ==="
  putStrLn "> Opção 1"
  putStrLn "  Opção 2"
  putStrLn "  Opção 3"
  input <- runInputT defaultSettings $ do
    getInputLine "> "
  case input of
    Nothing -> tputClose
    Just "1" -> putStrLn "Você escolheu a opção 1."
    Just "2" -> putStrLn "Você escolheu a opção 2."
    Just "3" -> putStrLn "Você escolheu a opção 3."
    Just _ -> menu