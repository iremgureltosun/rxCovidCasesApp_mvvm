//
//  SearchServiceProtocol.swift
//  ArkCovid
//
//  Created by irem TOSUN on 18.06.2022.
//

import Foundation
import RxSwift

protocol CovidSearchServiceProtocol: AnyObject {
   
    func getAllCovidCases(of list: [String]) throws -> Observable<[CovidCasesResponse]>
}


