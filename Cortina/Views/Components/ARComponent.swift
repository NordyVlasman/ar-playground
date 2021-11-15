//
//  ARComponent.swift
//  Cortina
//
//  Created by Nordy Vlasman on 15/11/2021.
//

import Foundation
import SwiftUI

struct ARComponent: UIViewControllerRepresentable {
    @EnvironmentObject var arManager:   ARViewManager
    @EnvironmentObject var appManager:  AppManager
    
    var arViewController: ARViewController?
    
    func makeUIViewController(context: Context) -> ARViewController {
        let arViewController = ARViewController(arManager: arManager, appManager: appManager)
        return arViewController
    }
    
    func updateUIViewController(_ uiViewController: ARViewController, context: Context) {
        uiViewController.arManager  = arManager
        uiViewController.appManager = appManager
    }
}
