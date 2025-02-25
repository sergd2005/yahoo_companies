//
//  ContentView.swift
//  YahooCompanies
//
//  Created by Sergii D on 2/25/25.
//

import SwiftUI
import SwiftData

struct CompaniesFeedView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var companies: [Company]
    
    private let dataCoordinator: DataCoordinator
    
    init(sortOrder: SortDescriptor<Company> = SortDescriptor(\Company.name),
         dataCoordinator: DataCoordinator = DataCoordinator()) {
        _companies = Query(sort:[sortOrder])
        self.dataCoordinator = dataCoordinator
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(companies) {
                    Text($0.name)
                }
            }
        }
        .padding()
        .task {
            do {
                dataCoordinator.modelContext = modelContext
                try await dataCoordinator.updateData()
            } catch (let error) {
                print(error)
            }
        }
    }
}

#Preview {
    CompaniesFeedView()
}
