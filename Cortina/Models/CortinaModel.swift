//
//  CortinaModel.swift
//  Cortina
//
//  Created by Nordy Vlasman on 15/11/2021.
//

import Foundation
import UIKit
import SwiftUI

enum CortinaColors: String {
    case Black      = "black"
    case Green      = "green"
    case Purple     = "purple"
    case Red        = "red"
    case Orange     = "orange"
    
    static var allValues: [CortinaColors] {
        return [
            .Black,
            .Green,
            .Purple,
            .Red,
            .Orange
        ]
    }
    
    var color: UIColor {
        get {
            switch self {
            case .Red:
                return UIColor.red
            case .Black:
                return UIColor.black
            case .Purple:
                return UIColor.purple
            case .Green:
                return UIColor.green
            case .Orange:
                return UIColor.orange
            }
        }
    }
    
    var swiftUIColor: Color {
        get {
            switch self {
            case .Red:
                return Color.red
            case .Black:
                return Color.black
            case .Purple:
                return Color.purple
            case .Green:
                return Color.green
            case .Orange:
                return Color.orange
            }
        }
    }
}

enum ShowState {
    case overview
    case colorSelection
    case itemSelection
}
