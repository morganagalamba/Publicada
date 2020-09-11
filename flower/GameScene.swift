//
//  GameScene.swift
//  flower
//
//  Created by Morgana Beatriz on 10/09/20.
//  Copyright © 2020 Morgana Beatriz. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {

    var flower: SKNode!
    private var lastUpdateTime : TimeInterval = 0
    var motion = CMMotionManager()
    var pitch: Double = 0.0
    var roll: Double = 0.0
    override func sceneDidLoad() {

        self.lastUpdateTime = 0
        flower = self.childNode(withName: "flower")
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        
        self.motion.deviceMotionUpdateInterval = 1.0/60.0
        self.motion.showsDeviceMovementDisplay = true
        self.motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical)
        
        if let data = self.motion.deviceMotion {
            pitch = data.attitude.pitch
            roll = data.attitude.roll
        }
        
        flower.physicsBody!.applyForce(CGVector(dx: 50*roll, dy: 50*(-pitch)))
        
    }
}
