//
//  LMUserPoliticalVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 22/04/22.
//

import UIKit
import MotionToastView

class LMUserPoliticalVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var liberal: UIButton!
    @IBOutlet weak private(set) var moderate: UIButton!
    @IBOutlet weak private(set) var conservative: UIButton!
    @IBOutlet weak private(set) var other: UIButton!
    @IBOutlet weak private(set) var preferNotToSay: UIButton!

    // MARK: - Properties
    private(set) var userPolitical : String?

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }
    // MARK: - Moving to next controller
    @IBAction private func nextButton(_ sender: Any) {
        if userPolitical == nil {
            MotionToast(message: StringConstant.Profile.selectOne, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            userProfileObj.userPolitical = userPolitical
            nextPage?()
        }
    }

    // MARK: - Setting up user preference as per the requirment
    @IBAction private func liberal(_ sender: UIButton) {
        switch sender {
        case liberal :
            userPolitical = CommonFunction.commonFunctions.buttonSelectedColorSet(liberal ,userSelection: StringConstant.Profile.liberal)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(moderate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(conservative)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)

        case moderate :
            userPolitical = CommonFunction.commonFunctions.buttonSelectedColorSet(moderate ,userSelection: StringConstant.Profile.moderate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(liberal)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(conservative)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)

        case conservative :
            userPolitical = CommonFunction.commonFunctions.buttonSelectedColorSet(conservative ,userSelection: StringConstant.Profile.conservative)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(liberal)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(moderate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)

        case other :
            userPolitical = CommonFunction.commonFunctions.buttonSelectedColorSet(other ,userSelection: StringConstant.Profile.other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(liberal)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(moderate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(conservative)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)

        case preferNotToSay :
            userPolitical = CommonFunction.commonFunctions.buttonSelectedColorSet(preferNotToSay ,userSelection: StringConstant.Profile.preferNotToSay)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(liberal)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(moderate)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(other)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(conservative)

        default : break
        }
    }
}

// MARK: - Life Cycle Functions
extension LMUserPoliticalVC {

    override func initialSetup() {
        CommonFunction.commonFunctions.intrestButton(buttonName: liberal)
        CommonFunction.commonFunctions.intrestButton(buttonName: moderate)
        CommonFunction.commonFunctions.intrestButton(buttonName: conservative)
        CommonFunction.commonFunctions.intrestButton(buttonName: other)
        CommonFunction.commonFunctions.intrestButton(buttonName: preferNotToSay)
    }
}
