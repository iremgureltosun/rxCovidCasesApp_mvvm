//
//  DeathModel.swift
//  ArkCovid
//
//  Created by irem TOSUN on 18.06.2022.
//

import Foundation

// MARK: HistoricalResponse
public struct HistoricalResponse: CovidResponseProtocol, Codable {
    public typealias EntityType = HistoricalResponse.Type
    let all: DetailsModel

    enum CodingKeys: String, CodingKey {
        case all = "All"
    }
}

// MARK: - DetailsModel
struct DetailsModel: Codable {
    let country: String
    let population, sqKMArea: Int
    let lifeExpectancy: String
    let elevationInMeters: Int?
    let continent, abbreviation, location: String
    let iso: Int
    let capitalCity: String
    let dates: [String: Int]

    enum CodingKeys: String, CodingKey {
        case country, population
        case sqKMArea = "sq_km_area"
        case lifeExpectancy = "life_expectancy"
        case elevationInMeters = "elevation_in_meters"
        case continent, abbreviation, location, iso
        case capitalCity = "capital_city"
        case dates
    }
}
/*struct DateModel: Codable{
    let date: String
    let count: Int
}*/
