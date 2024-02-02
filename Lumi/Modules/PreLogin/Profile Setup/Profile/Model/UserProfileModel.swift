//
//  UserProfileImage.swift
//  Lumi
//
//  Created by Rishabh Sharma on 10/04/22.
//

import Foundation
import UIKit

// MARK: - User profile details are saved here
struct UserProfile {
    var userProfileImage = [UIImage]()
    var userName : String?
    var userBio : [String] = [StringConstant.WelcomeScreen.emptyString,StringConstant.WelcomeScreen.emptyString,StringConstant.WelcomeScreen.emptyString,StringConstant.WelcomeScreen.emptyString]
    var userDob : String?
    var userGender : String?
    var userHeight = [Int]()
    var userIntrested : String?
    var userAgeIntrested = [Int]()
    var userLocationName : String?
    var userLocationCoridantes = [Double]()
    var userHomeTown : String?
    var userJob : String?
    var userEducation : String?
    var userReligion : String?
    var userPolitical : String?
    var userCigarettes : String?
    var userAlcohol : String?
    var userMarijuana : String?
    var userDrugs : String?
}
var userProfileObj = UserProfile()

var userProfileParam: JSONDictionary {
    let param = ["name": userProfileObj.userName as Any,
                 "gender": userProfileObj.userGender as Any,
                 "bio" : userProfileObj.userBio as Any,
                 "dob" : userProfileObj.userDob as Any,
                 "homeTown" : userProfileObj.userHomeTown as Any,
                 "jobTitle" : userProfileObj.userJob as Any,
                 "eduLevel" : userProfileObj.userEducation as Any,
                 "religiousBelief" : userProfileObj.userReligion as Any,
                 "haveCigarette" : userProfileObj.userCigarettes as Any,
                 "haveAlcohol" : userProfileObj.userAlcohol as Any,
                 "coordinates" : userProfileObj.userLocationCoridantes as Any,
                 "haveMarijuana" : userProfileObj.userMarijuana as Any,
                 "haveDrugs" : userProfileObj.userDrugs as Any,
                 "politicalLeaning" : userProfileObj.userPolitical as Any,
                 "ageBetween" : userProfileObj.userAgeIntrested as Any,
                 "height" : userProfileObj.userHeight as Any,
                 "interestedIn" : userProfileObj.userIntrested as Any]
        return param
    }
