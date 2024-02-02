//
//  LMMyReligiousBeliefVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 28/06/22.
//

import UIKit

class LMMyReligiousBeliefVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var buddhism : UIButton!
    @IBOutlet weak private(set) var christianity: UIButton!
    @IBOutlet weak private(set) var judaism: UIButton!
    @IBOutlet weak private(set) var islam: UIButton!
    @IBOutlet weak private(set) var hinduism: UIButton!
    @IBOutlet weak private(set) var other: UIButton!
    @IBOutlet weak private(set) var none: UIButton!
    @IBOutlet weak private(set) var preferNotToSay: UIButton!
    @IBOutlet weak private(set) var saveButton: UIButton!

    // MARK: - Properties
    private(set) var userReligion : String?
    var updateProfileViewModelObj : LMUpdateProfileVM!

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    @IBAction private func saveButton(_ sender: Any) {
        if userReligion == nil {
            MotionToast(message: StringConstant.Profile.selectOne, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            updateMyProfileObj?.religiousBelief = userReligion ?? StringConstant.WelcomeScreen.emptyString
            updateProfileViewModelObj.profileCall()
        }
    }

    // MARK: - Setting up user preference as per the requirment
    @IBAction private func buddhism(_ sender: UIButton) {
        switch sender {

        case buddhism :
            userReligion = CommonFunction.commonFunctions.buttonSelectedColorSet(buddhism ,userSelection: StringConstant.Profile.buddhism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(christianity)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(judaism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(islam)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(hinduism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(none)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(preferNotToSay)

        case christianity :
            userReligion = CommonFunction.commonFunctions.buttonSelectedColorSet(christianity ,userSelection: StringConstant.Profile.christianity)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(buddhism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(judaism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(islam)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(hinduism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(none)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(preferNotToSay)

        case judaism :
            userReligion = CommonFunction.commonFunctions.buttonSelectedColorSet(judaism ,userSelection: StringConstant.Profile.judaism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(buddhism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(christianity)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(none)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(islam)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(hinduism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(preferNotToSay)

        case islam :
            userReligion = CommonFunction.commonFunctions.buttonSelectedColorSet(islam ,userSelection: StringConstant.Profile.islam)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(buddhism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(christianity)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(none)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(judaism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(hinduism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(preferNotToSay)

        case hinduism :
            userReligion = CommonFunction.commonFunctions.buttonSelectedColorSet(buddhism ,userSelection: StringConstant.Profile.hinduism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(buddhism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(christianity)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(none)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(judaism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(islam)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(preferNotToSay)

        case none :
            userReligion = CommonFunction.commonFunctions.buttonSelectedColorSet(christianity ,userSelection: StringConstant.Profile.none)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(buddhism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(christianity)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(hinduism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(judaism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(islam)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(preferNotToSay)

        case other :
            userReligion = CommonFunction.commonFunctions.buttonSelectedColorSet(judaism ,userSelection: StringConstant.Profile.other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(buddhism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(christianity)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(hinduism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(judaism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(islam)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(none)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(preferNotToSay)

        case preferNotToSay :
            userReligion = CommonFunction.commonFunctions.buttonSelectedColorSet(islam ,userSelection: StringConstant.Profile.preferNotToSay)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(buddhism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(christianity)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(hinduism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(judaism)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(islam)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(none)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(other)

        default : break
        }
    }
}

// MARK: - Life Cycle Methods
extension LMMyReligiousBeliefVC {

    override func initialSetup() {
        updateProfileViewModelObj = LMUpdateProfileVM()
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: saveButton , color: ColorAssest.redButton.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: buddhism, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: christianity, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: hinduism, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: judaism, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: islam, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: none, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: other, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: preferNotToSay, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
    }
}
