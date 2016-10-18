http://openradar.appspot.com/28825172

Summary:
Since Xcode 8.0 and iOS 10.0 it is no longer possible to assign images to the reflective property of SCNMaterials without causing a crash in some cases. This crash does not always occur in more complex scenes but can be reproduced reliably using the code below.

Steps to Reproduce:
The crash can reproduced using the iOS "Single View Application" template and adding the following code to the ViewController class:

    override func viewDidLoad() {
        super.viewDidLoad()
        
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

Expected Results:
The material should be rendered using the reflective map.

Actual Results:
The app crashes on start.

Assigning the same image to the diffuse property (instead of a color) avoids the crash.

Version:
iOS 10.0.2

Notes:
An analogous crash can be reproduced in Xcode using the "Game" Template with Game Technology "SceneKit". Assigning an image to the reflective property of the material of the ship model leads to a crash of Xcode.

Configuration:
iPad Air, iPhone 6s Plus