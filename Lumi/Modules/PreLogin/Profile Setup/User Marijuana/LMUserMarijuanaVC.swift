//
//  LMUserMarijuanaVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 22/04/22.
//

import UIKit
import MotionToastView

class LMUserMarijuanaVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var yesButton: UIButton!
    @IBOutlet weak private(set) var sometimesButton: UIButton!
    @IBOutlet weak private(set) var noButton: UIButton!
    @IBOutlet weak private(set) var preferNotToSay: UIButton!

    // MARK: - Properties
    var userMarijuana : String?

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    // MARK: - Moving to next view controller
    @IBAction private func nextButton(_ sender: Any) {
        if userMarijuana == nil {
            MotionToast(message: StringConstant.Profile.selectOne, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            userProfileObj.userMarijuana = userMarijuana
            nextPage?()
        }
    }

    // MARK: - Setting up user preference as per the requirment
    @IBAction private func yesButton(_ sender: UIButton) {
        switch sender {
        case yesButton :
            userMarijuana = CommonFunction.commonFunctions.buttonSelectedColorSet(yesButton ,userSelection: StringConstant.Profile.yes)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(sometimesButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(noButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)

        case sometimesButton :
            userMarijuana = CommonFunction.commonFunctions.buttonSelectedColorSet(sometimesButton ,userSelection: StringConstant.Profile.sometimes)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(yesButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(noButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)

        case noButton :
            userMarijuana = CommonFunction.commonFunctions.buttonSelectedColorSet(noButton ,userSelection: StringConstant.Profile.no)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(yesButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(sometimesButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)

        case preferNotToSay :
            userMarijuana = CommonFunction.commonFunctions.buttonSelectedColorSet(preferNotToSay ,userSelection: StringConstant.Profile.preferNotToSay)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(yesButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(sometimesButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(noButton)

        default : break
        }
    }
}

// MARK: - Life Cycle Functions
extension LMUserMarijuanaVC {

    override func initialSetup() {
        CommonFunction.commonFunctions.intrestButton(buttonName: yesButton)
        CommonFunction.commonFunctions.intrestButton(buttonName: sometimesButton)
        CommonFunction.commonFunctions.intrestButton(buttonName: noButton)
        CommonFunction.commonFunctions.intrestButton(buttonName: preferNotToSay)
    }
}
