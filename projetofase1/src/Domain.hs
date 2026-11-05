module Domain where

import Model

-- | Adiciona um jogo à biblioteca. Se o ID já existir, substitui o registo antigo.
adicionarJogo :: Jogo -> Biblioteca -> Biblioteca
adicionarJogo j [] = [j]
adicionarJogo j (x:xs)
  | idJogo j == idJogo x = j : xs
  | otherwise            = x : adicionarJogo j xs

-- | Remove um jogo da biblioteca através do seu ID usando recursão
removerJogo :: Int -> Biblioteca -> Biblioteca
removerJogo _ [] = []
removerJogo idAlvo (x:xs)
  | idJogo x == idAlvo = xs
  | otherwise          = x : removerJogo idAlvo xs

-- | Procura um jogo pelo ID (devolve lista vazia se não encontrar ou com o jogo se encontrar)
procurarJogo :: Int -> Biblioteca -> [Jogo]
procurarJogo _ [] = []
procurarJogo idAlvo (x:xs)
  | idJogo x == idAlvo = [x]
  | otherwise          = procurarJogo idAlvo xs

-- | Filtra jogos por plataforma (String)
filtrarPorPlataforma :: String -> Biblioteca -> Biblioteca
filtrarPorPlataforma _ [] = []
filtrarPorPlataforma platAlvo (x:xs)
  | plataforma x == platAlvo = x : filtrarPorPlataforma platAlvo xs
  | otherwise                = filtrarPorPlataforma platAlvo xs

-- | Filtra jogos por estado tirando partido do tipo Estado
filtrarPorEstado :: Estado -> Biblioteca -> Biblioteca
filtrarPorEstado _ [] = []
filtrarPorEstado estAlvo (x:xs)
  | estado x == estAlvo = x : filtrarPorEstado estAlvo xs
  | otherwise           = filtrarPorEstado estAlvo xs

-- | Soma recursivamente o total de horas jogadas em toda a biblioteca
totalHoras :: Biblioteca -> Int
totalHoras []     = 0
totalHoras (x:xs) = horas x + totalHoras xs

-- | Conta recursivamente quantos jogos têm um determinado estado
contarPorEstado :: Estado -> Biblioteca -> Int
contarPorEstado _ [] = 0
contarPorEstado estAlvo (x:xs)
  | estado x == estAlvo = 1 + contarPorEstado estAlvo xs
  | otherwise           = contarPorEstado estAlvo xs