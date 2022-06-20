//
//  HistoricalSearchType.swift
//  ArkCovid
//
//  Created by irem TOSUN on 18.06.2022.
//

import Foundation

public enum HistoricalSearchType {
    case confirmed
    case death
    case recovered

    var url: String {
        switch self {
        case .recovered:
            return "\(Constants.Network.historicalUrlPath)\(Constants.Network.recoveredUrlPath)\(Constants.Network.historicalCountrySearchPath)"
        case .confirmed:
            return "\(Constants.Network.historicalUrlPath)\(Constants.Network.confirmedUrlPath)\(Constants.Network.historicalCountrySearchPath)"
        case .death:
            return "\(Constants.Network.historicalUrlPath)\(Constants.Network.deathUrlPath)\(Constants.Network.historicalCountrySearchPath)"
        }
    }

    var statusText: String {
        switch self {
        case .death: return "Please wait fetched historical deaths"
        case .recovered: return "Please wait fetched historical recoveries"
        case .confirmed: return "Please wait fetched historical confirmed cases"
        }
    }
}
