//
//  ArkCovidTests.swift
//  ArkCovidTests
//
//  Created by irem TOSUN on 7.06.2022.
//

@testable import ArkCovid
import Foundation
import RxCocoa
import RxSwift
import XCTest

class ArkAPITests: XCTestCase {
    func testEndpointReturnsDataForCountry() {
        let bag = DisposeBag()
        do {
            let searchService = SearchService()
            let expectation = self.expectation(description: "No results in response data")

            try searchService.getAllCovidCases(of: Constants.Network.countriesToList).subscribe(
                onNext: { result in
                    print("Found result \(result)")
                },
                onError: { error in
                    print(error)
                },
                onCompleted: {
                    expectation.fulfill()
                    print("Completed ")

                }).disposed(by: bag)
            waitForExpectations(timeout: 6, handler: nil)
        } catch { print(error) }
    }
}
