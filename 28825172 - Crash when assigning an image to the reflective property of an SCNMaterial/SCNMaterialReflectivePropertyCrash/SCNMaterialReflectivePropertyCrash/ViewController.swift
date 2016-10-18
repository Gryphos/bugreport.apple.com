//
//  ViewController.swift
//  SCNMaterialReflectivePropertyCrash
//
//  Created by Götz Rößner on 18.10.16.
//  Copyright © 2016 Gryphos GmbH. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let scnView = view as! SCNView
        let scene = SCNScene()
        scnView.scene = scene
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0.0, 0.7, 3.0)
        scene.rootNode.addChildNode(cameraNode)
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.init(white: 0.5, alpha: 1.0)
        material.reflective.contents = Bundle.main.bundleURL.appendingPathComponent("Reflective_map_2048x1024.jpg")
        
        let box = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        box.firstMaterial = material
        
        let boxNode = SCNNode(geometry: box)
        scene.rootNode.addChildNode(boxNode)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

