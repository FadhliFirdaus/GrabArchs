//
//  CustomModifiers.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 20/02/2024.
//

import Foundation
import SwiftUI


struct CustomTextModifier: ViewModifier {
    var fontFamily: String
    var fontSize: CGFloat
    var fontWeight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(.custom(fontFamily, size: fontSize))
            .fontWeight(fontWeight)
    }
}

