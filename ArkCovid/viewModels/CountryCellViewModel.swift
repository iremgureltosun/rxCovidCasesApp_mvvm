//
//  CountryCellViewModel.swift
//  ArkCovid
//
//  Created by irem TOSUN on 18.06.2022.
//

import Foundation

struct CountryCellViewModel {
    var countryName: String
    var confirmedCaseCount: Int
    var recoveredCaseCount: Int
    var deathCount: Int

    var population, sqKMArea: Int
    var lifeExpectancy: String
    var elevationInMeters: String
    var continent, abbreviation, location: String
    var iso: Int
    var capitalCity, lat, long, updated: String

    
    init(countryName: String, confirmedCase: Int, recoveredCase: Int) {
        self.countryName = countryName
        confirmedCaseCount = confirmedCase
        recoveredCaseCount = recoveredCase
        deathCount = 0
        population = 0
        sqKMArea = 0
        lifeExpectancy = ""
        elevationInMeters = ""
        continent = ""
        abbreviation = ""
        location = ""
        iso = 0
        capitalCity = ""
        lat = ""
        long = ""
        updated = ""
    }

    init(_ all: All, city: CityModel?) {
        countryName = all.country
        confirmedCaseCount = all.confirmed ?? 0
        recoveredCaseCount = all.recovered ?? 0
        deathCount = all.deaths ?? 0
        population = Int(all.population)
        sqKMArea = all.sqKMArea
        lifeExpectancy = all.lifeExpectancy ?? ""
        elevationInMeters = String(all.elevationInMeters ?? 0)
        continent = all.continent
        abbreviation = all.abbreviation
        location = all.location
        iso = all.iso
        capitalCity = all.capitalCity

        lat = all.lat ?? city?.lat ?? "0"
        long = all.long ?? city?.long ?? "0"
        updated = all.updated ?? ""
    }
}
