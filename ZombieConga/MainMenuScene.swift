//
//  AppDelegate.swift
//  ZombieConga
//
//  Created by George Clinkscales on 12/24/25.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene {
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "MainMenu")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(background)
        
        let titleLabel = SKLabelNode(fontNamed: "Chalkduster")
        titleLabel.text = "Tap to Start"
        titleLabel.fontSize = 88
        titleLabel.fontColor = .white
        titleLabel.zPosition = 1
        titleLabel.position = CGPoint(x: size.width / 2, y: size.height * 0.18)
        addChild(titleLabel)
    }
    
    func sceneTapped() {
        let myScene = GameScene(size: size)
        myScene.scaleMode = scaleMode
        let reveal = SKTransition.doorway(withDuration: 1.5)
        view?.presentScene(myScene, transition: reveal)
    }

    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        sceneTapped()
    }

}
