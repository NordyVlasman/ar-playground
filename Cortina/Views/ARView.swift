//
//  ARView.swift
//  Cortina
//
//  Created by Nordy Vlasman on 15/11/2021.
//

import SwiftUI

struct ARView: View {
    @EnvironmentObject var arManager: ARViewManager
    @EnvironmentObject var appManager: AppManager
    
    @State private var currentState: ShowState = .overview
    @State private var isCollapsed: Bool = false

    private var colors = CortinaColors.allValues
    
    // MARK: - Root views
    
    var arView: some View {
        ARComponent()
            .environmentObject(arManager)
            .environmentObject(appManager)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack {
                    editingOverlay
                    modalHeading
                }
            )
    }
    
    var editingOverlay: some View {
        VStack {
            HStack {
                Spacer()
                if appManager.isEditingModel {
                    Button(action: {
                        appManager.changeEditingModel()
                    }, label: {
                        VStack {
                            Image(systemName: "checkmark")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.gray)
                        .mask(Circle())
                    })
                }
            }
            Spacer()
        }
        .padding()
    }
    
    // MARK: - Components
    
    var modalHeading: some View {
        VStack {
            Spacer()
            VStack {
                VStack {
                    HStack {
                        if currentState != .overview {
                            Button(action: {
                                currentState = .overview
                            }, label: {
                                Image(systemName: "chevron.left")
                                    .font(.title2)
                                    .foregroundColor(.gray)
                                    .padding(5)
                            })
                        }
                        
                        Button(action: {
                            isCollapsed = !isCollapsed
                        }, label: {
                            Text("D")
                                .foregroundColor(.white)
                                .frame(
                                    width: 35,
                                    height: 32,
                                    alignment: .center
                                )
                                .background(.gray.opacity(0.6))
                                .cornerRadius(5)
                            
                            Text("Cortina U4 Transport")
                                .font(.title3)
                                .foregroundColor(.gray)
                                .padding(.trailing, currentState != .overview ? 5 : 0)
                            
                            Text("€ 799")
                                .foregroundColor(.white)
                                .frame(
                                    width: 59,
                                    height: 32,
                                    alignment: .center
                                )
                                .background(.gray)
                                .cornerRadius(5)
                            
                            Spacer()
                            
                            Image(systemName: isCollapsed ? "chevron.up" : "chevron.down")
                                .font(.title2)
                                .foregroundColor(.gray)
                            
                        })
                        .padding(.leading, 5)
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .padding(.top, 10)
                }
                if isCollapsed {
                    ScrollView(.horizontal, showsIndicators: false) {
                        switch currentState {
                        case .overview:
                            modifyOverview
                        case .colorSelection:
                            changeColorView
                        case .itemSelection:
                            customizeView
                        }
                    }
                    .padding(.horizontal, 15)
                }
            }
            .padding(.bottom, 25)
            .background(.white)
            .background(VisualEffectBlur(blurStyle: .light))
            .cornerRadius(10, corners: [.topLeft, .topRight])
            .opacity(0.9)
        }
        .ignoresSafeArea(.all)
    }
    
    var modifyOverview: some View {
        HStack(spacing: 20) {
            
            // Color picker
            Button(action: {
                currentState = .colorSelection
            }, label: {
                VStack {
                    Spacer()
                    Image(systemName: "eyedropper")
                        .font(.title)
                        .foregroundColor(.gray)
                        .frame(
                            width: 40,
                            height: 40,
                            alignment: .center
                        )
                    Spacer()
                    Text("Kleur")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Spacer()
                }
            })
            .frame(
                width: 120,
                height: 120,
                alignment: .center
            )
            .background(.white)
            .cornerRadius(10)
            
            // Specs
            Button(action: {
                currentState = .itemSelection
            }, label: {
                VStack {
                    Spacer()
                    Image(systemName: "list.dash")
                        .font(.title)
                        .foregroundColor(.gray)
                        .frame(
                            width: 40,
                            height: 40,
                            alignment: .center
                        )
                    Spacer()
                    Text("Specificaties")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Spacer()
                }
            })
            .frame(
                width: 120,
                height: 120,
                alignment: .center
            )
            .background(.white)
            .cornerRadius(10)
            
            // Accessoires
            Button(action: {
                currentState = .colorSelection
            }, label: {
                VStack {
                    Spacer()
                    Image(systemName: "bag")
                        .font(.title)
                        .foregroundColor(.gray)
                        .frame(
                            width: 40,
                            height: 40,
                            alignment: .center
                        )
                    Spacer()
                    Text("Accessoires")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Spacer()
                }
            })
            .frame(
                width: 120,
                height: 120,
                alignment: .center
            )
            .background(.white)
            .cornerRadius(10)
            
            // Assortiment
            Button(action: {
                currentState = .colorSelection
            }, label: {
                VStack {
                    Spacer()
                    Image(systemName: "bicycle")
                        .font(.title)
                        .foregroundColor(.gray)
                        .frame(
                            width: 40,
                            height: 40,
                            alignment: .center
                        )
                    Spacer()
                    Text("Assortiment")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Spacer()
                }
            })
            .frame(
                width: 120,
                height: 120,
                alignment: .center
            )
            .background(.white)
            .cornerRadius(10)
        }
    }
    
    private var changeColorView: some View {
        HStack(spacing: 20) {
            ForEach(colors, id: \.self) { color in
                Button(action: {
                    arManager.changeColor(to: color)
                }, label: {
                    VStack {
                        Spacer()
                        Image(systemName: "circlebadge.fill")
                            .font(.title)
                            .foregroundColor(color.swiftUIColor)
                            .frame(
                                width: 40,
                                height: 40,
                                alignment: .center
                            )
                        Spacer()
                        Text("\(color.rawValue)")
                            .font(.headline)
                            .foregroundColor(arManager.currentColor == color ? .black : .gray)
                        Spacer()
                    }
                })
                .frame(
                    width: 120,
                    height: 120,
                    alignment: .center
                )
                .background(.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(arManager.currentColor == color ? .gray : .white, lineWidth: 1.5)
                )
            }
        }
    }
    
    private var customizeView: some View {
        HStack(spacing: 20) {
            // Basket
            Button(action: {
                arManager.toggleItem("mandje")
            }, label: {
                VStack {
                    Spacer()
                    Image(systemName: "bag")
                        .font(.title)
                        .foregroundColor(.gray)
                        .frame(
                            width: 40,
                            height: 40,
                            alignment: .center
                        )
                    Spacer()
                    Text("Mandje")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Spacer()
                }
            })
            .frame(
                width: 120,
                height: 120,
                alignment: .center
            )
            .background(.white)
            .cornerRadius(10)
        }
    }
    
    //MARK: - Body
    
    var body: some View {
        arView
    }
}
