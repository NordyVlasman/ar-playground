//
//  ARComponent.swift
//  Cortina
//
//  Created by Nordy Vlasman on 15/11/2021.
//

import Foundation
import SwiftUI

struct ARComponent: UIViewControllerRepresentable {
    var arViewController: ARViewController?
    
    func makeUIViewController(context: Context) -> ARViewController {
        let arViewController = ARViewController()
        return arViewController
    }
    
    func updateUIViewController(_ uiViewController: ARViewController, context: Context) {
        //
    }
}
