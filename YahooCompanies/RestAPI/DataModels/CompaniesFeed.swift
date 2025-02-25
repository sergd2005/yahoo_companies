//
//  CompaniesFeed.swift
//  YahooCompanies
//
//  Created by Sergii D on 2/25/25.
//

struct CompanyDataModel: Codable {
    let marketCap: MarketCapDataModel
    let name, symbol: String
}

// MARK: - MarketCap
struct MarketCapDataModel: Codable {
    let fmt, longFmt: String
    let raw: Int
}

typealias CompaniesFeedDataModels = [CompanyDataModel?]

