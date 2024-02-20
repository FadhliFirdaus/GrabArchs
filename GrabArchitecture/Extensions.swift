//
//  Extensions.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 20/02/2024.
//

import Foundation
import SwiftUI


extension View {
    func defaultTextModifier() -> some View {
        self.modifier(CustomTextModifier(fontFamily: "inter", fontSize: 12, fontWeight: .medium))
    }
    
    func textModifier(size : CGFloat, weight: Font.Weight) -> some View {
        self.modifier(CustomTextModifier(fontFamily: "inter", fontSize: size, fontWeight: weight))
    }
    
    func applyInnerShadow() -> some View {
        self
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 4)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.white)
                            .blur(radius: 4)
                            .offset(x: 2, y: 2)
                    )
            )
            .mask(
                RoundedRectangle(cornerRadius: 10)
            )
    }
}

extension AnyView {
    var uniqueIdentifier: String {
        return UUID().uuidString
    }
}
