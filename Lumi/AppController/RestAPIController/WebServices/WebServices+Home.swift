//
//  WebServices + Home.swift
//  Lumi
//
//  Created by Rishabh Sharma on 10/05/22.
//

import Foundation
import UIKit

extension WebServices {

    // MARK: - Get All Events
        static func allEvents(parameters: JSONDictionary,response: @escaping ((Result<([LMEventModel]),Error>) -> Void)) {
            commonGetAPI(parameters: parameters, endPoint: .allEventsGet, loader: false) { (result) in
                switch result {
                case .success(let json):
                    let data = try? json["data"].rawData()
                    guard let eventsCollection = try? JSONDecoder().decode([LMEventModel].self, from: data ?? Data()) else { return }
                    response(.success(eventsCollection))
                case .failure(let error):
                    response(.failure(error))
                }
            }
        }

    // MARK: - Payment API
    static func paymentApi(parameters: JSONDictionary,response: @escaping ((Result<(LMPaymentSucessModel),Error>) -> Void)) {
        commonPostWithRawJSONAPI(parameters: parameters, endPoint: .paymentPost, loader: true) { (result) in
            switch result {
            case .success(let json):
                let data = try? json["data"].rawData()
                guard let lumiUserDetailsCollection = try? JSONDecoder().decode(LMPaymentSucessModel.self, from: data ?? Data()) else { return }
                response(.success(lumiUserDetailsCollection))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }

    // MARK: - BookEvent API
    static func bookEventApi(toAppend: String, parameters: JSONDictionary,response: @escaping ((Result<(JSON),Error>) -> Void)) {
        commonPostWithRawJSONAPI(parameters: parameters, endPoint: .bookeEventPost, toAppend: toAppend, loader: true) { (result) in
            switch result {
            case .success(let json):
                response(.success(json))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }

    // MARK: - Invite Event API
    static func inviteEventApi(toAppend: String, toAppend2 : String, parameters: JSONDictionary,response: @escaping ((Result<(JSON),Error>) -> Void)) {
        commonPostWithRawJSONAPI(parameters: parameters, endPoint: .inviteEventsPost, toAppend: "\(toAppend)/invite/\(toAppend2)", loader: true) { (result) in
            switch result {
            case .success(let json):
                response(.success(json))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }
    // MARK: - Get All Subscription
        static func allSubscriptionApi(parameters: JSONDictionary,response: @escaping ((Result<([LMSubscriptionModel]),Error>) -> Void)) {
            commonGetAPI(parameters: parameters, endPoint: .subscriptionGet, loader: true) { (result) in
                switch result {
                case .success(let json):
                    let data = try? json["data"].rawData()
                    guard let subscriptionCollection = try? JSONDecoder().decode([LMSubscriptionModel].self, from: data ?? Data()) else { return }
                    response(.success(subscriptionCollection))
                case .failure(let error):
                    response(.failure(error))
                }
            }
        }

    // MARK: - Post Buy Subscription
    static func buySubscriptionApi(toAppend: String, parameters: JSONDictionary,response: @escaping ((Result<(JSON),Error>) -> Void)) {
        commonPostWithRawJSONAPI(parameters: parameters, endPoint: .buySubscriptionPost, toAppend: toAppend, loader: true) { (result) in
            switch result {
            case .success(let json):
                response(.success(json))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }

    // MARK: - Get My Events
        static func myEvents(parameters: JSONDictionary,response: @escaping ((Result<([LMMyEventModel]),Error>) -> Void)) {
            commonGetAPI(parameters: parameters, endPoint: .myEventsGet) { (result) in
                switch result {
                case .success(let json):
                    let data = try? json["data"].rawData()
                    guard let myEventsCollection = try? JSONDecoder().decode([LMMyEventModel].self, from: data ?? Data()) else { return }
                    response(.success(myEventsCollection))
                case .failure(let error):
                    response(.failure(error))
                }
            }
        }
    // MARK: - Get Event
    static func selectedEventDetail(toAppend: String, parameters: JSONDictionary,response: @escaping ((Result<(LMEventModel),Error>) -> Void)) {
        commonGetAPI(parameters: parameters, endPoint: .selectedEventGet, toAppend: toAppend, loader: false) { (result) in
            switch result {
            case .success(let json):
                let data = try? json["data"].rawData()
                guard let selectedEventCollection = try? JSONDecoder().decode(LMEventModel.self, from: data ?? Data()) else { return }
                response(.success(selectedEventCollection))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }
}
