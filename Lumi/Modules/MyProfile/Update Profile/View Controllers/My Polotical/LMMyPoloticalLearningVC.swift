//
//  LMMyPoloticalLearningVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 28/06/22.
//

import UIKit

class LMMyPoloticalLearningVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var liberal: UIButton!
    @IBOutlet weak private(set) var moderate: UIButton!
    @IBOutlet weak private(set) var conservative: UIButton!
    @IBOutlet weak private(set) var other: UIButton!
    @IBOutlet weak private(set) var preferNotToSay: UIButton!
    @IBOutlet weak private(set) var saveButton: UIButton!

    // MARK: - Properties
    private(set) var userPolotical : String?
    var updateProfileViewModelObj : LMUpdateProfileVM!

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    @IBAction private func saveButton(_ sender: Any) {
        if userPolotical == nil {
            MotionToast(message: StringConstant.Profile.selectOne, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            updateMyProfileObj?.politicalLeaning = userPolotical ?? StringConstant.WelcomeScreen.emptyString
            updateProfileViewModelObj.profileCall()
        }
    }

    // MARK: - Setting up user preference as per the requirment
    @IBAction private func liberal(_ sender: UIButton) {
        switch sender {

        case liberal :
            userPolotical = CommonFunction.commonFunctions.buttonSelectedColorSet(liberal ,userSelection: StringConstant.Profile.liberal)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(moderate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(conservative)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(preferNotToSay)

        case moderate :
            userPolotical = CommonFunction.commonFunctions.buttonSelectedColorSet(moderate ,userSelection: StringConstant.Profile.moderate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(liberal)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(conservative)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(preferNotToSay)

        case conservative :
            userPolotical = CommonFunction.commonFunctions.buttonSelectedColorSet(conservative ,userSelection: StringConstant.Profile.conservative)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(liberal)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(moderate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(preferNotToSay)

        case other :
            userPolotical = CommonFunction.commonFunctions.buttonSelectedColorSet(other ,userSelection: StringConstant.Profile.other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(liberal)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(moderate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(preferNotToSay)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(conservative)

        case preferNotToSay :
            userPolotical = CommonFunction.commonFunctions.buttonSelectedColorSet(preferNotToSay ,userSelection: StringConstant.Profile.preferNotToSay)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(liberal)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(moderate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(conservative)

        default : break
        }
    }
}

// MARK: - Life Cycle Methods
extension LMMyPoloticalLearningVC {

    override func initialSetup() {
        updateProfileViewModelObj = LMUpdateProfileVM()
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: saveButton , color: ColorAssest.redButton.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: liberal, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: conservative, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: other, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: moderate, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: preferNotToSay, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)

    }
}
