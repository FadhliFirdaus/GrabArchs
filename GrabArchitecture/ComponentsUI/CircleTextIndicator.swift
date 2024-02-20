//
//  CircleTextIndicator.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 14/02/2024.
//

import Foundation
import SwiftUI

struct CircleTextIndicator : View {
    let text:String

    var body:some View {
        ZStack {
            Circle()
                .foregroundColor(Color.white)
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 1)
                )
            Text("\(text)")
        }
    }
}
