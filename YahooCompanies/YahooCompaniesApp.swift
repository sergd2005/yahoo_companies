//
//  YahooCompaniesApp.swift
//  YahooCompanies
//
//  Created by Sergii D on 2/25/25.
//

import SwiftUI
import SwiftData

@main
struct YahooCompaniesApp: App {
    @State private var sortOrder = SortDescriptor(\Company.name)
    
    var body: some Scene {
        WindowGroup {
            CompaniesFeedView(sortOrder: sortOrder)
        }
        .modelContainer(for: Company.self)
    }
}
