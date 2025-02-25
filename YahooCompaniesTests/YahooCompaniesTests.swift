//
//  YahooCompaniesTests.swift
//  YahooCompaniesTests
//
//  Created by Sergii D on 2/25/25.
//

import Testing
@testable import YahooCompanies

struct YahooCompaniesTests {

    @Test func example() async throws {
        print(try await CompaniesFeedRestApi().fetchFeed())
    }

}
