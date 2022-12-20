//
//  MoyaNetworkManager.swift
//  TableView_v5
//
//  Created by Galina Iaroshenko on 20.12.2022.
//

import Foundation
import Moya

final class MoyaNetworkManager {
   
    var headers: [String : String] {
        var headersDictionary = [String : String]()
        headersDictionary["accept"] = "text/plain"
        headersDictionary["content-type"] = "application/json; charset=utf-8"
        return headersDictionary
    }
    
    let baseUrl: String = ""
    static let shared = MoyaNetworkManager()

    func mainRequest<T: WDTargetType>(_ request: T,
                     withComplition completionHandler: @escaping (ResponseAPI) -> ()) {
        
        let endpointClosure = { [self] (target: T) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            var urlComponents = URLComponents(string: baseUrl)
            urlComponents?.path = target.path
            
            let url = (baseUrl+target.path).removingPercentEncoding ?? ""
            
            return Endpoint(url: url, sampleResponseClosure: defaultEndpoint.sampleResponseClosure,
                            method: target.method,
                            task: target.task,
                            httpHeaderFields: target.headers)
        }
        
        let provider = MoyaProvider<T>(endpointClosure: endpointClosure, stubClosure: MoyaProvider.immediatelyStub)
        
        provider.request(request) { result in
            switch result {
            case .success(let response):
                completionHandler(ResponseAPI(statusCode: 0, data: response.data))
            case .failure(let error):
                completionHandler(ResponseAPI(withError: error))
            }
        }
    }
}

