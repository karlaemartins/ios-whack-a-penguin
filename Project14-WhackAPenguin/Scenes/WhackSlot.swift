//
//  WhackSlot.swift
//  Project14-WhackAPenguin
//
//  Created by Karla E. Martins Fernandes on 02/07/26.
//

import SpriteKit

final class WhackSlot: SKNode {
    private(set) var charNode: SKSpriteNode!
    private(set) var isVisible = false
    private(set) var isHit = false

    func configure(at position: CGPoint) {
        self.position = position

        let holeNode = SKSpriteNode(imageNamed: "whackHole")
        addChild(holeNode)

        let cropNode = SKCropNode()
        cropNode.position = CGPoint(x: 0, y: 15)
        cropNode.zPosition = 1
        cropNode.maskNode = SKSpriteNode(imageNamed: "whackMask")

        charNode = SKSpriteNode(imageNamed: "penguinGood")
        charNode.position = CGPoint(x: 0, y: -90)
        charNode.name = "character"

        cropNode.addChild(charNode)
        addChild(cropNode)
    }
    
    func show(hideTime: TimeInterval) {
        guard !isVisible else { return }
        
        charNode.xScale = 1
        charNode.yScale = 1
        charNode.run(SKAction.moveBy(x: 0, y: 80, duration: 0.05))
        
        isVisible = true
        isHit = false
        
        if Int.random(in: 0...2) == 0 {
            charNode.texture = SKTexture(imageNamed: "penguinGood")
            charNode.name = "charFriend"
        } else {
            charNode.texture = SKTexture(imageNamed: "penguinEvil")
            charNode.name = "charEnemy"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + (hideTime * 3.5)) { [weak self] in
            self?.hide()
        }
    }
    
    func hide() {
        guard isVisible else { return }
        
        charNode.run(SKAction.moveBy(x: 0, y: -80, duration: 0.05))
        isVisible = false
    }
}
