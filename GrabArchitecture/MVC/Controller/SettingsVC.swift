//
//  SettingsVC.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 21/02/2024.
//

import Foundation
import UIKit
import SwiftUI

class SettingsVC : UIViewController {
    
    @IBOutlet weak var settingsButton: UIButton!
        // vars
    let relativeScreen = K.screenWidth/10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    func configureViews(){
    }
}

struct SettingsVCRepresentable : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        
        guard let viewController = UIStoryboard(name: "HomeVC", bundle: nil).instantiateViewController(identifier: "SettingsVC") as? SettingsVC else {
            fatalError("ViewController not implemented in storyboard")
        }
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
