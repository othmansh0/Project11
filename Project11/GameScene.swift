//
//  GameScene.swift
//  Project11
//
//  Created by othman shahrouri on 8/28/21.
//


//Anchor Point.Determines what coordinates SpriteKit uses to position children and it’s X:0.5 Y:0.5 by default.

//This is different to UIKit: it means “position me based on my center”, whereas UIKit positions things based on their top-left corner. This is usually fine, but when working with the main scene it’s easiest to set this value to X:0 Y:0

//unlike UIKit SpriteKit positions things based on their center – i.e., the point 0,0 refers to the horizontal and vertical center of a node
//-----------------------------------------------------------------------------------------

//Blend modes:

//Blend modes determine how a node is drawn, and
//SpriteKit gives you many options. The .replace option means
//"just draw it, ignoring any alpha values,"
//which makes it fast for things without gaps such as our background



import SpriteKit


class GameScene: SKScene {
    
   
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
    }
    
    
   
    
}
