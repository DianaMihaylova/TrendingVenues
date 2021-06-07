//
//  BaseAPIRequest.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 6.06.21.
//

import Foundation

class BaseAPIRequest: APIRequest {
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var baseUrl: String {
        return APIManager.shared.baseURL
    }
    
    var version: String {
        return "1"
    }
    
    var path: String {
        return ""
    }
    
    var headers: [String: String] = ["Content-Type": "application/json"]
    
    var pathParameters: [String]?
    var queryParameters: [String: String]?
    var bodyJSONObject: Any?
    
    required init(pathParameters: [String]? = nil,
                  queryParameters: [String: String]? = nil,
                  bodyJSONObject: Any? = nil) {
        self.pathParameters = pathParameters
        self.queryParameters = queryParameters
        self.bodyJSONObject = bodyJSONObject
    }
    
}
