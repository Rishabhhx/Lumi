//
//  NetworkManager.swift
//  Lumi
//
//  Created by Rishabh Sharma on 13/04/22.
//

import UIKit
import Photos
import NVActivityIndicatorView
import KeychainAccess

var resultMesage : String?
let keychain = Keychain(service: "app.Lumi")

enum AppNetworking {

    static var timeOutInterval = TimeInterval(90)

    // MARK: - Function to excute request
    @discardableResult
    private static func executeRequest(_ request: NSMutableURLRequest, _ result: @escaping APIResponse) -> URLSessionDataTask {
        let session = URLSession.shared
        session.configuration.timeoutIntervalForRequest = timeOutInterval
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, _ , error) in
            if error == nil {
                do {
                    if let jsonData = data {
                        if let jsonDataDict  = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any] {
                            debugPrint("Response: ======= \n")
                            debugPrint(jsonDataDict)
                            resultMesage = jsonDataDict["message"] as? String
                            DispatchQueue.main.async(execute: { () -> Void in
                                result(.success(JSON(jsonDataDict)))
                            })
                        }
                    } else {
                        let error = NSError.init(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey:"No Data"])
                        result(.failure(error))
                    }
                } catch let err as NSError {
                    let responseString = String(data: data!, encoding: .utf8)
                    debugPrint("responseString = \(responseString ?? "")")
                    DispatchQueue.main.async(execute: { () -> Void in
                        result(.failure(err))
                    })
                }
            } else {
                if let err = error {
                    DispatchQueue.main.async(execute: { () -> Void in
                        // MARK: - Handle No Internet
                        if let error = error as NSError?, error.domain == NSURLErrorDomain && error.code == NSURLErrorNotConnectedToInternet {
                        } else {
                            result(.failure(err as NSError))
                        }
                    })
                } else {
                    let error = NSError.init(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "somethingUnexpectedHappened"])
                    result(.failure(error))
                }
            }
        })
        dataTask.resume()
        return dataTask
    }

    // MARK: - Check refresh token and excute
    @discardableResult
    fileprivate static func checkRefereshTokenAndExecute(_ request: NSMutableURLRequest, _ loader: Bool, response : @escaping APIResponse) -> URLSessionDataTask {
        return executeRequest(request) { (result) in
            switch result {
            case .success(let json) :
                let message = json["message"].stringValue
                var apiCode: LMApiCode = .success

                if let code = LMApiCode(rawValue: json["statusCode"].intValue) {
                    apiCode = code
                } else if let code = LMApiCode(rawValue: json["meta"]["status"].intValue) {
                    apiCode = code
                } else if let code = LMApiCode(rawValue: json["cod"].intValue) {
                    apiCode = code
                }

                switch apiCode {
                case .success:
                    response(.success(json))
                case .badRequest, .undetermined:
                    response(.failure(NSError(localizedDescription: message)))
//                default:
//                    response(.success(json))
                }
            case .failure(let error) :
                response(.failure(error))
            }
        }
    }

    // MARK: - Function to request
    @discardableResult
    private static func REQUEST(withUrl url : URL?,method : String,postData : Data?,header : [String:String],loader : Bool, response : @escaping APIResponse) -> URLSessionDataTask? {
        guard let url = url else {
            let error = NSError(localizedDescription: "Url or parameters not valid")
            response(.failure(error))
            return nil
        }
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = method
        var languaeCode = "en"
               if Locale.current.languageCode == "es"{
                   languaeCode = "es"
               } else {
                   languaeCode = "en"
               }
        var updatedHeaders = header
        updatedHeaders["Device-Id"] = DeviceDetails.deviceId
        updatedHeaders["Device-Type"] = DeviceDetails.deviceType
        updatedHeaders["Device-Model"] = DeviceDetails.modelName
        updatedHeaders["Accept-Language"] = languaeCode
        updatedHeaders["device-token"] =  "SDCFCDSFVDSCVSDCVDSVSDC"
//                updatedHeaders["device-token"] =  TCUserDefaults.value(forKey: .deviceToken).stringValue
        // if else if user default else basic auth
//        if (UserDefaults.standard.object(forKey: "token") as? String) != nil {
//            updatedHeaders["Authorization"] = UserDefaults.standard.object(forKey: "token") as? String
//        } else {
//            updatedHeaders["Authorization"] = AppNetworking.basicAuth
//        }
        if keychain[KeychainVar.token.rawValue] != nil {
            updatedHeaders["Authorization"] = keychain[KeychainVar.token.rawValue]
        } else {
            updatedHeaders["Authorization"] = AppNetworking.basicAuth
        }
        debugPrint("============ \n Headers are =======> \n\n \(updatedHeaders) \n =================")
        debugPrint("============ \n Url is =======> \n\n \(url.absoluteString) \n =================")
        request.allHTTPHeaderFields = updatedHeaders
        request.httpBody = postData
        return checkRefereshTokenAndExecute(request, loader, response: response)
    }

    // MARK: - Function to get api
    @discardableResult
    static func GET(endPoint : String,
                    parameters : [String : Any] = [:],
                    headers : HTTPHeaders = [:],
                    loader : Bool = true,
                    response : @escaping APIResponse) -> URLSessionDataTask? {
        debugPrint("============ \n Parameters are =======> \n\n \(parameters) \n =================")
        var updatedHeader = headers
        updatedHeader["Content-Type"] = "application/json"
        updatedHeader["token"] = keychain[KeychainVar.token.rawValue]
        guard let urlString = (endPoint + "?" + encodeParamaters(params: parameters)).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {
            return nil
        }
        let uri = URL(string: urlString)
        return REQUEST(withUrl: uri,
                       method: "GET",
                       postData : nil,
                       header: headers,
                       loader: loader,
                       response: response)
    }

    // MARK: - Function to post api
    static func POST(endPoint : String,
                     parameters : [String : Any] = [:],
                     headers : HTTPHeaders = [:],
                     loader : Bool = true,
                     response : @escaping APIResponse) {
        debugPrint("============ \n Parameters are =======> \n\n \(parameters) \n =================")
        let uri = URL(string: endPoint)
        let postData = encodeParamaters(params: parameters).data(using: String.Encoding.utf8)
        REQUEST(withUrl: uri,
                method: "POST",
                postData : postData,
                header: headers,
                loader: loader,
                response: response)
    }

    // MARK: - Function to patch api
    static func PATCH(endPoint : String,
                      parameters : [String : Any] = [:],
                      headers : HTTPHeaders = [:],
                      loader : Bool = true,
                      response : @escaping APIResponse) {
        debugPrint("============ \n  Parameters are =======> \n\n \(parameters) \n =================")
        guard let urlString = (endPoint + "?" + encodeParamaters(params: parameters)).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {
            return
        }
        let uri = URL(string: urlString)
        REQUEST(withUrl: uri,
                method: "PATCH",
                postData : nil,
                header: headers,
                loader: loader,
                response: response)
    }

    // MARK: - Function to post with raw json
    static func POSTWithRawJSON(endPoint : String,
                                parameters : [String : Any] = [:],
                                headers : HTTPHeaders = [:],
                                loader : Bool = true,
                                response : @escaping APIResponse) -> URLSessionDataTask? {
        debugPrint("============ \n Parameters are =======> \n\n \(parameters) \n =================")
        let uri = URL(string: endPoint)
        let postData = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        var updatedHeader = headers
        updatedHeader["Content-Type"] = "application/json"
        updatedHeader["token"] = keychain[KeychainVar.token.rawValue]
//        updatedHeader["token"] = UserDefaults.standard.object(forKey: "token") as? String
        return REQUEST(withUrl: uri,
                method: "POST",
                postData : postData,
                header: updatedHeader,
                loader: loader,
                response: response)
    }

    // MARK: - Function to post with image
    static func POSTWithImage(endPoint : String,
                              parameters : [String : Any] = [:],
                              image : [String : UIImage] = [:],
                              headers : HTTPHeaders = [:],
                              loader : Bool = true,
                              response : @escaping APIResponse) {
        debugPrint("============ \n Parameters are =======> \n\n \(parameters) \n =================")
        let uri = URL(string: endPoint)
        let boundary = generateBoundary()
        let postData = createDataBody(withParameters: parameters, media: image, boundary: boundary)
        var updatedHeader = headers
        updatedHeader["Content-Type"] = "multipart/form-data; boundary=\(boundary)"
        REQUEST(withUrl: uri,
                method: "POST",
                postData : postData,
                header: updatedHeader,
                loader: loader,
                response: response)
    }

    // MARK: - Function to put api
    static func PUT(endPoint : String,
                    parameters : [String : Any] = [:],
                    headers : HTTPHeaders = [:],
                    loader : Bool = true,
                    response : @escaping APIResponse) {
        debugPrint("============ \n Parameters are =======> \n\n \(parameters) \n =================")
        let uri = URL(string: endPoint)
        let postData = encodeParamaters(params: parameters).data(using: String.Encoding.utf8)
        REQUEST(withUrl: uri,
                method: "PUT",
                postData : postData,
                header: headers,
                loader: loader,
                response: response)
    }

    // MARK: - Function to put with raw json api
    static func PUTWithRawJSON(endPoint : String,
                               parameters : [String : Any] = [:],
                               headers : HTTPHeaders = [:],
                               loader : Bool = true,
                               response : @escaping APIResponse) {
        debugPrint("============ \n Parameters are =======> \n\n \(parameters) \n =================")
        let uri = URL(string: endPoint)
        let postData = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        var updatedHeader = headers
        updatedHeader["Content-Type"] = "application/json"
        REQUEST(withUrl: uri,
                method: "PUT",
                postData : postData,
                header: updatedHeader,
                loader: loader,
                response: response)
    }

    // MARK: - Function to patch with raw json api
    static func PATCHWithRawJSON(endPoint : String,
                                 parameters : [String : Any] = [:],
                                 headers : HTTPHeaders = [:],
                                 loader : Bool = true,
                                 response : @escaping APIResponse) {
        debugPrint("============ \n Parameters are =======> \n\n \(parameters) \n =================")
        let uri = URL(string: endPoint)
        let postData = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        var updatedHeader = headers
        updatedHeader["Content-Type"] = "application/json"
        updatedHeader["token"] = keychain[KeychainVar.token.rawValue]
//        updatedHeader["token"] = UserDefaults.standard.object(forKey: "token") as? String
        REQUEST(withUrl: uri,
                method: "PATCH",
                postData : postData,
                header: updatedHeader,
                loader: loader,
                response: response)
    }

    // MARK: - Function to delete api
    static func DELETE(endPoint : String,
                       parameters : [String : Any] = [:],
                       headers : HTTPHeaders = [:],
                       loader : Bool = true,
                       response : @escaping APIResponse) {
                debugPrint("============ \n Parameters are =======> \n\n \(parameters) \n =================")
        guard let urlString = (endPoint + "?" + encodeParamaters(params: parameters)).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {
            return
        }
        let uri = URL(string: urlString)
        REQUEST(withUrl: uri,
                method: "DELETE",
                postData : nil,
                header: headers,
                loader: loader,
                response: response)
    }

    // MARK: - Function to delete with raw json
    static func deleteWithRawJson(endPoint : String,
                                  parameters : [String : Any] = [:],
                                  headers : HTTPHeaders = [:],
                                  loader : Bool = true,
                                  response : @escaping APIResponse) {
        debugPrint("============ \n Parameters are =======> \n\n \(parameters) \n =================")
        let uri = URL(string: endPoint)
        let postData = encodeParamaters(params: parameters).data(using: String.Encoding.utf8)
        var header = headers
        header["content-type"] = "application/x-www-form-urlencoded"
        REQUEST(withUrl: uri,
                method: "DELETE",
                postData : postData,
                header: header,
                loader: loader,
                response: response)
    }

    // MARK: - Function to encode parameterds
    static private func encodeParamaters(params : [String : Any]) -> String {
        var result = ""
        for key in params.keys {
            result.append(key+"=\(params[key] ?? "")&")
        }
        if !result.isEmpty {
            result.remove(at: result.index(before: result.endIndex))
        }
        return result
    }
    static func generateBoundary() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }

    // MARK: - Function to create data body
    static func createDataBody(withParameters params: [String:Any]?, media: [String:UIImage]?, boundary: String) -> Data {
        let lineBreak = "\r\n"
        var body = Data()
        if let parameters = params {
            for (key, value) in parameters {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
                body.append("\(value)\(lineBreak)")
            }
        }
        if let media = media {
            for photo in media.keys {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(photo)\"; filename=\" image.jpg\"\(lineBreak)")
                body.append("Content-Type: image/jpeg\(lineBreak + lineBreak)")
                let data = media[photo]!.jpegData(compressionQuality: 0.7)
                body.append(data!)
                body.append(lineBreak)
            }
        }
        body.append("--\(boundary)--\(lineBreak)")
        return body
    }
}

// MARK: - Data
extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}

// MARK: - Basic Auth
extension AppNetworking {
    static var basicAuth : String {
        let username = "node"
        let password = "rcc"
        let authString = String(format: "%@:%@", username, password)
        let authData = authString.data(using: String.Encoding.utf8)!
        return "Basic " + authData.base64EncodedString()
    }
}
