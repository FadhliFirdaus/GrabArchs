//
//  CardView.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 20/02/2024.
//

import Foundation
import SwiftUI


struct CardViewUI:View {
    
    var body : some View {
        RoundedRectangle(cornerRadius: 6)
            .shadow(radius: 3)
            .foregroundColor(.white)
    }
}
