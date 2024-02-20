//
//  DebugUtils.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 14/02/2024.
//

import Foundation
import SwiftUI


func d(_ a:Any){
    print("debugging : \(a)")
}


func d(_ key:String, _ a:Any){
    print("debugging _\(key)_ : \(a)")
}


extension View {
    func debugRed() -> some View {
        self.background(Color.red)
    }
    func debugYellow() -> some View {
        self.background(Color.yellow)
    }
    func debugBlue() -> some View {
        self.background(Color.blue)
    }
}
