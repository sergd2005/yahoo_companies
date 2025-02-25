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
    @State private var sortByName = true
    
    var body: some Scene {
        WindowGroup {
            TabView {
                CompaniesFeedView(sortOrder: sortOrder, dataCoordinator: DataCoordinator())
                    .tabItem {
                        Text("Companies")
                    }
                SettingsView(sortByName: $sortByName)
                    .tabItem {
                        Text("Settings")
                    }
                    .onChange(of: sortByName) { oldValue, newValue in
                        sortOrder = sortByName ? SortDescriptor(\Company.name) : SortDescriptor(\Company.cap, order: .reverse)
                    }
            }
        }
        .modelContainer(for: Company.self)
    }
}
