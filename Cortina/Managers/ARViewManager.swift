//
//  ARViewManager.swift
//  Cortina
//
//  Created by Nordy Vlasman on 15/11/2021.
//

import Foundation
import Combine
import SwiftUI

class ARViewManager: ObservableObject {
    weak var delegate: ARManagerDelegate?
    
    @State var currentColor: CortinaColors = .Black
    
    func changeColor(to color: CortinaColors) {
        currentColor = color
        delegate?.changeColor(to: color.color)
    }
}
