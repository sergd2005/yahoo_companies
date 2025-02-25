//
//  Company.swift
//  YahooCompanies
//
//  Created by Sergii D on 2/25/25.
//
import Foundation
import SwiftData

@Model
class Company {
    var name: String
    var symbol: String
    var cap: Int
    var isFavorite: Bool
    
    init(name: String = "", symbol: String = "", cap: Int = 0, isFavorite: Bool = false) {
        self.name = name
        self.symbol = symbol
        self.cap = cap
        self.isFavorite = isFavorite
    }
}
