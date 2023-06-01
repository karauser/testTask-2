//
//  NetworkManager.swift
//  rsttur_karavaev
//
//  Created by Sergey on 24/05/23.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    private init() {}
    
    func fetchData(completion: @escaping (Result<Response, Error>) -> Void) {
        guard let url = URL(string: "https://example.com/api/data") else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Response.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

enum APIError: Error {
    case invalidURL
}
