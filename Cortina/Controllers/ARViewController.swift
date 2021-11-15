//
//  ARViewController.swift
//  Cortina
//
//  Created by Nordy Vlasman on 15/11/2021.
//

import Foundation
import package_arbase
import UIKit
import SceneKit

class ARViewController: UIViewController {
    var arManager:  ARViewManager
    var appManager: AppManager
    
    let sceneView       = ARBaseView()
    let loader          = ARBaseVirtualObjectLoader()
    let referenceNode   = SCNReferenceNode(named: "Art.scnassets/scene.scn")!
    
    let debugOptions:                   ARBaseDebugOptions = []
    var currentVirtualObjectEditing:    ARBaseVirtualObject?
    
    //MARK: - Tweaks
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    //MARK: - Initialize ARManager and other SwiftUI elements.
    init(arManager: ARViewManager, appManager: AppManager) {
        self.arManager  = arManager
        self.appManager = appManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Missing some essential imports")
    }
    
    //MARK: - UIViewController defaults
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delegate
        arManager.delegate      = self
        appManager.delegate     = self
        
        //Scene
        sceneView.placingMode           = .quickDrop
        sceneView.arBaseDelegate        = self
        sceneView.isAutoFocusEnabled    = true
        sceneView.environmentTexturing  = .automatic
        
        //Lights
        sceneView.isLightingIntensityAutomaticallyUpdated   = true
        sceneView.lightingEnvironmentContent                = nil
        sceneView.baseLightingEnvironmentIntensity          = 6
        
        //3D Object
        sceneView.initialPreviewObjectOpacity       = 0.667
        sceneView.initialPreviewObjectMaxSizeRatio  = CGSize(width: 0.667, height: 0.667)
        sceneView.allowedGestureTypes               = [.tap, .pan, .rotation, .pinch, .longPress]
        
        self.view.addSubview(sceneView)
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initializeARBase()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initializeARModel()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        sceneView.resetAR(withDebugOptions: [])
        sceneView.stopAR()
        super.viewWillDisappear(animated)
    }
    
    //MARK: - View Markup
    func setupViews() {
        setupSceneView()
    }
    
    func setupSceneView() {
        sceneView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sceneView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sceneView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            sceneView.topAnchor.constraint(equalTo: view.topAnchor),
            sceneView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //MARK: - AR functions
    func initializeARBase() {
        UIApplication.shared.isIdleTimerDisabled = true //Keep screen active
        sceneView.startAR()
    }
    
    func initializeARModel() {
        let virtualObject = ARBaseVirtualObject(refferenceNode: referenceNode, allowedAlignments: [.horizontal])
        loader.loadVirtualObject(virtualObject) { loadedObject in
            loadedObject.defaultScale           = 0.004
            self.sceneView.currentVirtualObject = loadedObject
            self.sceneView.currentVirtualObject?.contentNode?.opacity = 0
            
            SceneKitAnimator.animateWithDuration(duration: 0.35, animations: {
                self.sceneView.currentVirtualObject?.contentNode?.opacity = 1
            })
        }
    }
    
    //MARK: - Debug options
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        let alertController = UIAlertController(
            title: "Debug Screen",
            message: "",
            preferredStyle: .alert
        )
        
        let resetAction = UIAlertAction(
            title: "Reset View",
            style: .default) { (action: UIAlertAction!) in
                self.sceneView.resetAR(withDebugOptions: nil)
                self.initializeARBase()
                self.initializeARModel()
            }
        
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
        )
        
        alertController.addAction(resetAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
