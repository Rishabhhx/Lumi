//
//  LMIntrestedInVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 28/06/22.
//

import UIKit

class LMIntrestedInVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var men: UIButton!
    @IBOutlet weak private(set) var women: UIButton!
    @IBOutlet weak private(set) var menAndWomen: UIButton!
    @IBOutlet weak private(set) var genderFluid: UIButton!
    @IBOutlet weak private(set) var saveButton: UIButton!

    // MARK: - Properties
    private(set) var userIntrestedIn : String?
    var updateProfileViewModelObj : LMUpdateProfileVM!

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    @IBAction private func saveButton(_ sender: Any) {
        if userIntrestedIn == nil {
            MotionToast(message: StringConstant.Profile.selectOne, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            updateMyProfileObj?.interestedIn = userIntrestedIn ?? StringConstant.WelcomeScreen.emptyString
            updateProfileViewModelObj.profileCall()
        }
    }

    // MARK: - Setting up user preference as per the requirment
    @IBAction private func men(_ sender: UIButton) {
        switch sender {

        case men :
            userIntrestedIn = CommonFunction.commonFunctions.buttonSelectedColorSet(men ,userSelection: StringConstant.Profile.men)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(women)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(menAndWomen)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(genderFluid)

        case women :
            userIntrestedIn = CommonFunction.commonFunctions.buttonSelectedColorSet(women ,userSelection: StringConstant.Profile.women)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(men)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(menAndWomen)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(genderFluid)

        case menAndWomen :
            userIntrestedIn = CommonFunction.commonFunctions.buttonSelectedColorSet(menAndWomen ,userSelection: StringConstant.Profile.menAndWomen)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(men)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(women)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(genderFluid)

        case genderFluid :
            userIntrestedIn = CommonFunction.commonFunctions.buttonSelectedColorSet(genderFluid ,userSelection: StringConstant.Profile.genderFlucid)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(men)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(women)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(menAndWomen)
        default : break
        }
    }
}

// MARK: - Life cycle methods
extension LMIntrestedInVC {

    override func initialSetup() {
        updateProfileViewModelObj = LMUpdateProfileVM()
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: saveButton , color: ColorAssest.redButton.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: men, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: menAndWomen, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: genderFluid, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: women, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
    }
}
