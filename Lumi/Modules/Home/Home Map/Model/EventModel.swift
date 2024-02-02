//
//  EventModel.swift
//  Lumi
//
//  Created by Rishabh Sharma on 06/05/22.
//

import Foundation
import UIKit

struct Events {
    var eventImage : UIImage
    var totalTickets : Int
    var eventPrice : String
    var fromAge : String
    var freeDrinks : Int
    var attendeesNo : Int
    var eventDay : String
    var eventDate : Int
    var eventMonth : String
    var eventAddress : String
    var eventName : String
    var lat : Double
    var long : Double
}

struct EventsBook {
    static var shared = EventsBook()
    var myEventsTotal : Int?
}

var eventObj : [Events] = [Events(eventImage: UIImage(named: "eventParty1")!, totalTickets: 11, eventPrice: "$25+", fromAge: "18-30", freeDrinks: 4, attendeesNo: 55, eventDay: "MON", eventDate: 9, eventMonth: "MAY", eventAddress: "New York 51 street", eventName: "Go gone party", lat: 28.5122, long: 77.1190), Events(eventImage: UIImage(named: "eventParty2")!, totalTickets: 6, eventPrice: "$25+", fromAge:  "24-31", freeDrinks: 4, attendeesNo: 67, eventDay: "SUN", eventDate: 8, eventMonth: "MAY", eventAddress: "62 Streets Brooklen", eventName: "Fun Housers", lat: 28.6219, long: 77.0278), Events(eventImage: UIImage(named: "eventParty3")!, totalTickets: 32, eventPrice: "$45+", fromAge:  "23-43", freeDrinks: 2, attendeesNo: 12, eventDay: "SAT", eventDate: 14, eventMonth: "APR", eventAddress: "A Block 21 Central", eventName: "Cochela Party", lat: 28.5319, long: 77.0878), Events(eventImage: UIImage(named: "eventParty4")!, totalTickets: 21, eventPrice: "$32+", fromAge:  "21-32", freeDrinks: 1, attendeesNo: 21, eventDay: "WED", eventDate: 21, eventMonth: "JUL", eventAddress: "51 Block", eventName: "HallowKenn", lat: 28.5211, long: 77.2777), Events(eventImage: UIImage(named: "eventParty5")!, totalTickets: 22, eventPrice: "$44+", fromAge:  "19-28", freeDrinks: 3, attendeesNo: 32, eventDay: "SAT", eventDate: 29, eventMonth: "JUN", eventAddress: "Berlin Clun 52 Block A", eventName: "Biber Concert", lat: 28.5222, long: 77.2000)]

struct AllEvents : Codable {
    var id : String?
    var eventName : String?
    var eventLocation : String?
    var eventDate : String?
    var eventDescription : String?
    var totalTickets : Int?
    var availableTickets : Int?
    var bookedTickets : Int?
    var ageBetween = [Int]()
    var freeDrinks : Int?
    var price : Int?
    var eventImages = [String]()
}
var alleventsObj : [LMEventModel] = []
var selectedEventsObj : LMEventModel?

struct LMEventModel : Codable {

    var location : LocationModel
    var id : String
    var eventName : String
    var eventLocation : String
    var ageBetween : [Int]
    var eventDate : String
    var eventDescription : String
    var totalTickets : Int
    var availableTickets : Int
    var bookedTickets : Int
    var freeDrinks : Int
    var price : Int
    var eventImages = [String]()

    // MARK: - Coding Keys for event details
    enum CodingKeys : String, CodingKey {
        case id = "_id"
        case eventName
        case ageBetween
        case eventLocation
        case location
        case eventDate
        case eventDescription
        case totalTickets
        case availableTickets
        case bookedTickets
        case freeDrinks
        case price
        case eventImages
    }

    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        id = try value.decodeIfPresent(String.self, forKey: .id) ?? StringConstant.WelcomeScreen.emptyString
        eventName = try value.decodeIfPresent(String.self, forKey: .eventName) ?? StringConstant.WelcomeScreen.emptyString
        eventLocation = try value.decodeIfPresent(String.self, forKey: .eventLocation) ?? StringConstant.WelcomeScreen.emptyString
        ageBetween = try value.decodeIfPresent([Int].self, forKey: .ageBetween) ?? []
        location = try value.decodeIfPresent(LocationModel.self, forKey: .location) ?? LocationModel()
        eventDate =  try value.decodeIfPresent(String.self, forKey: .eventDate) ?? StringConstant.WelcomeScreen.emptyString
        eventDescription =  try value.decodeIfPresent(String.self, forKey: .eventDescription) ?? StringConstant.WelcomeScreen.emptyString
        totalTickets =  try value.decodeIfPresent(Int.self, forKey: .totalTickets) ?? 0
        availableTickets =  try value.decodeIfPresent(Int.self, forKey: .availableTickets) ?? 0
        bookedTickets =  try value.decodeIfPresent(Int.self, forKey: .bookedTickets) ?? 0
        freeDrinks =  try value.decodeIfPresent(Int.self, forKey: .freeDrinks) ?? 0
        price =  try value.decodeIfPresent(Int.self, forKey: .price) ?? 0
        eventImages =  try value.decodeIfPresent([String].self, forKey: .eventImages) ?? []
    }
}

struct LocationModel:Codable {

    var type : String
    var coordinates : [Double]

    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        type = try value.decodeIfPresent(String.self, forKey: .type) ?? ""
        coordinates = try value.decodeIfPresent([Double].self, forKey: .coordinates) ?? []
    }

    init() {
        type = ""
        coordinates = []
    }
}
