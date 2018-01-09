//
//  ViewController.swift
//  SceneKitBlocks
//
//  Created by Kevin Mann on 11/21/17.
//  Copyright © 2017 Lightning Kite. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var sceneView: SCNView!
    var scene: SCNScene!
    var floorNode: SCNNode!
    var floor: SCNFloor!
    var cameraNode: SCNNode!
    var camera: SCNCamera!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        setupFloor()
        setupCamera()
    }
    
    // MARK: - Scene Methods
    func spawnSactional() {
        let geometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        let node = SCNNode(geometry: geometry)
        node.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        node.position = SCNVector3(0, 5, -15)
        scene.rootNode.addChildNode(node)
    }
    
    func setupCamera() {
        guard let cameraNode = scene.rootNode.childNode(withName: "camera", recursively: true), let camera = cameraNode.camera else {
            return
        }
        self.cameraNode = cameraNode
        self.camera = camera
    }
    
    func setupFloor() {
        guard let floorNode = scene.rootNode.childNode(withName: "floor", recursively: true), let floor = floorNode.geometry as? SCNFloor else {
            return
        }
        floorNode.physicsBody = SCNPhysicsBody(type: .static, shape: nil)
        self.floor = floor
        self.floorNode = floorNode
    }
    
    func setupScene() {
        guard let scene = SCNScene(named: "art.scnassets/scene.scn") else {
            return
        }
        self.scene = scene
        sceneView.scene = scene
    }
    
    // MARK: - Actions
    @IBAction func createBlock() {
        spawnSactional()
    }
}
