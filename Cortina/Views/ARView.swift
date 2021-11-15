//
//  ARView.swift
//  Cortina
//
//  Created by Nordy Vlasman on 15/11/2021.
//

import SwiftUI

struct ARView: View {
    @StateObject var arManager = ARViewManager()
    @EnvironmentObject var appManager: AppManager
    
    var arView: some View {
        ARComponent()
            .environmentObject(arManager)
            .environmentObject(appManager)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack {
                    //
                }
            )
    }
    
    var body: some View {
        arView
    }
}

struct ARView_Previews: PreviewProvider {
    static var previews: some View {
        ARView()
    }
}
