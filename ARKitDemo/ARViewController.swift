//
//  ARViewController.swift
//  ARKitDemo
//
//  Created by Matt Maher on 12/10/17.
//  Copyright © 2017 Matt Maher. All rights reserved.
//

import UIKit
import ARKit

class ARViewController: UIViewController {

    @IBOutlet weak var sceneKitView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropAnchor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let config = ARWorldTrackingConfiguration()
        sceneKitView.session.run(config)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        sceneKitView.session.pause()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dropAnchor() {
        let image = UIImage(named: "anchor")
        
        // Measurements in meters
        
        // One-sided plane that shows the image
        let plane = SCNPlane(width: 0.4, height: 0.4)
        plane.firstMaterial!.diffuse.contents = image
        
        let scene = SCNScene()
        
        for i in -20..<20 {
            
            // Coordinate space in view that will hold the plane
            let node = SCNNode()
            node.geometry = plane
            
            // 1.5 meter away from user
            node.position = SCNVector3(Double(i), 0, -1.0)
            
            scene.rootNode.addChildNode(node)
        }
        
        // Set the scene to sceneKitView
        sceneKitView.scene = scene
    }
    
}
