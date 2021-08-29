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

//----------------------------------------------

//by adding a physics body to the balls and bouncers we already have some collision detection because the objects bounce off each other. But it's not being detected by us so:

//1.Add rectangle physics to our slots.
//2.Name the slots so we know which is which, then name the balls too.
//3.Make our scene the contact delegate of the physics world – this means, "tell us when contact occurs between two bodies."
//4.Create a method that handles contacts and does something appropriate.


import SpriteKit


class GameScene: SKScene,SKPhysicsContactDelegate {
    
   
    
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
        
        makeSlot(at: CGPoint(x: 128, y: 0), isGood: true)
        makeSlot(at: CGPoint(x: 384, y: 0), isGood: false)
        makeSlot(at: CGPoint(x: 640, y: 0), isGood: true)
        makeSlot(at: CGPoint(x: 896, y: 0), isGood: false)
        

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
        ball.name = "ball"
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
        var slotGlow: SKSpriteNode
        
        if isGood {
            slotBase = SKSpriteNode(imageNamed: "slotBaseGood")
            slotGlow = SKSpriteNode(imageNamed: "slotGlowGood")
            slotBase.name = "good"
        }
        else {
            slotBase = SKSpriteNode(imageNamed: "slotBaseBad")
            slotGlow = SKSpriteNode(imageNamed: "slotGlowBad")
            slotBase.name = "bad"
        }
        
        //Add rectangle physics to our slots
        slotBase.physicsBody = SKPhysicsBody(rectangleOf: slotBase.size)
        //needs to be non-dynamic because we don't want it to move out of the way when a player ball hits
        slotBase.physicsBody?.isDynamic = false
        
        slotBase.position = position
        slotGlow.position = position
        addChild(slotBase)
        addChild(slotGlow)
        
        // To rotate the glow:
        let spin = SKAction.rotate(byAngle: .pi, duration: 10)
        let spinForever = SKAction.repeatForever(spin)
        slotGlow.run(spin)
    }
   
    
}
