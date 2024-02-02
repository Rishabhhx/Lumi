//
//  LMUserIntrestedVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 14/04/22.
//
import UIKit
import MotionToastView

class LMUserIntrestedVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var men: UIButton!
    @IBOutlet weak private(set) var women: UIButton!
    @IBOutlet weak private(set) var menAndWomen: UIButton!
    @IBOutlet weak private(set) var genderFluid: UIButton!

    // MARK: - Properties
    private(set) var userIntrested : String?

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    @IBAction private func nextButton(_ sender: Any) {
        if userIntrested == nil {
            MotionToast(message: StringConstant.Profile.selectOne, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            userProfileObj.userIntrested = userIntrested
            nextPage?()
        }
    }

    // MARK: - Setting up user preference
    @IBAction private func men(_ sender: UIButton) {
        switch sender {
        case men :
            userIntrested = CommonFunction.commonFunctions.buttonSelectedColorSet(men ,userSelection: StringConstant.Profile.men)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(women)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(menAndWomen)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(genderFluid)
        case women :
            userIntrested = CommonFunction.commonFunctions.buttonSelectedColorSet(women ,userSelection: StringConstant.Profile.women)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(men)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(menAndWomen)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(genderFluid)
        case menAndWomen :
            userIntrested = CommonFunction.commonFunctions.buttonSelectedColorSet(menAndWomen ,userSelection: StringConstant.Profile.menAndWomen)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(men)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(women)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(genderFluid)
        case genderFluid :
            userIntrested = CommonFunction.commonFunctions.buttonSelectedColorSet(genderFluid ,userSelection: StringConstant.Profile.genderFlucid)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(men)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(women)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(menAndWomen)
        default : break
        }
    }
}

// MARK: - Life Cycle Methods
extension LMUserIntrestedVC {

    override func initialSetup() {
        CommonFunction.commonFunctions.intrestButton(buttonName: men)
        CommonFunction.commonFunctions.intrestButton(buttonName: women)
        CommonFunction.commonFunctions.intrestButton(buttonName: menAndWomen)
        CommonFunction.commonFunctions.intrestButton(buttonName: genderFluid)
    }
}
