//
//  NetworkService.swift
//  Converter
//
//  Created by Aleksandr on 24.10.2022.
//

import Foundation

protocol NetworkRequests {
    func getList(
        completion: @escaping (Result<[String: NetworkCrypto], NetworkError>) -> Void
    )
    func getLive(
        completion: @escaping () -> NetworkCrypto
    )
}
final class NetworkService: NetworkRequests {
    private enum AccessToken: String {
        case accessTokenValue = "b706bfadadec67b4aa21809f7d334b99"
        case accessTokenKey = "access_key"
    }
    
    func getList(completion: @escaping (Result<[String: NetworkCrypto], NetworkError>) -> Void) {
        guard let url = createURL(pen: API.list) else {
            completion(.failure(.incorrectUrl))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
            guard let data = data else {
                completion(.failure(.internetError))
                return
            }
            do {
                let jsonResp = try JSONDecoder().decode(NetworkList.self, from: data)
                completion(.success(jsonResp.crypto))
            } catch {
                completion(.failure(.internetError))
            }
        }
        .resume()
    }
    func getLive(completion: @escaping () -> NetworkCrypto) {
        print("LIVE")
    }
    private func createURL(pen: String) -> URL? {
        let base = API.base
        guard let urlComponents = NSURLComponents(string: base + pen) else { return nil }
        urlComponents.queryItems = [
            URLQueryItem(name: AccessToken.accessTokenKey.rawValue, value: AccessToken.accessTokenValue.rawValue)
        ]
        return urlComponents.url
    }
}
