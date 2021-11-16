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
    @StateObject var arManager  = ARViewManager()
    
    var body: some Scene {
        WindowGroup {
            ARView()
                .environmentObject(appManager)
                .environmentObject(arManager)
        }
    }
}
