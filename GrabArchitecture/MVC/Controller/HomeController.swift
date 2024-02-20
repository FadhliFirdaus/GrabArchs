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
    
    @IBOutlet weak var searchBarStack: UIStackView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var scanButton: UIButton!
    
        // vars
    let relativeScreen = K.screenWidth/10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    func configureViews(){
        scanButton.contentMode = .scaleToFill
//        let cardView = CardView(frame: scanButton.bounds)
//        let scanBounds = scanButton.frame
//        scanButton.bringSubviewToFront(cardView)
    }
}


struct HomeVCRepresentable : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        
        guard let viewController = UIStoryboard(name: "HomeVC", bundle: nil).instantiateViewController(identifier: "HomeVC") as? HomeVC else {
            fatalError("ViewController not implemented in storyboard")
        }
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
    
}
