//
//  NetworkResponseTest.swift
//  EnglishLeagueAppTests
//
//  Created by Mariam Moataz on 13/10/2023.
//

import XCTest
@testable import EnglishLeagueApp

final class NetworkResponseTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchData(){
        let url = "https://api.football-data.org/v2/competitions/2021/matches"
        let expectation = expectation(description: "Fetch Matches")
        NetworkModel.shared.fetchData(url: url) { (apiResponse: ApiResultsModel?, error: Error?) in
            guard let apiResponse = apiResponse else{
                XCTFail("Failed to fetch Matches")
                expectation.fulfill()
                return
            }
            XCTAssertNotNil(apiResponse)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 20,handler: nil)
    }
    
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
