//
//  GameViewController.swift
//  Project14-WhackAPenguin
//
//  Created by Karla E. Martins Fernandes on 30/06/26.
//

import SpriteKit
import UIKit

final class GameViewController: UIViewController {
    override func loadView() {
        view = SKView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let skView = view as? SKView else { return }

        let scene = GameScene(size: CGSize(width: 1024, height: 768))
        scene.scaleMode = .fill

        skView.presentScene(scene)
    }
}
