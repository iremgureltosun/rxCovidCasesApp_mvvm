//
//  ListCountryViewModel.swift
//  ArkCovid
//
//  Created by irem TOSUN on 7.06.2022.
//

import Combine
import Foundation
import os.log
import RxCocoa
import RxSwift
import UIKit

class HomeViewModel {
    private var disposeBag = DisposeBag()
    var searchService: SearchServiceProtocol!
    private var sourceItems: BehaviorRelay<[CountryCellViewModel]> = BehaviorRelay(value: [])
    private var filteredItems: BehaviorRelay<[CountryCellViewModel]> = BehaviorRelay(value: [])
    let searchText = BehaviorRelay<String>(value: "")
    var listItems: Observable<[CountryCellViewModel]> {
        return filteredItems.asObservable()
    }

    init() {
        fetch()

        searchText
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe({ [unowned self] event in

                guard let query = event.element, !query.isEmpty else {
                    self.filteredItems.accept(self.sourceItems.value)
                    return
                }

                self.filteredItems.accept(
                    self.sourceItems.value.filter {
                        $0.countryName.lowercased().contains(query.lowercased())
                    }
                )

            })
            .disposed(by: disposeBag)
    }

    func fetch() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        searchService = (appDelegate.assembler?.resolver.resolve(SearchServiceProtocol.self))!
        do {
            var list = [CountryCellViewModel]()
            try searchService.getAllCovidCases(of: Constants.Network.countriesToList)
                .subscribe(
                    onNext: { response in
                        list = response.compactMap { CountryCellViewModel($0.all) }
                    },
                    onError: { error in
                        print(error)
                    },
                    onCompleted: {
                        print("List is \(list.count) elements")
                        self.sourceItems.accept(list)
                    })
                .disposed(by: disposeBag)

        } catch {
            print(error.localizedDescription)
        }
    }
}

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

    init(_ all: All) {
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
        capitalCity = all.capitalCity ?? ""
        lat = all.lat ?? "0"
        long = all.long ?? "0"
        updated = all.updated ?? ""
    }
}
