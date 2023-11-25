//
//  CookieAPI.swift
//  Cookie-SwiftUI
//
//  Created by 김유빈 on 2023/11/26.
//

import Foundation
import Moya

enum CookieAPI {
    case getBoard
}

extension CookieAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://54.180.55.79:8080/api/v1")!
    }
    
    var path: String {
        switch self {
        case .getBoard:
            return "/board"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .getBoard:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getBoard:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Authorization": "test"]
    }
}

