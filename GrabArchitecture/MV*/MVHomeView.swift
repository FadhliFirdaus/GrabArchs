    //
    //  MVHomeView.swift
    //  GrabArchitecture
    //
    //  Created by Fadhli Firdaus on 14/02/2024.
    //

import Foundation
import SwiftUI

struct MVHomeView:View {
    var body: some View {
        ZStack{
            GeometryReader {reader in
                VStack(spacing:0){
                    ZStack {
                        Rectangle()
                            .frame(width: screenWidth, height: screenHeight/3.5, alignment: .top)
                            .foregroundColor(.pink.opacity(0.33))
                            .ignoresSafeArea()
                        ZStack {
                            VStack(alignment:.leading, spacing:0) {
                                Text("Exclusive Deals for Jaya Grocer Members")
                                    .bold()
                                Spacer().frame(height: 10)
                                Button(action: {
                                    
                                }, label: {
                                    HStack(spacing:0){
                                        Text("Shop in-store or on GrabMart")
                                        Spacer().frame(width: 10)
                                        Image(systemName: "arrow.right.circle")
                                            .resizable()
                                            .frame(width: 20, height: 20, alignment: .center)
                                        Spacer()
                                    }
                                })
                            }
                        }
                        .padding(10)
                        .frame(width: screenWidth, height: screenHeight/3.5, alignment: .center)
                        .ignoresSafeArea()
                            
                    }
                    .frame(width: screenWidth, height: screenHeight/3.5, alignment: .top)

                    
                    SearchBarView()
                        .padding(.top, -reader.safeAreaInsets.top)
                        .padding(.top, -screenWidth/7/2)
                    LogosList()
                    Spacer()
                        .frame(height: 10)
                    CardListView()
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    MVHomeView()
}

struct CardListView:View {
    let cards:[(String, String, String)] = [
        ("Balance", "RM15.00", "dollarsign.square"),
        ("Browse food", "Asian", "cart"),
        ("Rate", "Restoran Abe Din", "star.leadinghalf.filled"),
        ("Points", "0", "crown")
    ]
    var body: some View {
        ScrollView(.horizontal){
            HStack(spacing:0){
                ForEach(0..<cards.count, id: \.self){
                    let data = cards[$0]
                    HStack{
                        VStack(alignment: .leading, spacing:0){
                            Spacer()
                            Text("\(data.0)")
                                .fixedSize()
                            Spacer()
                            Text("\(data.1)")
                                .fixedSize()
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding(5)
                        VStack(spacing:0){
                            Spacer()
                            Image(systemName: data.2)
                                .foregroundColor(Color.green)
                                .bold()
                        }
                        .padding(5)
                    }
                    .frame(height: screenWidth/6, alignment: .center)
                    .background(
                        Rectangle()
                            .cornerRadius(6)
                            .foregroundColor(Color.gray.opacity(0.05))
                    )
                    .padding(6)
                }
            }
        }
        .padding(5)
        .scrollIndicators(.hidden)
    }
}

struct SearchBarView: View {
    @State var searchText = ""
    var body: some View {
        HStack(spacing:0){
            Spacer()
                .frame(width: 10)
            CardButtonWithImage(systemName: "barcode.viewfinder")
                .frame(width: screenWidth/7, height: screenWidth/7, alignment: .center)
            
            Spacer()
                .frame(width: 10)
            
            SearchBarWithFavourite()
            
            Spacer()
                .frame(width: 10)
        }
        .padding(.zero)
    }
}

struct LogosList: View {
    var body: some View {
        HStack(spacing:0){
            ForEach(0..<logos.count, id:\.self){index in
                VStack(spacing:0){
                    if index != 3 {
                        Image(logos[index].1)
                            .resizable()
                            .frame(width: screenWidth/4, height: screenWidth/4, alignment: .center)
                            .scaledToFit()
                            .scaleEffect(0.75)
                    } else {
                        GreenCircleWithImage(systemName: logos[index].1)
                    }
                    Text("\(logos[index].0)")
                        .font(Font.custom("inter", size: 15))
                }
                .frame(alignment: .center)
            }
        }
    }
}

struct GreenCircleWithImage: View {
    let systemName:String
    var body: some View {
        ZStack {
            Circle().foregroundColor(Color.green)
                .frame(width: screenWidth/6, height: screenWidth/6, alignment: .center)
                .opacity(0.15)
            Image(systemName: self.systemName)
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth/4, height: screenWidth/4, alignment: .center)
                .scaleEffect(0.5)
                .foregroundColor(Color.green)
        }
    }
}

struct SearchBarWithFavourite: View {
    @State var searchText = ""
    var body: some View {
        ZStack {
            CardViewUI()
                .frame(height: screenWidth/7)
            HStack(spacing:0){
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: screenWidth/7, height: screenWidth/7, alignment: .center)
                    .scaleEffect(0.4)
                VStack(spacing:0){
                    Spacer()
                    TextField("Search Food", text: $searchText)
                    Spacer()
                }
                Divider()
                    .frame(height: screenWidth/7)
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: screenWidth/7, height: screenWidth/7, alignment: .center)
                    .scaleEffect(0.4)
            }
        }
        .frame(height: screenWidth/7, alignment: .center)
    }
}

struct CardButtonWithImage: View {
    let systemName:String
    var body: some View {
        ZStack {
            CardViewUI()
            Image(systemName: systemName)
                .resizable()
                .padding(12)
        }
    }
}
