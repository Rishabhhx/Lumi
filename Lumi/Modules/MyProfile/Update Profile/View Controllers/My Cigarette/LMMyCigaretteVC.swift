//
//  LMMyCigaretteVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 28/06/22.
//

import UIKit

class LMMyCigaretteVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var yesButton: UIButton!
    @IBOutlet weak private(set) var sometimesButton: UIButton!
    @IBOutlet weak private(set) var noButton: UIButton!
    @IBOutlet weak private(set) var preferNotToSay: UIButton!
    @IBOutlet weak private(set) var saveButton: UIButton!

    // MARK: - Properties
    private(set) var userCigarettes : String?
    var updateProfileViewModelObj : LMUpdateProfileVM!

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    @IBAction private func saveButton(_ sender: Any) {
        if userCigarettes == nil {
            MotionToast(message: StringConstant.Profile.selectOne, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            updateMyProfileObj?.haveCigarette = userCigarettes ?? StringConstant.WelcomeScreen.emptyString
            updateProfileViewModelObj.profileCall()
        }
    }

    // MARK: - Setting up user preference as per the requirment
    @IBAction private func yesButton(_ sender: UIButton) {
        switch sender {

        case yesButton :
            userCigarettes = CommonFunction.commonFunctions.buttonSelectedColorSet(yesButton ,userSelection: StringConstant.Profile.yes)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(sometimesButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(noButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(preferNotToSay)

        case sometimesButton :
            userCigarettes = CommonFunction.commonFunctions.buttonSelectedColorSet(sometimesButton ,userSelection: StringConstant.Profile.sometimes)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(yesButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(noButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(preferNotToSay)

        case noButton :
            userCigarettes = CommonFunction.commonFunctions.buttonSelectedColorSet(noButton ,userSelection: StringConstant.Profile.no)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(yesButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(sometimesButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(preferNotToSay)

        case preferNotToSay :
            userCigarettes = CommonFunction.commonFunctions.buttonSelectedColorSet(preferNotToSay ,userSelection: StringConstant.Profile.preferNotToSay)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(yesButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(sometimesButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(noButton)

        default : break
        }
    }
}

// MARK: - Life Cycle Methods
extension LMMyCigaretteVC {

    override func initialSetup() {
        updateProfileViewModelObj = LMUpdateProfileVM()
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: saveButton , color: ColorAssest.redButton.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: yesButton, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: noButton, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: preferNotToSay, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: sometimesButton, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
    }
}
