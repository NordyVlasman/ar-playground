//
//  ARManagerDelegate.swift
//  Cortina
//
//  Created by Nordy Vlasman on 15/11/2021.
//

import Foundation
import UIKit

protocol ARManagerDelegate: AnyObject  {
    func changeColor(to color: UIColor)
    func toggleItem(_ itemName: String)
}
