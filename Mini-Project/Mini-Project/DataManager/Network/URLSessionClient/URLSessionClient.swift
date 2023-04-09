//
//  URLSessionClient.swift
//  Mini-Project
//
//  Created by Adji Firmansyah on 09/04/23.
//

import Foundation

class URLSessionClient {
    typealias ResultLogin = Result<ResponseLogin, GeneralNetworkError>
    typealias ResultHome = Result<ResponseListUser, GeneralNetworkError>
    private let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    func fetchLogin(dataLogin: UserLoginModel, path: String, completion: @escaping (ResultLogin) -> Void) {
        let urlComponents = createURL(input: path)
        guard let url = urlComponents.url, let dataUser = try? JSONEncoder().encode(dataLogin) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = dataUser
        urlRequest.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        
        urlSession.dataTask(with: urlRequest) { data, response, error in
            if let data = data, let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200:
                    DispatchQueue.main.async {
                        guard let decodeData = try? JSONDecoder().decode(ResponseLogin.self, from: data) else { return }
                        completion(.success(decodeData))
                    }
                default:
                    completion(.failure(.missingPassword))
                }
            } else {
                completion(.failure(.networkError))
            }
        }.resume()
    }
    
    func fetchListUser(path: String, completion: @escaping (ResultHome) -> Void) {
        guard let url = createURL(input: path).url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        urlSession.dataTask(with: urlRequest) { data, response, error in
            if let data = data, let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200:
                    DispatchQueue.main.async {
                        guard let decode = try? JSONDecoder().decode(ResponseListUser.self, from: data) else { return completion(.failure(.unexpectedData))}
                        completion(.success(decode))
                                
                    }
                default:
                    completion(.failure(.networkError))
                }
            } else {
                completion(.failure(.networkError))
            }
        }
        
    }
    
    func createURL(input path: String) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "reqres.in"
        urlComponents.path = path
        return urlComponents
    }
}





