    //
    //  Helper.swift
    //  GrabArchitecture
    //
    //  Created by Fadhli Firdaus on 13/02/2024.
    //

import Foundation
import SwiftUI

extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            return nil
        }
        
        self.init(
            .sRGB,
            red: Double((rgb >> 16) & 0xFF) / 255.0,
            green: Double((rgb >> 8) & 0xFF) / 255.0,
            blue: Double(rgb & 0xFF) / 255.0,
            opacity: 1.0
        )
    }
}

func formatFloatToNDecimalPlaces(_ value: Float, n:Int) -> String {
    return String(format: "%.\(n)f", value)
}

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height
let screenSize = UIScreen.main.bounds.size

func getRandomColor() -> Color {
    let randomColors: [Color] = [.red, .blue, .green, .orange, .purple, .pink, .yellow]
    let randomIndex = Int.random(in: 0..<randomColors.count)
    return randomColors[randomIndex]
}
