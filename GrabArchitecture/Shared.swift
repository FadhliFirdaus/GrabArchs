//
//  Shared.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 14/02/2024.
//

import Foundation


struct Arch {
    let archName:String
    let archDesc:String
}

struct BannerAd {
    let bannerName:String
    let bannerLogoRes:String
    let bannerDesc:String
    let bannerIntent:String
}

struct CommercialCard:Hashable{
    let ccName: String
    let ccCTAText: String
    let ccRes: String
    let ccIntent: Intent
    let ccShortDesc: String

}

let archData = [
    
    Arch(archName: "MVVM", archDesc: "MVVM in iOS separates an app's code into Model (data and logic), View (UI), and ViewModel (bridge between Model and View). ViewModels prepare data for display and handle user interactions, keeping Views lightweight. This pattern enhances code maintainability, testability, and modularity in iOS development."),
    
    Arch(archName: "MVC", archDesc: "MVC (Model-View-Controller) is an architectural pattern commonly used in iOS development. In MVC, the Model represents data and logic, the View represents the user interface, and the Controller acts as an intermediary, handling user input and updating both the Model and View accordingly. This pattern promotes separation of concerns, making code more organized and maintainable."),
    
    Arch(archName: "MV", archDesc: "Mohammad Azam's SwiftUI architecture simplifies the traditional MVVM pattern by eliminating the ViewModel layer. In his approach, Views directly interact with the Model, which acts as an aggregate root. This streamlines the architecture, leveraging SwiftUI's features for better performance. Azam advises embracing SwiftUI's capabilities instead of adding unnecessary complexity."),
    
    Arch(archName: "VIPER", archDesc: "VIPER (View, Interactor, Presenter, Entity, Router) is an iOS architectural pattern. It separates concerns into View, Interactor, Presenter, Entity, and Router, promoting modularity and testability in app development. Each component has a specific role, enhancing scalability and maintainability.")
]


let tabItems: [(String, String)] = [
    ("Home", "safari.fill"),
    ("Activity", "list.bullet.clipboard"),
    ("Finance", "dollarsign.circle"),
    ("Messages", "ellipsis.message"),
    ("Account", "person.crop.circle"),
]

let logos:[(String, String)] = [
    ("GrabFood", "food"),
    ("GrabGrocer", "grocer"),
    ("GrabCar", "car"),
    ("All", "ellipsis")
]

let cards:[(String, String, String)] = [
    ("Balance", "RM15.00", "dollarsign.square"),
    ("Browse food", "Asian", "cart"),
    ("Rate", "Restoran Abe Din", "star.leadinghalf.filled"),
    ("Points", "0", "crown")
    ]

let mockPurchaseHistories:[HistoryModel] = [
    HistoryModel(restaurantName: "Abu Bakar Kopitiam", restaurantRes: "abubakarkopitiam", restaurantDistance: 1.3, topOffer: .delivery, offerValue: 2),
    HistoryModel(restaurantName: "Ah Meng Roti Canai", restaurantRes: "ahmeng", restaurantDistance: 12.0, topOffer: .discount, offerValue: 15),
    HistoryModel(restaurantName: "Delite Exquisite", restaurantRes: "deliteexquisite", restaurantDistance: 7.0, topOffer: .noOffer, offerValue: 0),
    HistoryModel(restaurantName: "Pho King", restaurantRes: "phoking", restaurantDistance: 4.6, topOffer: .unlimited, offerValue: 2)
]

let mockAd = BannerAd(bannerName: "Jaya Grocer", bannerLogoRes: "pngjaya", bannerDesc: "Come shop at Jaya Grocer Today for ", bannerIntent: "https://klec.jayagrocer.com")

let mockCommercialCards = [
    CommercialCard(ccName: "Food order", ccCTAText: "Buy Now", ccRes: "", ccIntent: .Food, ccShortDesc: "Fill your tummy"),
    CommercialCard(ccName: "Donation", ccCTAText: "Donate Now", ccRes: "", ccIntent: .Donate, ccShortDesc: "Help Malaysians affected by the flood"),
    CommercialCard(ccName: "Grab Express", ccCTAText: "Deliver Now", ccRes: "", ccIntent: .Delivery, ccShortDesc: "Delivery parcels with GrabExpress")
]

let mockFAQ:[(String, Intent)] = [
    ("Partner Loyalty Programme" , .LoyaltyFAQ),
    ("Rewards" , .RewardsFAQ),
    ("Subscriptions" , .Subscriptions),
    ("Challenges" , .Challenges)
]
