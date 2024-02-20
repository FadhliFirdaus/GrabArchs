//
//  Model.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 20/02/2024.
//

import Foundation

struct HistoryModel:Hashable, Equatable {
    let restaurantName:String
    let restaurantRes:String
    let restaurantDistance:Float
    let topOffer:Offer
    let offerValue:Int
}
