//
//  ARViewController+ARManagerDelegate.swift
//  Cortina
//
//  Created by Nordy Vlasman on 15/11/2021.
//

import Foundation
import UIKit

extension ARViewController: ARManagerDelegate {
    func changeColor(to color: UIColor) {
        guard let object = sceneView.currentVirtualObject?.childNode(withName: "Cylinder001", recursively: true) else {
            return
        }
        
        object.geometry?.firstMaterial?.diffuse.contents = color
    }
    
    func toggleItem(_ itemName: String) {
        guard let node = sceneView.currentVirtualObject?.childNode(withName: itemName, recursively: true) else {
            return
        }
        node.isHidden.toggle()
    }
}
