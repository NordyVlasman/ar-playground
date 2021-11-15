//
//  AppManager.swift
//  Cortina
//
//  Created by Nordy Vlasman on 15/11/2021.
//

import Foundation

class AppManager: ObservableObject {
    @Published var isEditingModel: Bool = false
   
    weak var delegate: AppManagerDelegate?
    
    func changeEditingModel() {
        guard let delegate = delegate else {
            return
        }
        
        isEditingModel = !isEditingModel
        delegate.arShouldChangeEditing(to: isEditingModel)
    }
}
