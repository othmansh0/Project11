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

//-----------------------------------------------------------------------------------------

//isDynamic property of a physics body. When this is true, the object will be moved by the physics simulator based on gravity and collisions. When it's false the object will still collide with other things, but it won't ever be moved as a result

import SpriteKit


class GameScene: SKScene {
    
   
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        //adds a physics body to the whole scene that is a line on each edge, effectively acting like a container for the scene
  
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
   
        makeBouncer(at: CGPoint(x: 0, y: 0))
        makeBouncer(at: CGPoint(x: 256, y: 0))
        makeBouncer(at: CGPoint(x: 512, y: 0))
        makeBouncer(at: CGPoint(x: 768, y: 0))
        makeBouncer(at: CGPoint(x: 1024, y: 0))
        

    }
    
    //This method gets called (in UIKit and SpriteKit) whenever someone starts touching their device
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //It's possible touching with multiple fingers at the same time, so we get passed a new data type called Set
        guard let touch = touches.first else { return }
        
        //to know where the screen was touched,self - i.e., the game scene
        let location = touch.location(in: self)
        
        
        let ball = SKSpriteNode(imageNamed: "ballRed")
        
//        circleOfRadius initializer for SKPhysicsBody to add circular physics
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2)
        ball.physicsBody?.restitution = 0.4
        ball.position = location
        addChild(ball)
        
        
        
        
        
        
        
        
        
//        //generates a node filled with a color (red) at a size (64x64
//        let box = SKSpriteNode(color: .red, size: CGSize(width: 64, height: 64))
//
//        // adds a physics body to the box that is a rectangle of the same size as the box
//        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 64, height: 64))
//        box.position = location
//        addChild(box)
        
    }
    
    func makeBouncer(at position: CGPoint){
        
        let bouncer = SKSpriteNode(imageNamed: "bouncer")
        bouncer.position = position
        bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width / 2.0)
        bouncer.physicsBody?.isDynamic = false
        addChild(bouncer)
    }
    
    func makeSlot(at position: CGPoint , isGood: Bool){
        var slotBase: SKSpriteNode
        
        if isGood {
            slotBase = SKSpriteNode(imageNamed: "slotBaseGood")
        }
        else {
            slotBase = SKSpriteNode(imageNamed: "slotBaseBad")
        }
        
        slotBase.position = position
        addChild(slotBase)
    }
   
    
}
