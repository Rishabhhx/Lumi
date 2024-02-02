//
//  LMUserEducationVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 22/04/22.
//

import UIKit
import MotionToastView

class LMUserEducationVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var highSchool: UIButton!
    @IBOutlet weak private(set) var undergraduate: UIButton!
    @IBOutlet weak private(set) var postgraduate: UIButton!
    @IBOutlet weak private(set) var preferNotToSay: UIButton!

    // MARK: - Properties
    private(set) var userEducation : String?

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    @IBAction private func nextButton(_ sender: Any) {
        if userEducation == nil {
            MotionToast(message: StringConstant.Profile.selectOne, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            nextPage?()
            userProfileObj.userEducation = userEducation
        }
    }

    // MARK: - Setting up user preference as per the requirment
    @IBAction private func highSchool(_ sender: UIButton) {
        switch sender {

        case highSchool :
            userEducation = CommonFunction.commonFunctions.buttonSelectedColorSet(highSchool ,userSelection: StringConstant.Profile.highSchool)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(undergraduate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(postgraduate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)

        case undergraduate :
            userEducation = CommonFunction.commonFunctions.buttonSelectedColorSet(undergraduate ,userSelection: StringConstant.Profile.undergraduate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(highSchool)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(postgraduate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)

        case postgraduate :
            userEducation = CommonFunction.commonFunctions.buttonSelectedColorSet(postgraduate ,userSelection: StringConstant.Profile.postGraduate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(highSchool)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(undergraduate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)

        case preferNotToSay :
            userEducation = CommonFunction.commonFunctions.buttonSelectedColorSet(preferNotToSay ,userSelection: StringConstant.Profile.preferNotToSay)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(highSchool)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(undergraduate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(postgraduate)
        default : break
        }
    }
}

// MARK: - Life Cycle Functions
extension LMUserEducationVC {

    override func initialSetup() {
        CommonFunction.commonFunctions.intrestButton(buttonName: highSchool)
        CommonFunction.commonFunctions.intrestButton(buttonName: undergraduate)
        CommonFunction.commonFunctions.intrestButton(buttonName: postgraduate)
        CommonFunction.commonFunctions.intrestButton(buttonName: preferNotToSay)
    }
}
