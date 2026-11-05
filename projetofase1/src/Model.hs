module Model where

data Estado = Pendente | AJogar | Concluido | Abandonado
  deriving (Show, Eq)

data Jogo = Jogo
  { idJogo     :: Int
  , titulo     :: String
  , plataforma :: String   
  , horas      :: Int
  , estado     :: Estado   
  } deriving (Show, Eq)


type Biblioteca = [Jogo]