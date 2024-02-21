//
//  Enums.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 21/02/2024.
//

import Foundation


enum ArchPages:String {
    case Picker = "Picker"
    case MVVM = "MVVM"
    case MVC = "MVC"
    case MV = "MV"
    case VIPER = "VIPER"
}

enum Offer:String {
    case free = "Free item"
    case discount = "Discount"
    case delivery = "Free Delivery"
    case unlimited = "Grab Unlimited"
    case noOffer = ""
}

enum Intent:String {
    case Home = "GHome"
    case Activity = "GActivity"
    case Finance = "GFinance"
    case Messages = "GMessages"
    case Account = "GAccount"
    case Food = "GFood"
    case Car = "GCar"
    case Grocery = "GGrocery"
    case Shopping = "GShopping"
    case Hotel = "GHotel"
    case Donate = "GDonate"
    case Delivery = "GDelivery"
    case LoyaltyFAQ = "GLoyaltyFAQ"
    case RewardsFAQ = "GRewardsFAQ"
    case Subscriptions = "GSubscriptions"
    case Challenges = "GChallenges"
}
