//
//  CellImageTextStruct.swift
//  Lumi
//
//  Created by Rishabh Sharma on 23/06/22.
//

import UIKit
struct CellImageText {
    var image : UIImage?
    var text : String?
}
var myProfileObj : LMMyProfileModel?
var updateMyProfileObj : LMMyProfileModel?

// MARK: - My Profile
struct LMMyProfileModel: Codable {
    var location: Location
    var id, phoneNumber: String
    var profilePicture: [String]
    var isPhoneVerified, isMailVerified: Bool
    var bio: [String]
    var ageBetween, height: [Int]
    var dob, eduLevel, gender, haveAlcohol: String
    var haveCigarette, haveDrugs, haveMarijuana, homeTown: String
    var interestedIn, jobTitle, name, politicalLeaning: String
    var religiousBelief: String

    enum CodingKeys: String, CodingKey {
        case location
        case id = "_id"
        case phoneNumber, profilePicture, isPhoneVerified, isMailVerified, bio, ageBetween, height, dob, eduLevel, gender, haveAlcohol, haveCigarette, haveDrugs, haveMarijuana, homeTown, interestedIn, jobTitle, name, politicalLeaning, religiousBelief
    }
}

var updateMyProfileParam: JSONDictionary {

    let param = ["name": updateMyProfileObj?.name as Any,
                 "profilePicture": updateMyProfileObj?.profilePicture as Any,
                 "gender": updateMyProfileObj?.gender as Any,
                 "bio" : updateMyProfileObj?.bio as Any,
                 "dob" : updateMyProfileObj?.dob as Any,
                 "homeTown" : updateMyProfileObj?.homeTown as Any,
                 "jobTitle" : updateMyProfileObj?.jobTitle as Any,
                 "eduLevel" : updateMyProfileObj?.eduLevel as Any,
                 "religiousBelief" : updateMyProfileObj?.religiousBelief as Any,
                 "haveCigarette" : updateMyProfileObj?.haveCigarette as Any,
                 "haveAlcohol" : updateMyProfileObj?.haveAlcohol as Any,
                 "coordinates" : updateMyProfileObj?.location.coordinates as Any,
                 "haveMarijuana" : updateMyProfileObj?.haveMarijuana as Any,
                 "haveDrugs" : updateMyProfileObj?.haveDrugs as Any,
                 "politicalLeaning" : updateMyProfileObj?.politicalLeaning as Any,
                 "ageBetween" : updateMyProfileObj?.ageBetween as Any,
                 "height" : updateMyProfileObj?.height as Any,
                 "interestedIn" : updateMyProfileObj?.interestedIn as Any]
        return param
    }
