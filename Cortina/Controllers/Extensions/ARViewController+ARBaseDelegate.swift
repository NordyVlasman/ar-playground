//
//  ARViewController+ARBaseDelegate.swift
//  Cortina
//
//  Created by Nordy Vlasman on 15/11/2021.
//

import Foundation
import package_arbase
import SceneKit

extension ARViewController: ARBaseDelegate {
    func arBaseViewDidLongPress(on virtualObject: ARBaseVirtualObject?) {
        sceneView.currentVirtualObject  = virtualObject
    }
    
    func arBaseViewWillPlace(_ virtualObject: ARBaseVirtualObject, at transform: SCNMatrix4) {
        sceneView.currentVirtualObject  = virtualObject
        currentVirtualObjectEditing     = virtualObject
    }
}
