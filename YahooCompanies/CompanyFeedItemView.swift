//
//  CompanyFeedItemView.swift
//  YahooCompanies
//
//  Created by Sergii D on 2/25/25.
//

import SwiftUI

final class CompanyFeedItemViewModel: ObservableObject {
    @Published var company: Company
    
    init(company: Company) {
        self.company = company
    }
}

struct CompanyFeedItemView: View {
    @Environment(\.modelContext) var modelContext
    @ObservedObject var viewModel: CompanyFeedItemViewModel
    @State var showDetails: Bool = false
    
    init(viewModel: CompanyFeedItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Image(systemName: "")
                .frame(width: 200, height: 200)
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
            HStack {
                Text(viewModel.company.name)
                    .onTapGesture {
                        showDetails.toggle()
                    }
                Label("", systemImage: viewModel.company.isFavorite ? "heart.fill" : "heart")
                    .onTapGesture {
                        viewModel.company.isFavorite.toggle()
                        do {
                            try modelContext.save()
                        } catch(let error) {
                            print(error)
                        }
                    }
            }
            if showDetails {
                Text("\(viewModel.company.symbol): \(viewModel.company.cap)")
            }
        }
    }
}

#Preview {
    CompanyFeedItemView(viewModel: CompanyFeedItemViewModel(company: Company(name: "Test")))
}
