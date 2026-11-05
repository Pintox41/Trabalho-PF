module Main where

import Model
import Domain

-- | Dados de teste para demonstração da Fase 1
bibliotecaExemplo :: Biblioteca
bibliotecaExemplo =
  [ Jogo 1 "Elden Ring" "PC" 120 Concluido
  , Jogo 2 "Hollow Knight" "PC" 45 Concluido
  , Jogo 3 "God of War Ragnarok" "PlayStation" 30 AJogar
  , Jogo 4 "Celeste" "PC" 15 Pendente
  ]

main :: IO ()
main = do
  putStrLn "=== GameVault - Fase 1 (Demonstração) ==="

  putStrLn "\n1. Biblioteca Inicial:"
  print bibliotecaExemplo

  putStrLn "\n2. Filtrar apenas jogos 'Concluido':"
  print (filtrarPorEstado Concluido bibliotecaExemplo)

  putStrLn "\n3. Filtrar apenas jogos da plataforma 'PC':"
  print (filtrarPorPlataforma "PC" bibliotecaExemplo)

  putStrLn "\n4. Número de jogos concluídos:"
  print (contarPorEstado Concluido bibliotecaExemplo)

  putStrLn "\n5. Total de horas acumuladas na biblioteca:"
  print (totalHoras bibliotecaExemplo)

  putStrLn "\n6. Remover jogo com ID 3:"
  print (removerJogo 3 bibliotecaExemplo)

  putStrLn "\n7. Adicionar um novo jogo (Terraria):"
  let novoJogo = Jogo 5 "Terraria" "PC" 80 AJogar
  print (adicionarJogo novoJogo bibliotecaExemplo)