//
//  ImageEnum.swift
//  Lumi
//
//  Created by Rishabh Sharma on 26/04/22.
//

import Foundation
import UIKit
enum ImageAssest : String , CaseIterable {
    case overviewInactive
    case setupBioInactive
    case setupHeightInactive
    case setupLocationInactive
    case setupGenderInactive
    case setupAgeInactive
    case dot
    case icProfileSetupHometownInactive
    case setupJobInactive
    case icProfileSetupEducationInactive
    case icProfileSetupReligionInactive
    case icProfileSetupPoliticalInactive
    case icProfileSetupCigaretteInactive
    case icProfileSetupAlcoholInactive
    case icProfileSetupMarijuanaInactive
    case icProfileSetupDrugsInactive
    case overviewActive
    case setupBioActive
    case setupHeightActive
    case setupLocationActive
    case setupGenderActive
    case setupAgeActive
    case icProfileSetupHometownActive
    case setupJobActive
    case icProfileSetupEducationActive
    case icProfileSetupReligionActive
    case icProfileSetupPoliticalActive
    case icProfileSetupCigaretteActive
    case icProfileSetupAlcoholActive
    case icProfileSetupMarijuanaActive
    case icProfileSetupDrugsActive
    case icPricePinActive
    case icPricePinInactive
    case icMapPin
    case videoThumb
    case icUserInfoAlcohol
    case icUserInfoCigarette
    case icUserInfoDob
    case icUserInfoDrugs
    case icUserInfoEducation
    case icUserInfoHeight
    case icUserInfoHometown
    case icUserInfoJob
    case icUserInfoMarijuana
    case icUserInfoPolitics
    case icUserInfoReligion
    case icUserLocationGrey
    case icTopNavigationMenu
    case icTopNavigationMenuActive
    case icToggleInactive
    case icTopNavigationEvent
    case icTopNavigationMates
    case addButton
    case icTopNavigationProfileActive
    case icTopNavigationChatActive
    case icEmailNotVerified
    case icEmailVerified
    case icSettingsAboutUs
    case icSettingsChangePassword
    case icSettingsChangePhone
    case icSettingsContactUs
    case icSettingsEventTickets
    case icSettingsFaq
    case icSettingsPrivacyPolicy
    case icSettingsTerms
    case icSubscriptionFeatureA
    case icTopNavigationChatInactive
    case icProfileBioAdd
    case icProfileAge
    case icProfileAlcohol
    case icProfileCigarette
    case icProfileDrugs
    case icProfileEducation
    case icProfileGender
    case icProfileHeight
    case icProfileInterestedIn
    case icProfileMarijuana
    case icProfilePolitical
    case icProfileReligious
    case icProfileWork
    case icProfileZodiac
    case icProfileImgPlaceholder

    var imageAssest : UIImage? {
        UIImage(named: self.rawValue) ?? UIImage()
    }
}
