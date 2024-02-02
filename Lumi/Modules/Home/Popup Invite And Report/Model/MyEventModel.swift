//
//  MyEventModel.swift
//  Lumi
//
//  Created by Rishabh Sharma on 03/06/22.
//

import UIKit
var myeventsObj : [LMMyEventModel] = []

struct LMMyEventModel : Codable {

    var id : String
    var eventId : String
    var eventData : [LMmyEventsData]?

    // MARK: - Coding Keys for event details
    enum MyEventsCodingKeys : String, CodingKey {
        case id = "_id"
        case eventId
        case eventData
    }

    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: MyEventsCodingKeys.self)
        id = try value.decodeIfPresent(String.self, forKey: .id) ?? StringConstant.WelcomeScreen.emptyString
        eventId = try value.decodeIfPresent(String.self, forKey: .eventId) ?? StringConstant.WelcomeScreen.emptyString
        eventData = try value.decodeIfPresent([LMmyEventsData].self, forKey: .eventData)
    }
}

struct LMmyEventsData : Codable {

    var id : String
    var eventName : String
    var eventLocation : String
    var location : MyEventsLocationModel
    var eventDate : String
    var price : Int
    var eventImages : [String]

    // MARK: - Coding Keys for event details
    enum EventsDataCodingKeys : String, CodingKey {
        case id = "_id"
        case eventName
        case eventLocation
        case location
        case eventDate
        case price
        case eventImages
    }

    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: EventsDataCodingKeys.self)
        id = try value.decodeIfPresent(String.self, forKey: .id) ?? StringConstant.WelcomeScreen.emptyString
        eventName = try value.decodeIfPresent(String.self, forKey: .eventName) ?? StringConstant.WelcomeScreen.emptyString
        eventLocation = try value.decodeIfPresent(String.self, forKey: .eventLocation) ?? StringConstant.WelcomeScreen.emptyString
        location = try value.decodeIfPresent(MyEventsLocationModel.self, forKey: .location) ?? MyEventsLocationModel()
        eventDate =  try value.decodeIfPresent(String.self, forKey: .eventDate) ?? StringConstant.WelcomeScreen.emptyString
        price =  try value.decodeIfPresent(Int.self, forKey: .price) ?? 0
        eventImages = try value.decodeIfPresent([String].self, forKey: .eventImages) ?? [StringConstant.WelcomeScreen.emptyString,StringConstant.WelcomeScreen.emptyString]
    }
}

struct MyEventsLocationModel:Codable {

    var type : String
    var coordinates : [Double]

    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        type = try value.decodeIfPresent(String.self, forKey: .type) ?? StringConstant.WelcomeScreen.emptyString
        coordinates = try value.decodeIfPresent([Double].self, forKey: .coordinates) ?? []
    }

    init() {
        type = StringConstant.WelcomeScreen.emptyString
        coordinates = []
    }
}
