//
//  Constants.swift
//  ArkCovid
//
//  Created by irem TOSUN on 7.06.2022.
//

import Foundation
import UIKit

public struct Colors {
    public static let vBackground = UIColor.secondarySystemBackground
    public static let vTitle = UIColor.black
}

struct Constants {
    static let animationDelayInSeconds = 3
    static let localeIdentifier = "en_US"

    struct Network {
        static let baseUrlPath = "https://covid-api.mmediagroup.fr/v1/cases"
        static let countryUrlPath = "?country="
        static let globalPath = "global"
        static let countriesToList = ["Argentina", "Austria", "Bahamas", "Denmark", "Canada", "Belgium"]
    }

    struct Translations {
        static let loading = "Loading"
        static let ok = "OK"
        static let cancel = "Cancel"

        struct Error {
            static let jsonDecodingError = "Error: JSON decoding error."
            static let noDataError = "Error: No data received."
            static let noResultsFound = "No results were found for your search."
            static let statusCode404 = "404 Not found"
        }
    }

    struct MovieAPI {
        static let shortTextLength = 50
        static let minIdentifier = 1
        static let maxIdentifier = 1000
    }
}
