//
//  Date.swift
//  ArkCovid
//
//  Created by irem TOSUN on 18.06.2022.
//

import Foundation

extension Date {
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }

    var epochTime: Int {
        return Int(timeIntervalSince1970)
    }

    static func createDate(from value: Int) -> Date {
        return Date(timeIntervalSince1970: TimeInterval(value))
    }
}
