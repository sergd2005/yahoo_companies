//
//  DataCoordinator.swift
//  YahooCompanies
//
//  Created by Sergii D on 2/25/25.
//
import SwiftData
import Foundation

@MainActor
final class DataCoordinator {
    var modelContext: ModelContext?
    private let restApi: CompaniesFeedRestApi
    
    init(restApi: CompaniesFeedRestApi = CompaniesFeedRestApi()) {
        self.restApi = restApi
    }
    
    func updateData() async throws {
        guard let modelContext else { return }
        let feed = try await restApi.fetchFeed()
        for feedItem in feed {
            if let feedItem {
                let company = Company(name: feedItem.name, symbol: feedItem.symbol, cap: feedItem.marketCap.raw)
                var fetchDescriptor = FetchDescriptor<Company>()
                let companySymbol = company.symbol
                fetchDescriptor.predicate = #Predicate { current in
                    companySymbol == current.symbol
                }
                let storedCompanies = try modelContext.fetch(fetchDescriptor)
                if storedCompanies.count > 1 {
                    storedCompanies.forEach {
                        modelContext.delete($0)
                    }
                }
                if storedCompanies.count == 1, let storedCompany = storedCompanies.first {
                    storedCompany.name = company.name
                    storedCompany.symbol = company.symbol
                    storedCompany.cap = company.cap
                    try modelContext.save()
                    return
                }
                if storedCompanies.isEmpty {
                    modelContext.insert(company)
                }
            }
        }
        try modelContext.save()
    }
}
