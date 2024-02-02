//
//  webServices.swift
//  Lumi
//
//  Created by Rishabh Sharma on 27/04/22.
//

import Foundation
enum WebServices { }

enum LMApiCode: Int {
    case success = 200
    case undetermined = 404
    case badRequest = 400
}

extension NSError {
    convenience init(localizedDescription : String) {
        self.init(domain: "AppNetworkingError", code: 0, userInfo: [NSLocalizedDescriptionKey : localizedDescription])
    }
    convenience init(code : Int, localizedDescription : String) {
        self.init(domain: "AppNetworkingError", code: code, userInfo: [NSLocalizedDescriptionKey : localizedDescription])
    }
    convenience init(code : Int, localizedDescription : String, userInfo: [String: Any]?) {
        self.init(domain: "AppNetworkingError", code: code, userInfo: [NSLocalizedDescriptionKey : localizedDescription, NSLocalizedRecoverySuggestionErrorKey : userInfo as Any])
    }
}

extension WebServices {

    // MARK: - Common POST API
    static func commonPostAPI(parameters: JSONDictionary,
                              endPoint: EndPoint,
                              loader: Bool = true,
                              response : @escaping APIResponse) {
        AppNetworking.POST(endPoint: endPoint.path, parameters: parameters, loader: loader) { (result) in
            switch result {
            case .success(let json):
                let code = LMApiCode(rawValue: json["statusCode"].intValue) ?? .undetermined
                switch code {
                case .success:
                    response(.success(json))
                default:
                    let error = NSError(code: code.rawValue, localizedDescription: json["message"].string ?? "somethingUnexpectedHappened", userInfo: json["info"].dictionaryObject)
                    response(.failure(error))
                }
            case .failure(let error):
                response(.failure(error))
            }
        }
    }

    // MARK: - Common PATCH API
    static func commonPatchAPI(parameters: JSONDictionary, endPoint: EndPoint, toAppend : String = "", loader: Bool = true, response : @escaping APIResponse) {
        let path = toAppend.isEmpty ? endPoint.path : endPoint.path + "/\(toAppend)"
        AppNetworking.PATCH(endPoint: path, parameters: parameters, loader: loader) { (result) in
            switch result {
            case .success(let json):
                let code = LMApiCode(rawValue: json["statusCode"].intValue) ?? .undetermined
                switch code {
                case .success:
                    response(.success(json))
                default:
                    response(.failure(NSError(localizedDescription: json["message"].string ?? "somethingUnexpectedHappened")))
                }
            case .failure(let error):
                response(.failure(error))
            }
        }
    }

    // MARK: - Common POST API with raw JSON
    @discardableResult
    static func commonPostWithRawJSONAPI(parameters: JSONDictionary, endPoint: EndPoint, toAppend: String = "",loader: Bool = true,response : @escaping APIResponse) -> URLSessionDataTask? {
        let path = toAppend.isEmpty ? endPoint.path : endPoint.path + "/\(toAppend)"
        return AppNetworking.POSTWithRawJSON(endPoint: path, parameters: parameters, loader: loader) { (result) in
            switch result {
            case .success(let json):
                let code = LMApiCode(rawValue: json["statusCode"].intValue) ?? .undetermined
                switch code {
                case .success:
                    response(.success(json))
                default:
                    let error = NSError(code: code.rawValue, localizedDescription: json["message"].string ?? "somethingUnexpectedHappened", userInfo: json["info"].dictionaryObject)
                    response(.failure(error))
                }
            case .failure(let error):
                response(.failure(error))
            }
        }
    }

    // MARK: - GET API For GIPHY
    @discardableResult
    static func getAPIForGiphy(url: String = "",
                               parameters: JSONDictionary,
                               response : @escaping APIResponse) -> URLSessionDataTask? {

        return AppNetworking.GET(endPoint: url, parameters: parameters, loader: false) { (result) in
            switch result {
            case .success(let json):
                let code = LMApiCode(rawValue: json["meta"]["status"].intValue) ?? .undetermined
                switch code {
                case .success:
                    response(.success(json))
                default:
                    response(.failure(NSError(localizedDescription: json["meta"]["msg"].string ?? "somethingUnexpectedHappened")))
                }
            case .failure(let error):
                response(.failure(error))
            }
        }
    }

    // MARK: - Common GET API
    @discardableResult
    static func commonGetAPI(parameters: JSONDictionary,endPoint: EndPoint,toAppend : String = "",loader: Bool = true, response : @escaping APIResponse) -> URLSessionDataTask? {
        let path = toAppend.isEmpty ? endPoint.path : endPoint.path + "/\(toAppend)"
        return AppNetworking.GET(endPoint: path, parameters: parameters, loader: loader) { (result) in
            switch result {
            case .success(let json):
                let code = LMApiCode(rawValue: json["statusCode"].intValue) ?? .undetermined
                switch code {
                case .success:
                    response(.success(json))
                default:
                    let error = NSError(code: code.rawValue, localizedDescription: json["message"].string ?? "somethingUnexpectedHappened", userInfo: json.dictionaryObject)
                    response(.failure(error))
                }
            case .failure(let error):
                response(.failure(error))
            }
        }
    }

