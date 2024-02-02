//
//  bookingsModel.swift
//  Lumi
//
//  Created by Rishabh Sharma on 09/06/22.
//

import UIKit

// MARK: - Booking
var allBookingEventsObj : [Booking] = []
struct Booking: Codable {
    let id, eventBookingCode: String
    let eventID: BookingEventID
    let userID: String
    let paymentID: PaymentID

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case eventBookingCode
        case eventID = "eventId"
        case userID = "userId"
        case paymentID = "paymentId"
    }
}

// MARK: - EventID
struct BookingEventID: Codable {
    let location: MapLocation
    let id, eventName, eventLocation, eventDate: String
    let eventImages : [String]
    let price: Int

    enum CodingKeys: String, CodingKey {
        case location
        case id = "_id"
        case eventName, eventLocation, eventDate, price, eventImages
    }
}

// MARK: - Location
struct MapLocation: Codable {
    let type: String
    let coordinates: [Double]
}

// MARK: - PaymentID
struct PaymentID: Codable {
    let id: String
    let payTax, grandTotal: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case payTax, grandTotal
    }
}
