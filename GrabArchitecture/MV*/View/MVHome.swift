//
//  MVVMHome.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 14/02/2024.
//

import Foundation
import SwiftUI

struct MVHome: View {
    var body: some View {
        ZStack {
            MVHomeView()
            TabView()
        }
    }
}


/**  Previews and Subviews : **/
#Preview {
    MVHome()
}

