//
//  HistoricalSearchServiceProtocol.swift
//  ArkCovid
//
//  Created by irem TOSUN on 18.06.2022.
//

import Foundation
import RxSwift

protocol HistoricalSearchServiceProtocol: AnyObject {
    func getHistoricalData(type: HistoricalSearchType, by countryName: String) throws -> Observable<HistoricalResponse>
}
