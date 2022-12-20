//
//  MoyaRequestType.swift
//  TableView_v5
//
//  Created by Galina Iaroshenko on 20.12.2022.
//

import Foundation
import Moya

public typealias RequestParametersType = (apiStringURL: String, body: [String: Any]?)

enum RequestType {
    case tasks
    case taskDetail(String)
    
    func introduced() -> RequestParametersType {
        switch self {
        case .tasks : return (apiStringURL: "tasks", body: [:])
        case .taskDetail(let id) : return (apiStringURL: "tasks", body: ["id" : id])
        }
    }
}

protocol WDTargetType: TargetType, Hashable {
    
}


extension RequestType: WDTargetType {
    static func == (lhs: RequestType, rhs: RequestType) -> Bool {
        lhs.path == rhs.path
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(path)
        hasher.combine(method)
    }
    
    var baseURL: URL {
        URL(string: "https://stackoverflow.com/")!
    }
    
    var path: String {
        switch self {
        case .tasks:
            return "tasks"
        case .taskDetail:
            return "tasks/detail"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .tasks, .taskDetail:
            return Moya.Method.get
        default:
            return Moya.Method.post
        }
    }
    
    var task: Task {
        switch self {
        case .tasks:
            return .requestParameters(
                parameters: [:],
                encoding: URLEncoding.default)
        case .taskDetail(let id):
            return .requestCompositeParameters(
                bodyParameters: ["id" : id],
                bodyEncoding: JSONEncoding.default,
                urlParameters: [:])
        default:
            return Task.requestPlain
        }
    }
    
    var headers: [String : String]? {
        var headersDictionary = MoyaNetworkManager.shared.headers
        switch self {
        default:
            headersDictionary["content-type"] = "application/json-patch+json"
            break
        }
        return  headersDictionary
    }
}

