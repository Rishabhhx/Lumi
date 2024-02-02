//
//  WebServices+Matches.swift
//  Lumi
//
//  Created by Rishabh Sharma on 01/06/22.
//

import UIKit
extension WebServices {

    // MARK: - Get All Profile
    static func allLumiUser(parameters: JSONDictionary,response: @escaping ((Result<([LMLumiUser]),Error>) -> Void)) {
        commonGetAPI(parameters: parameters, endPoint: .allLumiUserGet, loader: false) { (result) in
            switch result {
            case .success(let json):
                let data = try? json["data"].rawData()
                guard let lumiUserCollection = try? JSONDecoder().decode([LMLumiUser].self, from: data ?? Data()) else { return }
                response(.success(lumiUserCollection))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }

    // MARK: - Get All Profile
    static func allLumiUserDetails(toAppend: String, parameters: JSONDictionary,response: @escaping ((Result<(LMLumiUserDetails),Error>) -> Void)) {
        commonGetAPI(parameters: parameters, endPoint: .allLumiUserDetailsGet, toAppend: toAppend, loader: false) { (result) in
            switch result {
            case .success(let json):
                let data = try? json["data"].rawData()
                guard let lumiUserDetailsCollection = try? JSONDecoder().decode(LMLumiUserDetails.self, from: data ?? Data()) else { return }
                response(.success(lumiUserDetailsCollection))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }

    // MARK: - ReportUser API
    static func reportUser(toAppend: String, parameters: JSONDictionary,response: @escaping ((Result<(JSON),Error>) -> Void)) {
        commonPostWithRawJSONAPI(parameters: parameters, endPoint: .reportUser, toAppend: toAppend, loader: true) { (result) in
            switch result {
            case .success(let json):
                response(.success(json))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }
    // MARK: - ReportUser API
    static func blockUser(toAppend: String, parameters: JSONDictionary,response: @escaping ((Result<(JSON),Error>) -> Void)) {
        commonGetAPI(parameters: parameters, endPoint: .blockUser, toAppend: toAppend, loader: true) { (result) in
            switch result {
            case .success(let json):
                response(.success(json))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }
}
