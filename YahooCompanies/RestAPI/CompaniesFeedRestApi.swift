//
//  CompaniesFeedRestApi.swift
//  YahooCompanies
//
//  Created by Sergii D on 2/25/25.
//

import Foundation

enum CompaniesFeedRestApiError: Error {
    case badHTTPResponse
}

final class CompaniesFeedRestApi {
    private let url = URL(string: "https://us-central1-fbconfig-90755.cloudfunctions.net/getAllCompanies")!
    
    func fetchFeed() async throws -> CompaniesFeedDataModels {
        let (jsonData, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw CompaniesFeedRestApiError.badHTTPResponse }
        return try JSONDecoder().decode(CompaniesFeedDataModels.self, from: jsonData)
    }
}
