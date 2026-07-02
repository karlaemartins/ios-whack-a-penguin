# iOS Whack-a-Penguin - Projeto de Estudo

Jogo desenvolvido em SpriteKit que explora conceitos fundamentais de jogos 2D, como hierarquia de nodes, animações, detecção de toques, máscaras, sons, pontuação e controle de estado.

Este projeto faz parte do Projeto 14 do curso 100 Days of Swift, sendo desenvolvido com o objetivo de aprofundar conhecimentos em SpriteKit e compreender como estruturar um jogo simples utilizando UIKit programático.

## O que o app faz

- Exibe pinguins aleatoriamente em buracos espalhados pela tela.
- Diferencia pinguins amigos e inimigos através de imagens diferentes.
- Permite que o jogador toque nos pinguins inimigos para ganhar pontos.
- Penaliza o jogador ao tocar nos pinguins amigos.
- Atualiza a pontuação durante a partida.
- Aumenta gradualmente a dificuldade do jogo.
- Reproduz sons diferentes para acertos corretos e incorretos.
- Finaliza a partida após um número definido de rodadas.
- Exibe a mensagem de Game Over e a pontuação final.

## Arquitetura

O projeto foi estruturado utilizando UIKit programático e SpriteKit.

A inicialização do aplicativo é feita pelo `AppDelegate`, que entrega a `UIWindow` para o `AppCoordinator`. O Coordinator define o `GameViewController` como tela inicial, e o controller é responsável por apresentar uma `SKView` com a `GameScene`.

```text
AppDelegate
      ↓
AppCoordinator
      ↓
GameViewController
      ↓
SKView
      ↓
GameScene
```

A lógica do jogo foi dividida entre duas classes principais:

- `GameScene`: controla score, rodadas, criação dos slots, aparição dos pinguins, toques e Game Over.
- `WhackSlot`: representa cada buraco do jogo e controla o pinguim, máscara, visibilidade e estado de acerto.

## Decisões importantes

- Utilização de UIKit sem Storyboard.
- Uso de `AppCoordinator` para iniciar o fluxo da aplicação.
- Gerenciamento da cena através de `SKScene`.
- Uso de `SKNode` para representar cada slot do jogo.
- Uso de `SKSpriteNode` para imagens do cenário e pinguins.
- Uso de `SKCropNode` para criar o efeito de pinguins escondidos dentro dos buracos.
- Uso de `SKTexture` para alternar entre pinguim amigo e inimigo sem recriar nodes.
- Uso de `SKAction` para animações de entrada, saída e acerto.
- Uso de `DispatchQueue.main.asyncAfter` para controlar o ciclo de aparição dos pinguins.
- Uso de `SKLabelNode` para score e pontuação final.
- Uso de arquivos `.caf` para efeitos sonoros.

## Melhorias em relação ao projeto original

Além da implementação principal proposta pelo curso, foi realizado o desafio de exibir a pontuação final ao término da partida.

Também foram aplicadas melhorias de organização:

- Inicialização programática sem `Main.storyboard`.
- Separação de arquivos em `App`, `Controllers`, `Scenes` e `Resources`.
- Uso de `private` e `private(set)` para proteger estados internos.
- Organização de métodos internos em extensões privadas.
- Controle explícito de estado com `isGameOver`.

## Conceitos praticados

- SpriteKit
- UIKit programático
- Coordinator Pattern
- `SKScene`
- `SKNode`
- `SKSpriteNode`
- `SKCropNode`
- `SKTexture`
- `SKAction`
- `SKLabelNode`
- Hierarquia de nodes
- Máscaras visuais
- Detecção de toques
- Animações
- Sons
- Randomização
- Controle de estado
- Sistema de pontuação
- Game loop com `DispatchQueue.main.asyncAfter`

## Créditos

Projeto baseado no Project 14 do curso 100 Days of Swift, criado por Paul Hudson, do Hacking with Swift.
