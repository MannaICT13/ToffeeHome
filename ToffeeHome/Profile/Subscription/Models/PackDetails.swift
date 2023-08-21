//
//  PackDetails.swift
//  Binge
//
//  Created by Fahad on 10/8/23.
//

import Foundation

struct PackItem: Identifiable {
    let id: String = UUID().uuidString
    var PackDuration: String
    var PackPrice: Double
    var PackPriceWithoutVAT: Double
    var PackValidity: Int
}

let packItems: [PackItem] =  [
    .init(PackDuration: "Daily", PackPrice: 11.5, PackPriceWithoutVAT: 10, PackValidity: 1),
    .init(PackDuration: "Weekly", PackPrice: 46.5, PackPriceWithoutVAT: 40, PackValidity: 7),
    .init(PackDuration: "Monthly", PackPrice: 113.85, PackPriceWithoutVAT: 99, PackValidity: 30),
    .init(PackDuration: "Daily", PackPrice: 11.5, PackPriceWithoutVAT: 10, PackValidity: 1),
    .init(PackDuration: "Weekly", PackPrice: 46.5, PackPriceWithoutVAT: 40, PackValidity: 7),
    .init(PackDuration: "Monthly", PackPrice: 113.85, PackPriceWithoutVAT: 99, PackValidity: 30)
    
]

struct BankCard: Identifiable{
    let id: String = UUID().uuidString
    var CardName: String

}
let bankCards: [BankCard] = [
    .init(CardName: "AmericanExpress"),
    .init(CardName: "Visa"),
    .init(CardName: "MasterCard"),
]


