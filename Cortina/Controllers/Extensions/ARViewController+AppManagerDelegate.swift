//
//  ARViewController+AppManagerDelegate.swift
//  Cortina
//
//  Created by Nordy Vlasman on 15/11/2021.
//

import Foundation
import package_arbase

extension ARViewController: AppManagerDelegate {
    func arShouldChangeEditing(to editing: Bool) {
        guard let object = sceneView.currentVirtualObject else {
            return
        }
        
        currentVirtualObjectEditing = object
        object.setIsEditing(edit: editing)
        
        SceneKitAnimator.animateWithDuration(duration: 0.35, animations: {
            self.sceneView.currentVirtualObject?.contentNode?.opacity = editing ? 0.9 : 1
        })
    }
}
