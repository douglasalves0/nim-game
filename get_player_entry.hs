getPlayerEntry::Int->Int->IO()

getPlayerEntry difficulty stack = do
    putStrLn "Digite a sua jogada:\n->"
    playerMove <- readLn
    let error = validatePlayerEntry (read playerMove)

    if error == 1 then do
      putStrLn "A entrada deve ser um numero entre 1 e 3, tente novamente"
      getPlayerEntry difficulty stack
    else
      removeFromStack playerMove


validatePlayerEntry::T->Int
validatePlayerEntry playerEntry = do
    if typeOf playerEntry == typeOf 1 && playerEntry < 1 && playerEntry > 3 then
      return 0
    else
      return 1
