import Foundation

public struct CovidCasesResponse: CovidResponseProtocol, Codable {
    public typealias EntityType = CovidCasesResponse.Type
    let all: All
    let berlin: CityModel?
    let frenchGuiana: CityModel?
    
    enum CodingKeys: String, CodingKey {
        case all = "All"
        case berlin = "Berlin"//for germany
        case frenchGuiana = "French Guiana"//for france
    }
}

// MARK: - All

struct All: Codable {
    let confirmed, recovered: Int?
    let deaths: Int?
    let country: String
    let population, sqKMArea: Int
    let lifeExpectancy: String?
    let elevationInMeters: Int?
    let continent, abbreviation, location: String
    let iso: Int
    let capitalCity: String
    let updated: String?
    let lat, long: String?

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

// MARK: - CityModel

struct CityModel: Codable {
    let lat, long: String
    let confirmed, recovered, deaths: Int
    let updated: String
}
