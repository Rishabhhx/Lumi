//
//  WebServices+Login.swift
//  Lumi
//
//  Created by Rishabh Sharma on 27/04/22.
//

import Foundation
import KeychainAccess

extension WebServices {

    // MARK: = Login API
    static func loginAPICall(parameters: JSONDictionary,response: @escaping ((Result<(JSON),Error>) -> Void)) {
        commonPostWithRawJSONAPI(parameters: parameters, endPoint: .phoneNumberPost, loader: true) { (result) in
            switch result {
            case .success(let json):
                response(.success(json))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }

    // MARK: - Api for update number
    static func updatePhoneCall(parameters: JSONDictionary,response: @escaping ((Result<(JSON),Error>) -> Void)) {
        commonPatchWithRawJSONAPI(parameters: parameters, endPoint: .updatePhonePatch, loader: true) { (result) in
            switch result {
            case .success(let json):
                response(.success(json))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }

    // MARK: - API for otp
    static func otpAPICall(parameters: JSONDictionary,response: @escaping ((Result<(JSON),Error>) -> Void)) {
        commonPostWithRawJSONAPI(parameters: parameters, endPoint: .otpPost, loader: true) { (result) in
            switch result {
            case .success(let json):
                let token = json["token"].stringValue
                // Storing in keychain
                // Change token1 to token to get it from login page
                let loginType = json["message"].stringValue
                UserDefaults.standard.set(loginType, forKey: UserDefaultVar.loginType.rawValue)
                keychain[KeychainVar.token.rawValue] = token
                debugPrint(keychain[KeychainVar.token.rawValue] as Any)
                // Storing in userDefault
//                UserDefaults.standard.set(token, forKey: "token")
//                print(UserDefaults.standard.object(forKey: "token") as Any)
                response(.success(json))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }

    // MARK: - Api for user profile
    static func profileCall(parameters: JSONDictionary,response: @escaping ((Result<(JSON),Error>) -> Void)) {
        commonPatchWithRawJSONAPI(parameters: parameters, endPoint: .profilePost, loader: true) { (result) in
            switch result {
            case .success(let json):
                let token = json["token"].stringValue
                // Storing in keychain
                keychain[KeychainVar.token.rawValue] = token
                response(.success(json))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }

}
