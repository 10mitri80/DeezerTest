//
//  EndPoints.swift
//  DeezerTest
//
//  Created by Dimitri Cadars on 18-09-17.
//  Copyright © 2018 Dimitri Cadars. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "http://api.deezer.com"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Artists: Endpoint {
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "/search/artist?q="
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
    
    enum Albums : Endpoint {
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "/artist/"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
    
    enum Tracks : Endpoint {
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "/album/"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
