//
//  LMUserReligionVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 22/04/22.
//

import UIKit
import MotionToastView

class LMUserReligionVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var buddhism : UIButton!
    @IBOutlet weak private(set) var christianity: UIButton!
    @IBOutlet weak private(set) var judaism: UIButton!
    @IBOutlet weak private(set) var islam: UIButton!
    @IBOutlet weak private(set) var hinduism: UIButton!
    @IBOutlet weak private(set) var other: UIButton!
    @IBOutlet weak private(set) var none: UIButton!
    @IBOutlet weak private(set) var preferNotToSay: UIButton!

    // MARK: - Properties
    private(set) var userReligion : String?

    // MARK: IBOutlets Actions
    @IBAction private func nextButton(_ sender: Any) {
        if userReligion == nil {
            MotionToast(message: StringConstant.Profile.selectOne, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            userProfileObj.userReligion = userReligion
            nextPage?()
        }
    }

    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    // MARK: - Setting up user preference as per the requirment
    @IBAction private func buddhism(_ sender: UIButton) {
        switch sender {
        case buddhism :
            userReligion = CommonFunction.commonFunctions.buttonSelectedColorSet(buddhism ,userSelection: StringConstant.Profile.buddhism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(christianity)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(judaism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(islam)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(hinduism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(none)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)

        case christianity :
            userReligion = CommonFunction.commonFunctions.buttonSelectedColorSet(christianity ,userSelection: StringConstant.Profile.christianity)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(buddhism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(judaism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(islam)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(hinduism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(none)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)

        case judaism :
            userReligion = CommonFunction.commonFunctions.buttonSelectedColorSet(judaism ,userSelection: StringConstant.Profile.judaism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(buddhism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(christianity)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(none)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(islam)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(hinduism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)

        case islam :
            userReligion = CommonFunction.commonFunctions.buttonSelectedColorSet(islam ,userSelection: StringConstant.Profile.islam)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(buddhism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(christianity)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(none)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(judaism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(hinduism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)

        case hinduism :
            userReligion = CommonFunction.commonFunctions.buttonSelectedColorSet(hinduism ,userSelection: StringConstant.Profile.hinduism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(buddhism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(christianity)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(none)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(judaism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(islam)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)

        case none :
            userReligion = CommonFunction.commonFunctions.buttonSelectedColorSet(none ,userSelection: StringConstant.Profile.none)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(buddhism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(christianity)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(hinduism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(judaism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(islam)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)

        case other :
            userReligion = CommonFunction.commonFunctions.buttonSelectedColorSet(other ,userSelection: StringConstant.Profile.other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(buddhism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(christianity)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(hinduism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(judaism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(islam)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(none)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)

        case preferNotToSay :
            userReligion = CommonFunction.commonFunctions.buttonSelectedColorSet(preferNotToSay ,userSelection: StringConstant.Profile.preferNotToSay)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(buddhism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(christianity)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(hinduism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(judaism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(islam)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(none)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(other)
        default : break
        }
    }
}

// MARK: - Life Cycle Functions
extension LMUserReligionVC {

    override func initialSetup() {
        CommonFunction.commonFunctions.intrestButton(buttonName: buddhism)
        CommonFunction.commonFunctions.intrestButton(buttonName: christianity)
        CommonFunction.commonFunctions.intrestButton(buttonName: hinduism)
        CommonFunction.commonFunctions.intrestButton(buttonName: judaism)
        CommonFunction.commonFunctions.intrestButton(buttonName: islam)
        CommonFunction.commonFunctions.intrestButton(buttonName: none)
        CommonFunction.commonFunctions.intrestButton(buttonName: other)
        CommonFunction.commonFunctions.intrestButton(buttonName: preferNotToSay)
    }
}
