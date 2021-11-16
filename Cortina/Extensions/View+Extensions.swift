//
//  View+Extensions.swift
//  Cortina
//
//  Created by Nordy Vlasman on 16/11/2021.
//

import SwiftUI
import UIKit
import WebKit

extension View {
    //MARK: - Corner radius
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct SafariView: UIViewRepresentable {

    let url: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView(frame: .zero)
    }

    func updateUIView(_ view: WKWebView, context: Context) {
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            view.load(request)
        }
    }
}
