//
//  WhackSlot.swift
//  Project14-WhackAPenguin
//
//  Created by Karla E. Martins Fernandes on 02/07/26.
//

import SpriteKit

final class WhackSlot: SKNode {
    private(set) var charNode: SKSpriteNode!

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
}
