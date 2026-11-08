# Trabalho-PF
# Sistema de Gestão de Biblioteca de Jogos (Fase 1)

Aplicação desenvolvida em Haskell para a gestão de uma coleção pessoal de videojogos, permitindo consultar, filtrar, adicionar, remover e calcular estatísticas sobre o catálogo de jogos.

---

##  Estrutura do Projeto

O projeto está organizado segundo a arquitetura modular recomendada com Cabal:

* `src/Model.hs`: Modelação das entidades principais (`Jogo`, `Estado` e o sinónimo de tipo `Biblioteca`).
* `src/Domain.hs`: Implementação de funções puras recursivas para operações sobre a coleção (adicionar, remover, filtrar por estado/plataforma, cálculo de horas).
* `app/Main.hs`: Interface textual interativa (CLI) em ciclo de comandos com avaliação estrita por encadeamento de IO (`>>` e `>>=`).
* `projeto.cabal` & `cabal.project`: Configuração de compilação, dependências e empacotamento com Cabal.

---

## Modelação de Dados

### Entidade `Jogo`
* `idJogo :: Int` — Identificador numérico único
* `titulo :: String` — Nome do jogo
* `plataforma :: String` — Plataforma (ex: PC, PlayStation, Switch)
* `horasJogadas :: Int` — Número de horas jogadas acumuladas
* `estado :: Estado` — Estado atual de progresso

### Tipo de Dados Algébrico `Estado`
* `Pendente`
* `AJogar`
* `Concluido`
* `Abandonado`

---

## Como Compilar e Executar

Certifica-te de que tens o GHC e o Cabal instalados no sistema.

### 1. Execução Direta da Aplicação
Na raiz do projeto (`projetofase1`), executa:
cabal run

### 2. Para abrir a consola interativa do GHCi e testar funções diretamente:
cabal repl


### Comandos do Menu

Ao correr o programa, estão disponíveis as seguintes opções:

    --ver : Mostra a lista completa de jogos.

    --adicionar : Pede os dados de um novo jogo e insere-o na biblioteca.

    --remover : Pede o ID e elimina o jogo correspondente.

    --filtrarestado : Mostra apenas jogos com determinado estado (Pendente, AJogar, Concluido, Abandonado).

    --filtrarplataforma : Filtra os jogos por consola/plataforma (ex: PC).

    --totalhoras : Soma e apresenta as horas jogadas em toda a biblioteca.

    --sair : Fecha o programa.

 ## Realizadores do programa:
    - Santiago Pinto, al2025153355
    - David Morgado, al2025164550 
    - Pedro Vieira, al2025154185