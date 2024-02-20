//
//  TabView.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 20/02/2024.
//

import Foundation
import SwiftUI


struct TabView: View {
    @State var currentlySelected = 0
    var body: some View {
        VStack (spacing:0){
            Spacer()
            HStack(spacing: 0){
                ForEach(tabItems.indices, id: \.self) { index in
                    let isSelected = index == currentlySelected
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color.white)
                        VStack(spacing:0){
                            if isSelected {
                                Image(systemName: tabItems[index].1)
                                    .foregroundColor(Color.grabGreen)
                                    .bold()
                            } else {
                                Image(systemName: tabItems[index].1)
                            }
                                
                            Spacer()
                                .frame(height: 10)
                            if isSelected {
                                Text(tabItems[index].0)
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.grabGreen)
                                    .fontWeight(.bold)
                            } else {
                                Text(tabItems[index].0)
                                    .font(.system(size: 12))
                                    .fontWeight(.regular)
                            }
                        }
                        .frame(width: screenWidth/6, height: screenWidth/6, alignment: .bottom)
                        .padding(.bottom, screenWidth/5/2.4)
                    }
                    .onTapGesture {
                        currentlySelected = index
                    }
                }
            }
            .background(Color.white)
            .frame(width: screenWidth, height: screenWidth/6)
        }
        .frame(width: screenWidth, height: screenHeight)
        .ignoresSafeArea()
    }
}

#Preview {
    TabView(currentlySelected: 0)
}
