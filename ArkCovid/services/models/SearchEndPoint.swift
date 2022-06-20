//
//  SearchEndPoint.swift
//  ArkCovid
//
//  Created by irem TOSUN on 7.06.2022.
//

import Foundation

struct SearchEndpoint {
    public var baseURL: URL {
        return URL(string: "\(Constants.Network.baseUrlPath)")!
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

    public func getHistoricalUrlRequest(type: HistoricalSearchType, countryName: String) -> URLRequest {
        let url = historicalSearchByURL(type: type, countryName: countryName)
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        return request
    }

    private func historicalSearchByURL(type: HistoricalSearchType, countryName: String) -> URL {
        let urlPath = type.url + countryName
        guard let url = URL(string: urlPath) else {
            fatalError("Failed to create URL for endpoint: \(urlPath)")
        }
       
        return url
    }

    private func searchByURL(countryName: String) -> URL {
        let urlString = baseURL.absoluteString + Constants.Network.countryUrlPath + countryName
        guard let url = URL(string: urlString) else {
            fatalError("Failed to create URL for endpoint: \(urlString)")
        }
        return url
    }
}
