module Main where
import Model
import Domain

bibliotecaExemplo :: Biblioteca
bibliotecaExemplo =
  [ Jogo 1 "Elden Ring" "PC" 120 Concluido
  , Jogo 2 "Hollow Knight" "PC" 45 Concluido
  , Jogo 3 "God of War Ragnarok" "PlayStation" 30 AJogar
  , Jogo 4 "Celeste" "PC" 15 Pendente
  ]

main :: IO ()
main =
    putStrLn "=== BEM-VINDO A BIBLIOTECA DE JOGOS ===" >>
    executar bibliotecaExemplo

executar :: Biblioteca -> IO ()
executar bib =
    putStrLn "\n---- Comandos ---- \n--ver\n--adicionar\n--remover\n--filtrarestado\n--filtrarplataforma\n--totalhoras\n--sair" >>
    putStr "Opcao > " >>
    getLine >>= \comando ->
    case comando of
        "sair" ->
            putStrLn "Programa terminado com sucesso!"

        "ver" ->
            putStrLn "\n--- Lista de Jogos na Biblioteca ---" >>
            print bib >>
            executar bib

        "adicionar" ->
            putStrLn "ID do jogo:" >>
            readLn >>= \idJogo ->
            putStrLn "Titulo do jogo:" >>
            getLine >>= \tit ->
            putStrLn "Plataforma (ex: PC, PlayStation, Switch):" >>
            getLine >>= \plat ->
            putStrLn "Horas jogadas:" >>
            readLn >>= \hrs ->
            putStrLn "Estado (1: Pendente, 2: AJogar, 3: Concluido, 4: Abandonado):" >>
            getLine >>= \opcaoEstado ->
            let est = case opcaoEstado of
                        "1" -> Pendente
                        "2" -> AJogar
                        "3" -> Concluido
                        "4" -> Abandonado
                        _   -> Pendente
                novoJogo = Jogo idJogo tit plat hrs est
                novaBib  = adicionarJogo novoJogo bib
            in putStrLn "Jogo adicionado com sucesso!" >>
               print novaBib >>
               executar novaBib

        "remover" ->
            putStrLn "ID do jogo a remover:" >>
            readLn >>= \idRemover ->
            let novaBib = removerJogo idRemover bib
            in putStrLn "Jogo removido com sucesso!" >>
               print novaBib >>
               executar novaBib

        "filtrarestado" ->
            putStrLn "Escolhe o estado (1: Pendente, 2: AJogar, 3: Concluido, 4: Abandonado):" >>
            getLine >>= \opcaoEstado ->
            let est = case opcaoEstado of
                        "1" -> Pendente
                        "2" -> AJogar
                        "3" -> Concluido
                        "4" -> Abandonado
                        _   -> Pendente
                resultado = filtrarPorEstado est bib
            in putStrLn "\n--- Jogos Filtrados ---" >>
               print resultado >>
               executar bib

        "filtrarplataforma" ->
            putStrLn "Escreve a plataforma pretendida (ex: PC):" >>
            getLine >>= \plat ->
            let resultado = filtrarPorPlataforma plat bib
            in putStrLn "\n--- Jogos na Plataforma ---" >>
               print resultado >>
               executar bib

        "totalhoras" ->
            let horas = totalHoras bib
            in putStrLn ("\nTotal de horas acumuladas: " ++ show horas ++ " horas") >>
               executar bib

        _ ->
            putStrLn "Comando nao reconhecido. Tenta novamente." >>
            executar bib