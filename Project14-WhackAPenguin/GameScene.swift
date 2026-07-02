//
//  GameScene.swift
//  Project14-WhackAPenguin
//
//  Created by Karla E. Martins Fernandes on 30/06/26.

import SpriteKit

final class GameScene: SKScene {
    
    private var gameScore: SKLabelNode!
    private var slots = [WhackSlot]()
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
        
        func createSlot(at position: CGPoint) {
            let slot = WhackSlot()
            slot.configure(at: position)
            
            addChild(slot)
            slots.append(slot)
        }
    }
}
