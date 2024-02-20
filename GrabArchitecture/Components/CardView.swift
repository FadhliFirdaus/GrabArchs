//
//  CardView.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 20/02/2024.
//

import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCardView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCardView() {
            // Set the background color of the cardView
        backgroundColor = UIColor.white
        
            // Add corner radius and shadow
        layer.cornerRadius = 10.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 2.0
    }
}

