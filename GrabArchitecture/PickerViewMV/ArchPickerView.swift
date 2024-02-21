//
//  ContentView.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 13/02/2024.
//

import SwiftUI

struct ArchPickerView: View {
    
    @State var isShowingSplash = true
    @State var timer: Timer?
    @State var duration = 0
    @State var opacityAnimation =  1.0

    var body: some View {
        if isShowingSplash {
            SplashScreen()
                .opacity(opacityAnimation)
                .onAppear(perform: {
                    performSplashTimer()
                })
                
        } else {
            ArchPickerLayout()
        }
    }
    
    func performSplashTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if(duration >= 2){
                isShowingSplash = false
                timer?.invalidate()
                timer = nil
            }
            if(duration == 1){
                withAnimation(.spring){
                    opacityAnimation = 0.0
                }
            }
            duration += 1
        }
        timer?.fire()
    }
}

#Preview {
    ArchPickerView()
}
