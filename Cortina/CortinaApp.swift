//
//  CortinaApp.swift
//  Cortina
//
//  Created by Nordy Vlasman on 15/11/2021.
//

import SwiftUI

@main
struct CortinaApp: App {
    
    @StateObject var appManager = AppManager()
    
    var body: some Scene {
        WindowGroup {
            ARView()
                .environmentObject(appManager)
        }
    }
}