    // MARK: - Common DELETE API
    static func commonDeleteAPI(parameters: JSONDictionary,endPoint: EndPoint,toAppend : String = "",loader: Bool = true,response : @escaping APIResponse) {
        let path = toAppend.isEmpty ? endPoint.path : endPoint.path + "/\(toAppend)"
        AppNetworking.DELETE(endPoint: path, parameters: parameters, loader: loader) { (result) in
            switch result {
            case .success(let json):
                let code = LMApiCode(rawValue: json["statusCode"].intValue) ?? .undetermined
                switch code {
                case .success:
                    response(.success(json))
                default:
                    response(.failure(NSError(localizedDescription: json["message"].string ?? "somethingUnexpectedHappened")))
                }
            case .failure(let error): response(.failure(error))
            }
        }
    }

    // MARK: - Common Delete API with Append on URL
    static func commonDeleteAPIWithAppendinURL(parameters: JSONDictionary,endPoint: EndPoint,append:String,loader: Bool = true,response : @escaping APIResponse) {
        let endPoint = endPoint.path+"/"+append

        AppNetworking.DELETE(endPoint: endPoint, parameters: parameters, loader: loader) { (result) in
            switch result {
            case .success(let json):
                let code = LMApiCode(rawValue: json["statusCode"].intValue) ?? .undetermined
                switch code {
                case .success:
                    response(.success(json))
                default:
                    let error = NSError(code: code.rawValue, localizedDescription: json["message"].string ?? "somethingUnexpectedHappened", userInfo: json.dictionaryObject)
                    response(.failure(error))
                }
            case .failure(let error): response(.failure(error))
            }
        }
    }

    // MARK: - Common Post API with Appending URL
    static func commonPostAPIWithAppendingURL(parameters: JSONDictionary,endPoint: EndPoint,append:String,loader: Bool = true,response : @escaping APIResponse) {
        let endPoint = endPoint.path+"/"+append
        AppNetworking.POST(endPoint: endPoint, parameters: parameters, loader: loader) { (result) in
            switch result {
            case .success(let json):
                let code = LMApiCode(rawValue: json["statusCode"].intValue) ?? .undetermined
                switch code {
                case .success:
                    response(.success(json))
                default:
                    let error = NSError(code: code.rawValue, localizedDescription: json["message"].string ?? "somethingUnexpectedHappened", userInfo: json.dictionaryObject)
                    response(.failure(error))
                }
            case .failure(let error): response(.failure(error))
            }
        }
    }

    // MARK: - Common Get API with Appending URL
    @discardableResult
    static func commonGetAPIWithAppendingURL(parameters:JSONDictionary,endPoint:EndPoint,append:String,loader: Bool = true,response : @escaping APIResponse) -> URLSessionDataTask? {
        let endPoint = endPoint.path+"/"+append
        return AppNetworking.GET(endPoint: endPoint, parameters: parameters, loader: loader) { (result) in
            switch result {
            case .success(let json):
                let code = LMApiCode(rawValue: json["statusCode"].intValue) ?? .undetermined
                switch code {
                case .success:
                    response(.success(json))
                default:
                    let error = NSError(code: code.rawValue, localizedDescription: json["message"].string ?? "somethingUnexpectedHappened", userInfo: json.dictionaryObject)
                    response(.failure(error))
                }
            case .failure(let error): response(.failure(error))
            }
        }
    }

    // MARK: - Common POST API
    static func commonDeleteRawJsonAPI(parameters: JSONDictionary,endPoint: EndPoint,loader: Bool = true,response : @escaping APIResponse) {
        AppNetworking.deleteWithRawJson(endPoint: endPoint.path, parameters: parameters, loader: loader) { (result) in
            switch result {
            case .success(let json):
                let code = LMApiCode(rawValue: json["statusCode"].intValue) ?? .undetermined
                switch code {
                case .success:
                    response(.success(json))
                default:
                    let error = NSError(code: code.rawValue, localizedDescription: json["message"].string ?? "somethingUnexpectedHappened", userInfo: json.dictionaryObject)
                    response(.failure(error))
                }
            case .failure(let error): response(.failure(error))
            }
        }
    }

    // MARK: - Common PATCH API with raw JSON
    static func commonPatchWithRawJSONAPI(parameters: JSONDictionary,endPoint: EndPoint,toAppend : String = "",loader: Bool = true,response : @escaping APIResponse) {
        let path = toAppend.isEmpty ? endPoint.path : endPoint.path + "/\(toAppend)"
        AppNetworking.PATCHWithRawJSON(endPoint: path, parameters: parameters, loader: loader) { (result) in
            switch result {
            case .success(let json):
                let code = LMApiCode(rawValue: json["statusCode"].intValue) ?? .undetermined
                switch code {
                case .success:
                    response(.success(json))
                default:
                    let error = NSError(code: code.rawValue, localizedDescription: json["message"].string ?? "somethingUnexpectedHappened", userInfo: json.dictionaryObject)
                    response(.failure(error))
                }
            case .failure(let error):
                response(.failure(error))
            }
        }
    }

    // MARK: - Common PUT API with raw JSON
    static func commonPutWithRawJSONAPI(parameters: JSONDictionary,endPoint: EndPoint,loader: Bool = true,response : @escaping APIResponse) {
        AppNetworking.PUTWithRawJSON(endPoint: endPoint.path, parameters: parameters, loader: loader) { (result) in
            switch result {
            case .success(let json):
                let code = LMApiCode(rawValue: json["statusCode"].intValue) ?? .undetermined
                switch code {
                case .success:
                    response(.success(json))
                default:
                    let error = NSError(code: code.rawValue, localizedDescription: json["message"].string ?? "somethingUnexpectedHappened", userInfo: json.dictionaryObject)
                    response(.failure(error))
                }
            case .failure(let error):
                response(.failure(error))
            }
        }
    }
}
