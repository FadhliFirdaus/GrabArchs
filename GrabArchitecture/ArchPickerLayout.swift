    //
    //  ArchPickerLayout.swift
    //  GrabArchitecture
    //
    //  Created by Fadhli Firdaus on 13/02/2024.
    //

import Foundation
import SwiftUI

struct ArchPickerLayout: View {
    @State var currentPage:ArchPages = .Picker
    var body: some View {
        switch currentPage {
        case .Picker:
            VStack{
                ForEach(Array(archData.enumerated()), id: \.1.archName) { index, data in
                    RowOfArchs(arch: data, index: index)
                        .onTapGesture {
                            currentPage = ArchPages(rawValue: data.archName) ?? .Picker
                        }
                }
            }
        case .MVVM:
            Text("MVVM")
        case .MVC:
            Text("MVC")
        case .MV:
            MVHome()
        case .VIPER:
            Text("VIPER")
        }
    }
}


struct RowOfArchs:View {
    
    let arch:Arch
    let index:Int
    
    let rwidth = 0.9
    let rheight = 0.18
    
    var body: some View {
        ZStack{
            Rectangle()
                .cornerRadius(6.0, antialiased: true)
                .foregroundColor(Color(hex: "#9dc451"))
            
            HStack{
                LeftView(arch: arch, index: index)
                Divider()
                    .background(Color.white)
                Text("\(arch.archDesc)")
                    .font(.system(size: 12))
            }
            .padding(5)
        }
        .frame(width: rwidth * screenWidth, height: rheight * screenHeight, alignment: .top)
        .padding(10)
    }
}

struct LeftView: View {
    let arch:Arch
    let index:Int
    var body: some View {
        ZStack {
            VStack{
                ZStack {
                    CircleTextIndicator(text: "\(index + 1)")
                        .frame(width: screenWidth/10, height: screenWidth/10, alignment: .center)
                        .padding(.top, -screenWidth/20)
                }
                Spacer()
            }
            
            Rectangle()
                .frame(width: screenWidth/5, height: screenWidth/10)
                .cornerRadius(3.0)
                .foregroundColor(Color(hex: "#b46438"))
            Text("\(arch.archName)")
                .foregroundStyle(Color.white)
                .fontWeight(.bold)
        }
    }
}


#Preview {
    ArchPickerLayout()
}

