//
//  FAQItem.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 21/02/2024.
//

import Foundation


struct FAQItem: Identifiable {
    var id = UUID()
    var question: String
    var intent: Intent
    
    init(question: String, intent: Intent) {
        self.question = question
        self.intent = intent
    }
}
