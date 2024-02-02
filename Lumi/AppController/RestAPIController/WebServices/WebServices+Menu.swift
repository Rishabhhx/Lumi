//
//  WebServices+Menu.swift
//  Lumi
//
//  Created by Rishabh Sharma on 07/06/22.
//

import UIKit
extension WebServices {
    // MARK: - Get All Profile
    static func allLumidates(parameters: JSONDictionary,response: @escaping ((Result<([Lumidates]),Error>) -> Void)) {
        commonGetAPI(parameters: parameters, endPoint: .lumidatesGet, loader: false) { (result) in
            switch result {
            case .success(let json):
                let data = try? json["data"].rawData()
                guard let lumidatesCollection = try? JSONDecoder().decode([Lumidates].self, from: data ?? Data()) else { return }
                response(.success(lumidatesCollection))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }

    // MARK: - Get Booking Events
        static func allBookingEvents(parameters: JSONDictionary,response: @escaping ((Result<([Booking]),Error>) -> Void)) {
            commonGetAPI(parameters: parameters, endPoint: .bookingEventsGet, loader: false) { (result) in
                switch result {
                case .success(let json):
                    let data = try? json["data"].rawData()
                    guard let bookingEventsCollection = try? JSONDecoder().decode([Booking].self, from: data ?? Data()) else { return }
                    response(.success(bookingEventsCollection))
                case .failure(let error):
                    response(.failure(error))
                }
            }
        }
    // MARK: - Get All Sent Invite
        static func allSentInvites(parameters: JSONDictionary,response: @escaping ((Result<([Lumidates]),Error>) -> Void)) {
            commonGetAPI(parameters: parameters, endPoint: .sentInvites, loader: true) { (result) in
                switch result {
                case .success(let json):
                    let data = try? json["data"].rawData()
                    guard let sent = try? JSONDecoder().decode([Lumidates].self, from: data ?? Data()) else { return }
                    response(.success(sent))
                case .failure(let error):
                    response(.failure(error))
                }
            }
        }
    // MARK: - Get All Recived Invite
        static func allRecivedInvites(parameters: JSONDictionary,response: @escaping ((Result<([Lumidates]),Error>) -> Void)) {
            commonGetAPI(parameters: parameters, endPoint: .recivedInvites, loader: true) { (result) in
                switch result {
                case .success(let json):
                    let data = try? json["data"].rawData()
                    guard let sent = try? JSONDecoder().decode([Lumidates].self, from: data ?? Data()) else { return }
                    response(.success(sent))
                case .failure(let error):
                    response(.failure(error))
                }
            }
        }
    // MARK: - AcceptInvite API
    static func acceptInviteApi(toAppend: String, parameters: JSONDictionary,response: @escaping ((Result<(JSON),Error>) -> Void)) {
        commonPostWithRawJSONAPI(parameters: parameters, endPoint: .acceptInvite, toAppend: toAppend, loader: true) { (result) in
            switch result {
            case .success(let json):
                response(.success(json))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }
    // MARK: - DeclineInvite API
    static func declineInviteApi(toAppend: String, parameters: JSONDictionary,response: @escaping ((Result<(JSON),Error>) -> Void)) {
        commonPostWithRawJSONAPI(parameters: parameters, endPoint: .declineInvite, toAppend: toAppend, loader: true) { (result) in
            switch result {
            case .success(let json):
                response(.success(json))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }
    // MARK: - Get My Profile
        static func myProfile(parameters: JSONDictionary,response: @escaping ((Result<(LMMyProfileModel),Error>) -> Void)) {
            commonGetAPI(parameters: parameters, endPoint: .getMyProfile, loader: false) { (result) in
                switch result {
                case .success(let json):
                    let data = try? json["data"].rawData()
                    guard let myProfile = try? JSONDecoder().decode(LMMyProfileModel.self, from: data ?? Data()) else { return }
                    response(.success(myProfile))
                case .failure(let error):
                    response(.failure(error))
                }
            }
        }

    // MARK: - Logout API
    static func logoutAPICall(parameters: JSONDictionary,response: @escaping ((Result<(JSON),Error>) -> Void)) {
        commonPostWithRawJSONAPI(parameters: parameters, endPoint: .logoutPost, loader: true) { (result) in
            switch result {
            case .success(let json):
                response(.success(json))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }

    // MARK: - Verify Mail
    static func verifyMailCall(parameters: JSONDictionary,response: @escaping ((Result<(JSON),Error>) -> Void)) {
        commonPostWithRawJSONAPI(parameters: parameters, endPoint: .verifyEmail, loader: true) { (result) in
            switch result {
            case .success(let json):
                response(.success(json))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }
}
