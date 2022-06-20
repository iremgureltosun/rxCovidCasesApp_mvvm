//
//  SearchService.swift
//  ArkCovid
//
//  Created by irem TOSUN on 7.06.2022.
//

import Foundation
import RxCocoa
import RxSwift

// MARK: extension for converting out Model to jsonObject

fileprivate extension Encodable {
    var dictionaryValue: [String: Any?]? {
        guard let data = try? JSONEncoder().encode(self),
              let dictionary = try? JSONSerialization.jsonObject(with: data,
                                                                 options: .allowFragments) as? [String: Any] else {
            return nil
        }
        return dictionary
    }
}

 class BaseSearchService<T> where T: CovidResponseProtocol {
    typealias EntityType = T.Type
    
    let session: URLSession
    let endPoint: SearchEndpoint
    private var bag = DisposeBag()

    init(session: URLSession = URLSession.shared) {
        self.session = session
        endPoint = SearchEndpoint()
    }

    lazy var requestObservable = RequestObservable<T>(config: .default)

    func getAllCovidCases(by countryName: String) throws -> Observable<T> {
        let request = endPoint.getUrlRequest(countryName: countryName)
        return requestObservable.callAPI(request: request)
    }

    func getAllCovidCases(of list: [String]) throws -> Observable<[T]> {
        let urlRequestList = endPoint.getUrlRequestList(of: list)
        return requestObservable.callAPI2(for: urlRequestList)
    }
    
    public func getHistoricalData(type: HistoricalSearchType, by countryName: String) throws -> Observable<T> {
        let request = endPoint.getHistoricalUrlRequest(type: type, countryName: countryName)
        return requestObservable.callAPI(request: request)
    }
}

