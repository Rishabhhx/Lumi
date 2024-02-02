//
//  LumidatesModel.swift
//  Lumi
//
//  Created by Rishabh Sharma on 07/06/22.
//

import UIKit

var allLumidatesObj : [Lumidates] = []
var allSentRecivedInvites : [Lumidates] = []
var allSentInvites : [Lumidates] = []
var allRecivedInvites : [Lumidates] = []

// MARK: - Lumidates
struct Lumidates: Codable {
    let id: String
    let invitedBy, invitedTo: Invited
    let eventID: EventID
    let inviteStatus, inviteType: String
    let isOfferingTicket, isBookingDoneForReceiver: Bool

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case invitedBy, invitedTo
        case eventID = "eventId"
        case inviteStatus, inviteType, isOfferingTicket, isBookingDoneForReceiver
    }
}

// MARK: - EventID
struct EventID: Codable {
    let location: Location
    let id, eventName, eventLocation, eventDate: String
    let eventImages: [String]

    enum CodingKeys: String, CodingKey {
        case location
        case id = "_id"
        case eventName, eventLocation, eventDate, eventImages
    }
}

// MARK: - Location
struct Location: Codable {
    let type: String
    let coordinates: [Double]
}

// MARK: - Invited
struct Invited: Codable {
    let location: Location
    let id: String
    let profilePicture: [String]
    let dob, homeTown, name: String

    enum CodingKeys: String, CodingKey {
        case location
        case id = "_id"
        case profilePicture, dob, homeTown, name
    }
}
