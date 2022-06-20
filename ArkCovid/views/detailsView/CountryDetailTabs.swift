//
//  CountryDetailTabs.swift
//  ArkCovid
//
//  Created by irem TOSUN on 18.06.2022.
//

import Charts
import Foundation

// MARK: This definition if for managing tabs

enum CountryDetailTabs: Int, CaseIterable {
    case totalCaseCount = 0
    case death = 1
    case recoveryCount = 2
    case map = 3

    var detail: (title: String, historicalSearchType: HistoricalSearchType?, lineColor: NSUIColor?) {
        switch self {
        case .totalCaseCount: return ("Cases", HistoricalSearchType.confirmed, NSUIColor.yellow)
        case .death: return ("Deaths", HistoricalSearchType.death, NSUIColor.red)
        case .recoveryCount: return ("Recovery", HistoricalSearchType.recovered, NSUIColor.cyan)
        case .map: return ("Map", nil, nil)
        }
    }
}
