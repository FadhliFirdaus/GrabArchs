    //
    //  MVVMHome.swift
    //  GrabArchitecture
    //
    //  Created by Fadhli Firdaus on 21/02/2024.
    //

import Foundation
import SwiftUI

#Preview {
    MVVMHome()
}

struct MVVMHome : View {
    @ObservedObject var viewModel = ViewModel()
    @State var offsetAnimation = 0.0
    var body:some View{
        VStack{
            VStack(spacing:0){
                ZStack {
                    Rectangle()
                        .frame(width: screenWidth, height: screenHeight/4.5, alignment: .center)
                        .foregroundColor(.grabGreen)
                    HStack {
                        Text("\(viewModel.getUserName())")
                            .textModifier(size: 21, weight: .light)
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .foregroundColor(Color.white)
                            .padding(.leading, 12)
                        Spacer().frame(width: 10)
                        ZStack {
                            Circle()
                                .foregroundColor(Color.yellow)
                                .overlay {
                                    Circle().stroke(lineWidth: 6)
                                        .foregroundColor(Color.white)
                                }
                                .frame(width: screenWidth/6, height: screenWidth/6, alignment: .center)
                            let name = Array(viewModel.getUserName())
                            Text("\(String(name[0]))")
                                .textModifier(size: 24, weight: .heavy)
                                .foregroundColor(Color.grabBrown)
                        }
                        .padding(.trailing, 12)
                    }
                    
                }
                HStack(spacing:0){
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: screenWidth - 36, height: 60, alignment: .center)
                            .foregroundColor(Color.yellow)
                        HStack {
                            Image("unlimited")
                                .resizable()
                                .offset(x:offsetAnimation)
                            .frame(width: 60, height: 60, alignment: .center)
                            Spacer()
                            Text("\(viewModel.getSubscriptionWelcome())")
                                .padding(.trailing, viewModel.isUserSubscribed ? 20: 0)
                                .multilineTextAlignment(.center)
                            Spacer()
                            ZStack {
                                if(!viewModel.isUserSubscribed){
                                    Circle().foregroundColor(Color.white)
                                    Image(systemName: "chevron.right")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15, height: 15, alignment: .center)
                                } else {
                                    Circle().foregroundColor(Color.white)
                                    Image(systemName: "heart.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(Color.grabGreen)
                                        .frame(width: 15, height: 15, alignment: .center)
                                }
                            }
                            .offset(x:-offsetAnimation)
                            .frame(width: 30, height: 30, alignment: .center)
                            Spacer()
                                .frame(width: viewModel.isUserSubscribed ? 20: 20)
                        }
                    }
                    .onTapGesture {
                        viewModel.updateSubscriptionStatus()
                        if(viewModel.isUserSubscribed){
                            withAnimation(.spring){
                                offsetAnimation = screenWidth - 36 - 60
                            }
                        }
                    }
                    .frame(width: screenWidth - 36, height: 60, alignment: .center)
                    Spacer()
                }
                .padding(.top, -30)
                Spacer()
                    .frame(height: 10)
                Text(viewModel.isUserSubscribed ?
                     "You are subscribed!":"You are not a subscribed user!")
                Spacer()
                    .frame(height: 30)
                NavigationView {
                    List(viewModel.faqList, id: \.id) { item in
                        NavigationLink(destination: IntentSheet(item: item)) {
                            HStack {
                                Spacer().frame(width: 10)
                                Text("\(item.question)")
                                Spacer()
                            }
                        }
                    }
                }

                .background(Color.white)
                .listStyle(.plain)
                Spacer()
                
            }
            .frame(width: screenWidth, height: screenHeight, alignment: .center)
            .ignoresSafeArea()
        }
    }
}

struct IntentSheet: View {
    let item:FAQItem
    
    var body: some View {
        Text("intent : \(item.intent.rawValue)")
    }
}
