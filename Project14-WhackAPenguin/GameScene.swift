//
//  GameScene.swift
//  Project14-WhackAPenguin
//
//  Created by Karla E. Martins Fernandes on 30/06/26.

import SpriteKit

final class GameScene: SKScene {
    private var gameScore: SKLabelNode!
    private var slots = [WhackSlot]()
    private var popupTime: TimeInterval = 0.85
    private var numRounds = 0
    private var isGameOver = false
    private var score = 0 {
        didSet {
            gameScore.text = "Score: \(score)"
        }
    }

    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "whackBackground")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)

        gameScore = SKLabelNode(fontNamed: "Chalkduster")
        gameScore.text = "Score: 0"
        gameScore.position = CGPoint(x: 8, y: 8)
        gameScore.horizontalAlignmentMode = .left
        gameScore.fontSize = 48
        addChild(gameScore)

        createSlots()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.createEnemy()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }

        let location = touch.location(in: self)
        let tappedNodes = nodes(at: location)

        for node in tappedNodes {
            guard let whackSlot = node.parent?.parent as? WhackSlot else { continue }
            guard whackSlot.isVisible, !whackSlot.isHit else { continue }

            whackSlot.hit()

            if node.name == "charFriend" {
                score -= 5
                run(SKAction.playSoundFileNamed("whackBad.caf", waitForCompletion: false))
            } else if node.name == "charEnemy" {
                whackSlot.charNode.xScale = 0.85
                whackSlot.charNode.yScale = 0.85
                score += 1
                run(SKAction.playSoundFileNamed("whack.caf", waitForCompletion: false))
            }
        }
    }
}

private extension GameScene {
    func createSlots() {
        for index in 0..<5 {
            createSlot(at: CGPoint(x: 100 + (index * 170), y: 410))
        }

        for index in 0..<4 {
            createSlot(at: CGPoint(x: 180 + (index * 170), y: 320))
        }

        for index in 0..<5 {
            createSlot(at: CGPoint(x: 100 + (index * 170), y: 230))
        }

        for index in 0..<4 {
            createSlot(at: CGPoint(x: 180 + (index * 170), y: 140))
        }
    }

    func createSlot(at position: CGPoint) {
        let slot = WhackSlot()
        slot.configure(at: position)

        addChild(slot)
        slots.append(slot)
    }

    func createEnemy() {
        guard !isGameOver else { return }

        numRounds += 1

        if numRounds >= 30 {
            isGameOver = true

            for slot in slots {
                slot.hide()
            }

            let gameOverNode = SKSpriteNode(imageNamed: "gameOver")
            gameOverNode.position = CGPoint(x: 512, y: 384)
            gameOverNode.zPosition = 1
            addChild(gameOverNode)

            return
        }

        popupTime *= 0.991

        slots.shuffle()
        slots[0].show(hideTime: popupTime)

        if Int.random(in: 0...12) > 4 { slots[1].show(hideTime: popupTime) }
        if Int.random(in: 0...12) > 8 { slots[2].show(hideTime: popupTime) }
        if Int.random(in: 0...12) > 10 { slots[3].show(hideTime: popupTime) }
        if Int.random(in: 0...12) > 11 { slots[4].show(hideTime: popupTime) }

        let minDelay = popupTime / 2
        let maxDelay = popupTime * 2
        let delay = Double.random(in: minDelay...maxDelay)

        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            self?.createEnemy()
        }
    }
}
