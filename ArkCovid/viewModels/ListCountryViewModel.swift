//
//  ListCountryViewModel.swift
//  ArkCovid
//
//  Created by irem TOSUN on 7.06.2022.
//

import Foundation
import os.log
import RxCocoa
import RxSwift
import UIKit

final class HomeViewModel {
    private var disposeBag = DisposeBag()
    var searchService: CovidSearchServiceProtocol!
    private var sourceItems: BehaviorRelay<[CountryCellViewModel]> = BehaviorRelay(value: [])
    private var filteredItems: BehaviorRelay<[CountryCellViewModel]> = BehaviorRelay(value: [])
    let searchText = BehaviorRelay<String>(value: "")
    var listItems: Observable<[CountryCellViewModel]> {
        return filteredItems.asObservable()
    }

    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        searchService = (appDelegate.assembler?.resolver.resolve(CovidSearchServiceProtocol.self))!
        
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
        do {
            var list = [CountryCellViewModel]()
            try searchService.getAllCovidCases(of: Constants.Network.countriesToList)
                .subscribe(
                    onNext: { response in
                        list = response.compactMap { CountryCellViewModel($0.all, city: $0.berlin) }
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
