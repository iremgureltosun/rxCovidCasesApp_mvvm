//
//  SearchEndPoint.swift
//  ArkCovid
//
//  Created by irem TOSUN on 7.06.2022.
//

import Foundation
import RxCocoa
import RxSwift

// MARK: RequestObservable class

public class RequestObservable {
    private lazy var jsonDecoder = JSONDecoder()
    private var urlSession: URLSession
    public init(config: URLSessionConfiguration) {
        urlSession = URLSession(configuration:
            URLSessionConfiguration.default)
    }

    public func callAPI<Welcome: Decodable>(request: URLRequest) -> Observable<Welcome> {
        return Observable.create { observer in
            let task = self.urlSession.dataTask(with: request) { data,
                response, error in
                if let httpResponse = response as? HTTPURLResponse {
                    let statusCode = httpResponse.statusCode
                    do {
                        let _data = data ?? Data()
                        guard HttpStatusCode.Success.range.contains(statusCode) else {
                            if httpResponse.statusCode == HttpStatusCode.ClientError.notFoundError {
                                throw HTTPError.notFoundResponse
                            } else {
                                throw HTTPError.invalidResponse(httpResponse.statusCode)
                            }
                        }
                        let objs = try self.jsonDecoder.decode(Welcome.self, from:
                            _data)
                        observer.onNext(objs)

                    } catch {
                        observer.onError(error)
                    }
                }

                observer.onCompleted()
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }

    func callAPI2(for urlRequestList: [URLRequest]) -> Observable<[Welcome]> {
        var dict = [Int: Observable<Welcome>]()
        for i in 0 ..< urlRequestList.count {
            dict[i] = callAPI(request: urlRequestList[i])
        }
        return Observable.combineLatest(dict.map { $0.value })
    }
}

struct SearchEndpoint {
    public var baseURL: URL {
        return URL(string: "\(Constants.Network.baseUrlPath)")!
    }

    public var searchCountryURL: URL {
        return URL(string: "\(Constants.Network.countryUrlPath)")!
    }

    public var method: String {
        return "GET"
    }

    public var headers: [String: String]? {
        return nil
    }
}

extension SearchEndpoint {
    public func getUrlRequestList(of countries: [String]) -> [URLRequest] {
        var result = [URLRequest]()
        for countryName in countries {
            let request = getUrlRequest(countryName: countryName)
            result.append(request)
        }
        return result
    }

    public func getUrlRequest(countryName: String) -> URLRequest {
        let url = searchByURL(countryName: countryName)
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        return request
    }

    private func searchByURL(countryName: String) -> URL {
        let urlString = baseURL.absoluteString + Constants.Network.countryUrlPath + countryName
        guard let url = URL(string: urlString) else {
            fatalError("Failed to create URL for endpoint: \(urlString)")
        }
        return url
    }
}
