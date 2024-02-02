//
//  ColoeEnum.swift
//  Lumi
//
//  Created by Rishabh Sharma on 26/04/22.
//

import Foundation
import UIKit

enum ColorAssest : String , CaseIterable {
    case shadow
    case notSelected
    case selected
    case buttonText
    case redButton
    case linkExisting
    case facebook
    case otpBorder
    case answerButton
    case answerButton2
    case answerButton3
    case answerButton4
    case backView2
    case backView
    case backView3
    case backView4
    case cancelBorder
    case bookSelected
    case white
    case lightWhite
    case topBar
    case eventBar
    case viewShadow
    case greyblue
    case myEvents
    case lightDarkBlue
    case pending
    case cloudBlue
    case pendingText
    case eventbuttonback
    case clear
    var colorAssest : UIColor {
        UIColor(named: self.rawValue) ?? UIColor()
    }
}
