//
//  LMMyGenderVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 27/06/22.
//

import UIKit

class LMMyGenderVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var male: UIButton!
    @IBOutlet weak private(set) var female: UIButton!
    @IBOutlet weak private(set) var nonBinary: UIButton!
    @IBOutlet weak private(set) var saveButton: UIButton!

    // MARK: - Properties
    private(set) var userGender : String?
    var updateProfileViewModelObj : LMUpdateProfileVM!

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    // MARK: - Moving to next controller
    @IBAction private func saveButton(_ sender: Any) {
        if userGender == nil {
            MotionToast(message: StringConstant.Profile.selectOne, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            updateMyProfileObj?.gender = userGender ?? StringConstant.WelcomeScreen.emptyString
            updateProfileViewModelObj.profileCall()
        }
    }

    // MARK: - Setting up user preference as per the requirment
    @IBAction private func male(_ sender: UIButton) {
        switch sender {
        case male :
            userGender = CommonFunction.commonFunctions.buttonSelectedColorSet(male ,userSelection: StringConstant.Profile.male)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(female)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(nonBinary)

        case female :
            userGender = CommonFunction.commonFunctions.buttonSelectedColorSet(female ,userSelection: StringConstant.Profile.female)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(male)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(nonBinary)

        case nonBinary :
            userGender = CommonFunction.commonFunctions.buttonSelectedColorSet(nonBinary ,userSelection: StringConstant.Profile.nonBinary)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(male)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(female)
        default : break
        }
    }
}

// MARK: - Life Cycle Functions
extension LMMyGenderVC {

    override func initialSetup() {
        updateProfileViewModelObj = LMUpdateProfileVM()
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: saveButton , color: ColorAssest.redButton.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: male, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: female, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: nonBinary, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
    }
}
