//
//  CountryDetailsViewModel.swift
//  ArkCovid
//
//  Created by irem TOSUN on 18.06.2022.
//

import Foundation
import RxSwift
import Swinject

protocol CompletionListener {
    func statusChanged(text: String)
    func didFinishFetching()
}

final class CountryDetailsViewModel {
    var listener: CompletionListener?
    private var disposeBag = DisposeBag()
    var detailsModel: CountryCellViewModel?
    var historicalSearchService: HistoricalSearchServiceProtocol!
    var historicalDictionary: [HistoricalSearchType: DetailsModel] = [:]
    var deathFetchComplete = false
    var confirmedFetchComplete = false
    var recoveredFetchComplete = false

    init(detailsModel: CountryCellViewModel, listener: CompletionListener) {
        self.listener = listener
        self.detailsModel = detailsModel
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        historicalSearchService = (appDelegate.assembler?.resolver.resolve(HistoricalSearchServiceProtocol.self))!

        DispatchQueue.global(qos: .background).async {
            self.fetch(countryName: detailsModel.countryName, searchType: .death)
            self.fetch(countryName: detailsModel.countryName, searchType: .confirmed)
            self.fetch(countryName: detailsModel.countryName, searchType: .recovered)
        }
    }

    func fetch(countryName: String, searchType: HistoricalSearchType) {
        var data: DetailsModel?
        do {
            try historicalSearchService.getHistoricalData(type: searchType, by: countryName)
                .subscribe(
                    onNext: { response in
                        data = response.all
                    },
                    onError: { error in
                        print(error)
                    },
                    onCompleted: {
                        print("\(searchType) details of \(countryName) fetched.")
                        guard let model = data else { return }
                        self.historicalDictionary[searchType] = model

                        switch searchType {
                        case .recovered: self.recoveredFetchComplete = true
                        case .confirmed: self.confirmedFetchComplete = true
                        case .death: self.deathFetchComplete = true
                        }
                        self.listener?.statusChanged(text: searchType.statusText)
                        if self.confirmedFetchComplete && self.deathFetchComplete && self.recoveredFetchComplete {
                            self.listener?.didFinishFetching()
                        }
                    })
                .disposed(by: disposeBag)

        } catch {
            print(error.localizedDescription)
        }
    }
}
