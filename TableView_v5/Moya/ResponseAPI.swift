//
//  ResponseAPI.swift
//  TableView_v5
//
//  Created by Galina Iaroshenko on 20.12.2022.
//

import Foundation
import SwiftyJSON
import Alamofire

let defaultJSONDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    // TODO: Setup it
    return decoder
}()

let defaultJSONEncoder: JSONEncoder = {
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .secondsSince1970
    // TODO: Setup it
    return encoder
}()

protocol Transporting: Decodable {}

enum WDNetworkError: Error {
    case errorText(String)
    case noError
}

extension WDNetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .errorText(let text):
            return text
        case .noError:
            return "noError"
        }
    }
}

class ResponseAPI {
    // MARK: - Properties
    var code: Int!
    var jsonResponse: JSON!
    var dataResponse: Data!
    var connectionError: Error!
    
    // MARK: - Class Initialization
    init(withError error: Error, json: JSON? = nil, data: Data = Data()) {
        self.code = 999
        self.jsonResponse = (json ?? "")
        self.dataResponse = data
        self.connectionError = error
    }
    
    init(fromJSON json: JSON? = nil, statusCode: Int, data: Data = Data()) {
        self.code = statusCode
        self.jsonResponse = (json ?? "")
        self.dataResponse = data
        self.connectionError = WDNetworkError.noError
    }
}

func parseData<T: Decodable>(
    responseAPI: ResponseAPI,
    type: T.Type ,
    completion: @escaping(Result<T, WDNetworkError>) -> Void) {
        defer { print("My JSON PARSE \n \t\t\t\t \(T.self) ") }
        let decoder = JSONDecoder()
        do {
            let data = try decoder.decode(T.self, from: responseAPI.dataResponse)
            completion((.success(data)))
        } catch let parseError {
            print(parseError)
            completion(.failure(.errorText(parseError.localizedDescription)))
        }
    }

func parseJson<T: Decodable>(json: JSON = "", type: T.Type , completion: @escaping(_ myStruct: T?, _ error: Error?) -> ()) {
    defer { print("My JSON PARSE \n \t\t\t\t \(T.self) ") }
    do {
        let myStruct = try JSONDecoder().decode(T.self, from: json.rawData())
        completion(myStruct, nil)
    } catch let error {
        print("error = \(error)")
        print("ERROR IN \(T.self)  \n\n \(error), \n\n\(json)")
        completion(nil, error)
    }
}

func parseJson<T: Decodable>(json: JSON = "", type: T.Type, completion: @escaping(Result<T,WDNetworkError>) -> ()) {
    defer { print("My JSON PARSE \n \t\t\t\t \(T.self) ") }
    do {
        let myStruct = try JSONDecoder().decode(T.self, from: json.rawData())
        completion(.success(myStruct))
    } catch let parseError {
        print("ERROR IN \(T.self)  \n\n \(parseError), \n\n\(json)")
        completion(.failure(.errorText(parseError.localizedDescription)))
    }
}

