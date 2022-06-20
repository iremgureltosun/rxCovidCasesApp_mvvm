//
//  RequestObservable.swift
//  ArkCovid
//
//  Created by irem TOSUN on 18.06.2022.
//



import Foundation
import RxCocoa
import RxSwift

// MARK: RequestObservable class

public class RequestObservable<T> where T: CovidResponseProtocol{
    typealias EntityType = T.Type
    
    private lazy var jsonDecoder = JSONDecoder()
    private var urlSession: URLSession
    public init(config: URLSessionConfiguration) {
        urlSession = URLSession(configuration:
            URLSessionConfiguration.default)
    }

    public func callAPI<T: Decodable>(request: URLRequest) -> Observable<T> {
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
                        let objs = try self.jsonDecoder.decode(T.self, from:
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

    func callAPI2(for urlRequestList: [URLRequest]) -> Observable<[T]> {
        var dict = [Int: Observable<T>]()
        for i in 0 ..< urlRequestList.count {
            dict[i] = callAPI(request: urlRequestList[i])
        }
        return Observable.combineLatest(dict.map { $0.value })
    }
}
