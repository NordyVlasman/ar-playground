//
//  View+Extensions.swift
//  Cortina
//
//  Created by Nordy Vlasman on 16/11/2021.
//

import SwiftUI

extension View {
    //MARK: - Corner radius
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
