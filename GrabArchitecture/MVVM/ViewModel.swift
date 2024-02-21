//
//  ViewModel.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 21/02/2024.
//

import Foundation
import SwiftUI
import Combine

class ViewModel: ObservableObject {
    
    @Published var isUserSubscribed: Bool = false
    private var subscriptionModel:SubscriptionModel
    private let welcomeMessageSubscribed = "Welcome to GrabUnlimited!"
    private let welcomeMessageNotSubscribed = "Subscribe to GrabUnlimited now!"

    
    init(subscriptionModel: SubscriptionModel = SubscriptionModel()) {
        self.subscriptionModel = subscriptionModel
    }
    
    var faqList: [FAQItem] {
        return mockFAQ.map { FAQItem(question: $0.0, intent: $0.1) }
    }


    func getUserName() -> String{
        return "Muhammad Fadhli Firdaus bin Sulaiman"
    }
    
    func updateSubscriptionStatus() {
        let newStatus = subscriptionModel.getUserSubscriptionStatus()
        isUserSubscribed = newStatus
    }
    
    func getSubscriptionWelcome() -> String {
        return isUserSubscribed ? welcomeMessageSubscribed : welcomeMessageNotSubscribed
    }
}
