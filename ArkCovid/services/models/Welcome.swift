import Foundation

// MARK: - All

struct All: Codable {
    let confirmed, recovered, deaths: Int?
    let country: String
    let population, sqKMArea: Int
    let lifeExpectancy: String?
    let elevationInMeters: Int?
    let continent, abbreviation, location: String
    let iso: Int
    let capitalCity, lat, long, updated: String?

    enum CodingKeys: String, CodingKey {
        case confirmed, recovered, deaths, country, population
        case sqKMArea = "sq_km_area"
        case lifeExpectancy = "life_expectancy"
        case elevationInMeters = "elevation_in_meters"
        case continent, abbreviation, location, iso
        case capitalCity = "capital_city"
        case lat, long, updated
    }
}

struct Welcome: Codable {
    let all: All

    enum CodingKeys: String, CodingKey {
        case all = "All"
    }
}

