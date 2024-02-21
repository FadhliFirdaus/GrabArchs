//
//  HomeController.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 20/02/2024.
//

import Foundation
import UIKit
import SwiftUI

class HomeVC : UIViewController {
    
    @IBOutlet weak var settingsButton: UIButton!
        // vars
    let relativeScreen = K.screenWidth/10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    func configureViews(){
    }
    
    @IBAction func settingsDidTapped(_ sender: Any) {
        let intentManager = IntentManager.shared
        if let navigationController = self.navigationController {
            intentManager.segueIntent(intent: .Settings, from: navigationController)
        } else {
            print("Error: UINavigationController is nil.")
        }    }
}

struct HomeVCRepresentable : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        
        guard let viewController = UIStoryboard(name: "HomeVC", bundle: nil).instantiateViewController(identifier: "HomeVC") as? HomeVC else {
            fatalError("ViewController not implemented in storyboard")
        }
        
        
        return viewController
    }
    
    mutating func setNC(newNC:UINavigationController) {
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}
