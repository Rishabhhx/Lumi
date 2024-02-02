//
//  LMMyEducationVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 27/06/22.
//

import UIKit

class LMMyEducationVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var highSchool: UIButton!
    @IBOutlet weak private(set) var undergraduate: UIButton!
    @IBOutlet weak private(set) var postgraduate: UIButton!
    @IBOutlet weak private(set) var preferNotToSay: UIButton!
    @IBOutlet weak private(set) var saveButton: UIButton!

    // MARK: - Properties
    private(set) var userEducation : String?
    var updateProfileViewModelObj : LMUpdateProfileVM!

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    @IBAction private func saveButton(_ sender: Any) {
        if userEducation == nil {
            MotionToast(message: StringConstant.Profile.selectOne, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            updateMyProfileObj?.eduLevel = userEducation ?? StringConstant.WelcomeScreen.emptyString
            updateProfileViewModelObj.profileCall()
        }
    }

    // MARK: - Setting up user preference as per the requirment
    @IBAction private func highSchool(_ sender: UIButton) {
        switch sender {

        case highSchool :
            userEducation = CommonFunction.commonFunctions.buttonSelectedColorSet(highSchool ,userSelection: StringConstant.Profile.highSchool)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(undergraduate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(postgraduate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(preferNotToSay)

        case undergraduate :
            userEducation = CommonFunction.commonFunctions.buttonSelectedColorSet(undergraduate ,userSelection: StringConstant.Profile.undergraduate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(highSchool)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(postgraduate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(preferNotToSay)

        case postgraduate :
            userEducation = CommonFunction.commonFunctions.buttonSelectedColorSet(postgraduate ,userSelection: StringConstant.Profile.postGraduate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(highSchool)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(undergraduate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(preferNotToSay)

        case preferNotToSay :
            userEducation = CommonFunction.commonFunctions.buttonSelectedColorSet(preferNotToSay ,userSelection: StringConstant.Profile.preferNotToSay)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(highSchool)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(undergraduate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet1(postgraduate)
        default : break
        }
    }
}

// MARK: - Life Cycle Methods
extension LMMyEducationVC {

    override func initialSetup() {
        updateProfileViewModelObj = LMUpdateProfileVM()
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: saveButton , color: ColorAssest.redButton.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: highSchool, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: postgraduate, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: preferNotToSay, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: undergraduate, color: ColorAssest.bookSelected.colorAssest, radius: 22.5)
    }
}
