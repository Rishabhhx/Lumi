//
//  Enums.swift
//  Lumi
//
//  Created by Rishabh Sharma on 15/04/22.
//

import Foundation
import UIKit

// MARK: - Enum used for different pages
enum Pages: CaseIterable {
    case pageZero
    case pageOne
    case pageTwo
    case pageThree
    case pageFour
    var name: String {
        switch self {
        case .pageZero:
            return StringConstant.WelcomeScreen.quote1
        case .pageOne:
            return StringConstant.WelcomeScreen.quote2
        case .pageTwo:
            return StringConstant.WelcomeScreen.quote3
        case .pageThree:
            return StringConstant.WelcomeScreen.quote4
        case .pageFour:
            return StringConstant.WelcomeScreen.quote5
        }
    }
    var index: Int {
        switch self {
        case .pageZero:
            return 0
        case .pageOne:
            return 1
        case .pageTwo:
            return 2
        case .pageThree:
            return 3
        case .pageFour:
            return 4
        }
    }
}
// MARK: - Enum used for different subsciption pages
enum SubsctiptionPages: CaseIterable {
    case pageZero
    case pageOne
    case pageTwo
    case pageThree
    case pageFour
    var name: String {
        switch self {
        case .pageZero:
            return "subscribers send as many likes + invites as they want "
        case .pageOne:
            return "You can rewind your last swipe, in case you have swiped left or right mistakingly."
        case .pageTwo:
            return "It provides you the passport to swipe around the world."
        case .pageThree:
            return "You can make 5 Super Likes a day."
        case .pageFour:
            return "You can boost Lumi once a month."
        }
    }
    var index: Int {
        switch self {
        case .pageZero:
            return 0
        case .pageOne:
            return 1
        case .pageTwo:
            return 2
        case .pageThree:
            return 3
        case .pageFour:
            return 4
        }
    }
}
enum Pages1: CaseIterable {
    case pageZero
    case pageOne
    case pageTwo
    var imageName: String {
        switch self {
        case .pageZero:
            return "eventParty1"
        case .pageOne:
            return "eventParty2"
        case .pageTwo:
            return "eventParty3"
        }
    }
    var index: Int {
        switch self {
        case .pageZero:
            return 0
        case .pageOne:
            return 1
        case .pageTwo:
            return 2
        }
    }
}
enum ProfilePages: CaseIterable {
    case pageZero
    case pageOne
    case pageTwo
    case pageThree
    case pageFour
    var imageName: String {
        switch self {
        case .pageZero:
            return "profilePic1"
        case .pageOne:
            return "profilePic2"
        case .pageTwo:
            return "profilePic3"
        case .pageThree:
            return "profilePic4"
        case .pageFour:
            return "profilePic1"
        }
    }
    var index: Int {
        switch self {
        case .pageZero:
            return 0
        case .pageOne:
            return 1
        case .pageTwo:
            return 2
        case .pageThree:
            return 3
        case .pageFour:
            return 4
        }
    }
}

// MARK: - For manageing errors
enum ManagerErrors: Error {
    case invalidResponse
    case invalidStatusCode(Int)
}

// MARK: - For manageing http modes
enum HttpMethod: String {
    case get
    case post
    var method: String { rawValue.uppercased() }
}

// MARK: - For manageing Credentials
enum CredentialsInputStatus {
    case correct
    case incorrect
}

enum VerticalLocation: String {
    case bottom
    case top
}

enum VisibleVC: String {
    case anyVC
    case menu
    case chat
    case myProfile
}

enum UserDefaultVar: String {
    case loginType
    case updateNumberStatus
    case status
    case subscription
}

enum KeychainVar: String {
    case token
}
