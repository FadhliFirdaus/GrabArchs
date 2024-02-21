//
//  IntentManager.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 21/02/2024.
//

import Foundation
import SwiftUI
import UIKit

enum SegueIntent:String {
    case Home = "HomeVC"
    case Settings = "SettingsVC"
}

class IntentManager {
    static let shared = IntentManager()
    
    func segueIntent(intent: SegueIntent, from navigationController: UINavigationController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Use the correct storyboard name
        var destinationViewController: UIViewController?
        
        switch intent {
        case .Home:
            destinationViewController = storyboard.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
            
        case .Settings:
            destinationViewController = storyboard.instantiateViewController(withIdentifier: "SettingsVC") as? SettingsVC
                
        }
        
        if let viewController = destinationViewController {
            navigationController.present(viewController, animated: true, completion: nil)
        } else {
            fatalError("ViewController not implemented in storyboard")
        }
    }
}
