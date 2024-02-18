//
//  SplashScreen.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 13/02/2024.
//

import Foundation
import SwiftUI


struct SplashScreen: View {
    var body: some View {
        ZStack{
            Color(hex: "#0a9830")
                .ignoresSafeArea()
            Image("grab")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.white)
                .aspectRatio(contentMode: .fit)
                .scaleEffect(0.5)
                .padding(.bottom, 50)
        }
    }
}

#Preview {
    SplashScreen()
}
