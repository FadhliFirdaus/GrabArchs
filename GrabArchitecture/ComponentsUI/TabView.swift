//
//  TabView.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 20/02/2024.
//

import Foundation
import SwiftUI


struct TabView: View {
    var body: some View {
        VStack (spacing:0){
            Spacer()
            HStack(spacing: 0){
                ForEach(tabItems.indices, id: \.self) { index in
                    Rectangle()
                        .foregroundColor(Color.white)
                    VStack(spacing:0){
                        Image(systemName: tabItems[index].1)
                        Spacer()
                            .frame(height: 10)
                        Text(tabItems[index].0)
                            .font(.system(size: 12))
                    }
                    .frame(width: screenWidth/5, height: screenWidth/5, alignment: .bottom)
                    .padding(.bottom, screenWidth/5/2.4)
                }
            }
            .frame(width: screenWidth, height: screenWidth/5)
        }
        .frame(width: screenWidth, height: screenHeight)
        .ignoresSafeArea()
    }
}
