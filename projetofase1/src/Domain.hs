module Domain where

import Model


adicionarJogo :: Jogo -> Biblioteca -> Biblioteca
adicionarJogo j [] = [j]
adicionarJogo j (x:xs)
  | idJogo j == idJogo x = j : xs
  | otherwise            = x : adicionarJogo j xs


removerJogo :: Int -> Biblioteca -> Biblioteca
removerJogo _ [] = []
removerJogo idAlvo (x:xs)
  | idJogo x == idAlvo = xs
  | otherwise          = x : removerJogo idAlvo xs


procurarJogo :: Int -> Biblioteca -> [Jogo]
procurarJogo _ [] = []
procurarJogo idAlvo (x:xs)
  | idJogo x == idAlvo = [x]
  | otherwise          = procurarJogo idAlvo xs


filtrarPorPlataforma :: String -> Biblioteca -> Biblioteca
filtrarPorPlataforma _ [] = []
filtrarPorPlataforma platAlvo (x:xs)
  | plataforma x == platAlvo = x : filtrarPorPlataforma platAlvo xs
  | otherwise                = filtrarPorPlataforma platAlvo xs


filtrarPorEstado :: Estado -> Biblioteca -> Biblioteca
filtrarPorEstado _ [] = []
filtrarPorEstado estAlvo (x:xs)
  | estado x == estAlvo = x : filtrarPorEstado estAlvo xs
  | otherwise           = filtrarPorEstado estAlvo xs

totalHoras :: Biblioteca -> Int
totalHoras []     = 0
totalHoras (x:xs) = horas x + totalHoras xs


contarPorEstado :: Estado -> Biblioteca -> Int
contarPorEstado _ [] = 0
contarPorEstado estAlvo (x:xs)
  | estado x == estAlvo = 1 + contarPorEstado estAlvo xs
  | otherwise           = contarPorEstado estAlvo xs
