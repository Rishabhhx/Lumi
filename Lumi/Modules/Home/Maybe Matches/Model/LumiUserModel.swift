//
//  Lumi.swift
//  Lumi
//
//  Created by Rishabh Sharma on 21/05/22.
//

import Foundation
import UIKit

struct LumiUser {
    var lumiUsersName : String
    var lumiUserAge : Int
    var lumiUserLocation : String
    var lumiUserProfileImage = [UIImage]()
    var lumiUserBio : [String]
    var lumiUserDob : String
    var lumiUserGender : String
    var lumiUserHeight : [Int]
    var lumiUserIntrested : String
    var lumiUserAgeIntrested : [Int]
    var lumiUserLocationCoridantes : [Double]
    var lumUserHomeTown : String
    var lumiUserJob : String
    var lumiUserEducation : String
    var lumiUserReligion : String
    var lumiUserPolitical : String
    var lumiUserCigarettes : String
    var lumiUserAlcohol : String
    var lumiUserMarijuana : String
    var lumiUserDrugs : String
}
var picArr = [ImageAssest.icUserInfoHeight.imageAssest,ImageAssest.icUserInfoDob.imageAssest,ImageAssest.icUserInfoEducation.imageAssest,ImageAssest.icUserInfoJob.imageAssest,ImageAssest.icUserInfoReligion.imageAssest,ImageAssest.icUserInfoPolitics.imageAssest,ImageAssest.icUserInfoCigarette.imageAssest,ImageAssest.icUserInfoMarijuana.imageAssest,ImageAssest.icUserInfoAlcohol.imageAssest,ImageAssest.icUserInfoDrugs
    .imageAssest,ImageAssest.icUserInfoPolitics.imageAssest,ImageAssest.icUserInfoHometown.imageAssest]

var allLumiUserObj : [LMLumiUser] = []

struct LMLumiUser : Codable {

    var id : String
    var profilePicture = [String]()
    var dob : String
    var homeTown : String
    var name : String

    // MARK: - Coding Keys for event details
    enum ProfileCodingKeys : String, CodingKey {
        case id = "_id"
        case profilePicture
        case dob
        case homeTown
        case name
    }

    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: ProfileCodingKeys.self)
        id = try value.decodeIfPresent(String.self, forKey: .id) ?? StringConstant.WelcomeScreen.emptyString
        profilePicture =  try value.decodeIfPresent([String].self, forKey: .profilePicture) ?? []
        dob = try value.decodeIfPresent(String.self, forKey: .dob) ?? StringConstant.WelcomeScreen.emptyString
        homeTown = try value.decodeIfPresent(String.self, forKey: .homeTown) ?? StringConstant.WelcomeScreen.emptyString
        name = try value.decodeIfPresent(String.self, forKey: .name) ?? StringConstant.WelcomeScreen.emptyString
    }
}
