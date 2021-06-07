//
//  APIRequest.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 6.06.21.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET", post = "POST", put = "PUT", patch = "PATCH", delete = "DELETE"
}

protocol APIRequest {
    
    /// Http method
    var httpMethod: HTTPMethod { get }
    
    /// Base url
    var baseUrl: String { get }
    
    /// Base path of the endpoint, without any possible parameters
    var path: String { get }
    
    /// Parameters added to the path
    var pathParameters: [String]? { get set }
    
    /// Version of the request
    var version: String { get }
    
    /// Query parameters
    var queryParameters: [String: String]? { get set }
    
    /// Added to the body as JSON Data
    var bodyJSONObject: Any? { get set }
    
    /// Request headers
    var headers: [String: String] { get }
    
    init(pathParameters: [String]?,
         queryParameters: [String: String]?,
         bodyJSONObject: Any?)
    
}

extension APIRequest {
    
    var endpoint: String {
        var endpoint = version.isEmpty ? "\(baseUrl)\(path)" : "\(baseUrl)/v\(version)/\(path)"
        
        if let pathParameters = pathParameters,
           pathParameters.count > 0 {
            pathParameters.forEach { parameter in
                if parameter.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 {
                    endpoint += "/\(parameter)"
                }
            }
        }
        
        if let queryParameters = queryParameters,
           queryParameters.count > 0 {
            var queryItems = "?"
            queryParameters.forEach {
                queryItems.append("\($0.key)=\($0.value)&".replacingOccurrences(of: " ", with: "%20"))
            }
            endpoint.append(queryItems)
        }
        
        return endpoint
    }
    
    func asUrlRequest() -> URLRequest {
        let endpointURL = URL(string: endpoint)
        var urlRequest = URLRequest(url: endpointURL!)
        urlRequest.httpMethod = httpMethod.rawValue
        
        // Sets the http body, if a bodyJsonObject has been provided
        if let bodyJSONObject = bodyJSONObject {
            // In case already encoded Data has been provided
            if let jsonData = bodyJSONObject as? Data {
                urlRequest.httpBody = jsonData
            } else {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: bodyJSONObject)
                    urlRequest.httpBody = jsonData
                } catch {
                    print("ERROR serializing json body object for: \(path): \(error.localizedDescription)")
                }
            }
        }
        return urlRequest
    }

    func execute(completion: @escaping (Data?, HTTPURLResponse?, Error?) -> Void) {
        APIManager.shared.sendRequest(request: self, completion: completion)
    }
    
    /// Executes the request and returns the actual parsed model in the callback
    /// - Parameters:
    ///   - type: The model type to be parsed to
    ///   - completion: callback (ParsedModel?, HTTPURLResponse?, Error?)
    func executeParsed<T: Codable>(of type: T.Type, completion: @escaping (T?, HTTPURLResponse?, Error?) -> Void) {
        execute { data, urlResponse, error in
            var parsedData: T?
            guard let data = data else {
                completion(parsedData, urlResponse, error)
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            parsedData = try? decoder.decode(type, from: data)
            completion(parsedData, urlResponse, error)
        }
    }

}
