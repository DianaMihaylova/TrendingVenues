//
//  APIManager.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 6.06.21.
//

import Foundation
import Alamofire

protocol ApiManagerProtocol {
    
    /// Base url of the request
    var baseURL: String { get }
    
    /// Request execution
    /// - Parameters:
    ///   - request: The APIRequest to be executed
    ///   - completion: callback Data, Response, Error
    func sendRequest(request: APIRequest,
                     completion: @escaping (Data?, HTTPURLResponse?, Error?) -> Void)
    
}

class APIManager: ApiManagerProtocol {
    
    static let shared = APIManager()
    
    var baseURL: String {
        Constants.baseUrl
    }
    
    func sendRequest(request: APIRequest,
                     completion: @escaping (Data?, HTTPURLResponse?, Error?) -> Void) {
        AF.request(request.asUrlRequest()).response { response in
            completion(response.data, response.response, response.error)
        }
    }
    
}
