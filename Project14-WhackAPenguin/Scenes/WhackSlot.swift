//
//  WhackSlot.swift
//  Project14-WhackAPenguin
//
//  Created by Karla E. Martins Fernandes on 02/07/26.
//

import SpriteKit

final class WhackSlot: SKNode {
    func configure(at position: CGPoint) {
        self.position = position

        let holeNode = SKSpriteNode(imageNamed: "whackHole")
        addChild(holeNode)
    }
}
