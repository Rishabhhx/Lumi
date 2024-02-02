//
//  LumiUserDetails.swift
//  Lumi
//
//  Created by Rishabh Sharma on 25/05/22.
//

import UIKit
var allLumiUserDetailsObj: LMLumiUserDetails?

struct LMLumiUserDetails : Codable {

    var id : String
    var profilePicture = [String]()
    var phoneNumber : String
    var isPhoneVerified : Bool
    var isMailVerified : Bool
    var bio : [String]
    var ageBetween = [Int]()
    var height = [Int]()
    var dob : String
    var eduLevel : String
    var email : String
    var gender : String
    var haveCigarette : String
    var haveDrugs : String
    var haveMarijuana : String
    var homeTown : String
    var jobTitle : String
    var name : String
    var politicalLeaning : String
    var religiousBelief : String
    var zodiac : String
    var location : LumiUserLocationModel

    // MARK: - Coding Keys for Profile Details
    enum ProfileDetailsCodingKeys : String, CodingKey {
        case id = "_id"
        case profilePicture
        case phoneNumber
        case isPhoneVerified
        case isMailVerified
        case bio
        case ageBetween
        case height
        case dob
        case eduLevel
        case email
        case price
        case gender
        case haveCigarette
        case haveDrugs
        case haveMarijuana
        case homeTown
        case jobTitle
        case name
        case politicalLeaning
        case religiousBelief
        case zodiac
        case location
    }

    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: ProfileDetailsCodingKeys.self)
        id = try value.decodeIfPresent(String.self, forKey: .id) ?? StringConstant.WelcomeScreen.emptyString
        profilePicture =  try value.decodeIfPresent([String].self, forKey: .profilePicture) ?? []
        phoneNumber = try value.decodeIfPresent(String.self, forKey: .phoneNumber) ?? StringConstant.WelcomeScreen.emptyString
        isPhoneVerified = try value.decodeIfPresent(Bool.self, forKey: .isPhoneVerified) ?? false
        isMailVerified = try value.decodeIfPresent(Bool.self, forKey: .isMailVerified) ?? false
        bio = try value.decodeIfPresent([String].self, forKey: .bio) ?? [StringConstant.WelcomeScreen.emptyString]
        profilePicture =  try value.decodeIfPresent([String].self, forKey: .profilePicture) ?? []
        phoneNumber = try value.decodeIfPresent(String.self, forKey: .phoneNumber) ?? StringConstant.WelcomeScreen.emptyString
        ageBetween = try value.decodeIfPresent([Int].self, forKey: .ageBetween) ?? [18,21]
        height = try value.decodeIfPresent([Int].self, forKey: .height) ?? [1,1]
        dob = try value.decodeIfPresent(String.self, forKey: .dob) ?? StringConstant.WelcomeScreen.emptyString
        eduLevel = try value.decodeIfPresent(String.self, forKey: .eduLevel) ?? StringConstant.WelcomeScreen.emptyString
        email = try value.decodeIfPresent(String.self, forKey: .email) ?? StringConstant.WelcomeScreen.emptyString
        gender = try value.decodeIfPresent(String.self, forKey: .gender) ?? StringConstant.WelcomeScreen.emptyString
        haveCigarette = try value.decodeIfPresent(String.self, forKey: .haveCigarette) ?? StringConstant.WelcomeScreen.emptyString
        haveDrugs = try value.decodeIfPresent(String.self, forKey: .haveDrugs) ?? StringConstant.WelcomeScreen.emptyString
        haveMarijuana = try value.decodeIfPresent(String.self, forKey: .haveMarijuana) ?? StringConstant.WelcomeScreen.emptyString
        homeTown = try value.decodeIfPresent(String.self, forKey: .homeTown) ?? StringConstant.WelcomeScreen.emptyString
        jobTitle = try value.decodeIfPresent(String.self, forKey: .jobTitle) ?? StringConstant.WelcomeScreen.emptyString
        name = try value.decodeIfPresent(String.self, forKey: .name) ?? StringConstant.WelcomeScreen.emptyString
        politicalLeaning = try value.decodeIfPresent(String.self, forKey: .politicalLeaning) ?? StringConstant.WelcomeScreen.emptyString
        religiousBelief = try value.decodeIfPresent(String.self, forKey: .religiousBelief) ?? StringConstant.WelcomeScreen.emptyString
        zodiac = try value.decodeIfPresent(String.self, forKey: .zodiac) ?? StringConstant.WelcomeScreen.emptyString
        religiousBelief = try value.decodeIfPresent(String.self, forKey: .religiousBelief) ?? StringConstant.WelcomeScreen.emptyString
        location = try value.decodeIfPresent(LumiUserLocationModel.self, forKey: .location) ?? LumiUserLocationModel()
    }
}

struct LumiUserLocationModel : Codable {

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
