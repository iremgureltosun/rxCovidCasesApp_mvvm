//
//  ChartXAxisFormatter.swift
//  ArkCovid
//
//  Created by irem TOSUN on 20.06.2022.
//

import Charts
import Foundation

class ChartXAxisFormatter: NSObject {
    var dateFormatter: DateFormatter?
}

extension ChartXAxisFormatter: AxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        if let dateFormatter = dateFormatter {
            let date = Date(timeIntervalSince1970: value)
            return dateFormatter.string(from: date)
        }

        return ""
    }
}
