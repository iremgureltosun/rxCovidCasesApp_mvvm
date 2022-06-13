//
//  SearchService.swift
//  ArkCovid
//
//  Created by irem TOSUN on 7.06.2022.
//

import Combine
import Foundation
import RxCocoa
import RxSwift

protocol SearchServiceProtocol: AnyObject {
    func getAllCovidCases(by countryName: String) throws -> Observable<Welcome>
    func getAllCovidCases(of list: [String]) throws -> Observable<[Welcome]> 
}

// MARK: extension for converting out RecipeModel to jsonObject

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

class SearchService: SearchServiceProtocol {
    let session: URLSession
    let endPoint: SearchEndpoint
    private var bag = DisposeBag()

    init(session: URLSession = URLSession.shared) {
        self.session = session
        endPoint = SearchEndpoint()
    }

    lazy var requestObservable = RequestObservable(config: .default)

    func getAllCovidCases(by countryName: String) throws -> Observable<Welcome> {
        let request = endPoint.getUrlRequest(countryName: countryName)
        return requestObservable.callAPI(request: request)
    }

    func getAllCovidCases(of list: [String]) throws -> Observable<[Welcome]> {
        let urlRequestList = endPoint.getUrlRequestList(of: list)
        return requestObservable.callAPI2(for: urlRequestList)
    }
}
