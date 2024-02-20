//
//  CardView.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 20/02/2024.
//

import Foundation
import SwiftUI


struct CardViewUI:View {
    
    init() {
        self.cornerRadius = 6
        self.radius = 3
        self.foreGroundColor = Color.white
    }
    
    init(cornerRadius: CGFloat, shadowRadius:CGFloat, foregroundColor:Color){
        self.cornerRadius = cornerRadius
        self.radius = shadowRadius
        self.foreGroundColor = foregroundColor
    }
    
    init (color:Color){
        self.cornerRadius = 6
        self.radius = 3
        self.foreGroundColor = color
    }
    
    var cornerRadius:CGFloat
    var radius:CGFloat
    var foreGroundColor:Color
    
    var body : some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .shadow(radius: radius)
            .foregroundColor(foreGroundColor)
    }
}
