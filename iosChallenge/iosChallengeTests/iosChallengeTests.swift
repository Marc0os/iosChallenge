//
//  iosChallengeTests.swift
//  iosChallengeTests
//
//  Created by Marcos Costa on 27/08/24.
//

import XCTest
@testable import iosChallenge

final class iosChallengeTests: XCTestCase {
    
    var networkManager: NetworkManager!
    
    
    override func setUpWithError() throws {
        networkManager = NetworkManager()
    }
    
    override func tearDownWithError() throws {
        networkManager = nil
    }
    
    func testFetchReposData() {
        let expectation = self.expectation(description: "Fetching repos data")
        let page = 1
        let expectedValue = 30
        
        _ = networkManager.fetchReposData(urlString: "/search/repositories?q=language:Swift&sort=stars&page=\(page)") { items, error in
            XCTAssertNotNil(items)
            XCTAssertNil(error)
            XCTAssertEqual(items?.count, expectedValue)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchPullsData() {
        let expectation = self.expectation(description: "Fetching pulls data")
        let owner = "shadowsocks"
        let repository = "ShadowsocksX-NG"
        let expectedValue = 4
        
        _ = networkManager.fetchPullsData(urlString: "/repos/\(owner)/\(repository)/pulls") { pulls, error in
            XCTAssertNotNil(pulls)
            XCTAssertNil(error)
            XCTAssertEqual(pulls?.count, expectedValue)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
