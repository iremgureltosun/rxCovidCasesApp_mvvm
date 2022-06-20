//
//  String+.swift
//  ArkCovid
//
//  Created by irem TOSUN on 18.06.2022.
//

import Foundation

extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.calendar = Calendar.current
        dateFormatter.dateFormat = Constants.dateFormat
        let date = dateFormatter.date(from: self)

        return date
    }
}
