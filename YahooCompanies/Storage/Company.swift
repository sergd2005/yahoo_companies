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
    
    init(name: String = "", symbol: String = "", cap: Int = 0) {
        self.name = name
        self.symbol = symbol
        self.cap = cap
    }
}
