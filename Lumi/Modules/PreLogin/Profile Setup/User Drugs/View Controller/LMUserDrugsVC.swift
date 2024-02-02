//
//  LMUserDrugsVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 22/04/22.
//

import UIKit
import MotionToastView

class LMUserDrugsVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var yesButton: UIButton!
    @IBOutlet weak private(set) var sometimesButton: UIButton!
    @IBOutlet weak private(set) var noButton: UIButton!
    @IBOutlet weak private(set) var preferNotToSay: UIButton!

    // MARK: - Properties
    private(set) var userDrugs : String?
    lazy var drugsViewModelObj = LMUserDrugsVM()

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    @IBAction private func nextButton(_ sender: Any) {
        if userDrugs == nil {
            MotionToast(message: StringConstant.Profile.selectOne, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
       } else {
            userProfileObj.userDrugs = userDrugs
           drugsViewModelObj.profileCall()
           let status = StringConstant.Constants.loginDone
           UserDefaults.standard.set(status, forKey: UserDefaultVar.status.rawValue)
        }
    }

    // MARK: - Setting up user preference as per the requirment
    @IBAction private func yesButton(_ sender: UIButton) {
        switch sender {
        case yesButton :
            userDrugs = CommonFunction.commonFunctions.buttonSelectedColorSet(yesButton ,userSelection: StringConstant.Profile.yes)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(sometimesButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(noButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)
        case sometimesButton :
            userDrugs = CommonFunction.commonFunctions.buttonSelectedColorSet(sometimesButton ,userSelection: StringConstant.Profile.sometimes)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(yesButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(noButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)
        case noButton :
            userDrugs = CommonFunction.commonFunctions.buttonSelectedColorSet(noButton ,userSelection: StringConstant.Profile.no)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(yesButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(sometimesButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(preferNotToSay)
        case preferNotToSay :
            userDrugs = CommonFunction.commonFunctions.buttonSelectedColorSet(preferNotToSay ,userSelection: StringConstant.Profile.preferNotToSay)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(yesButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(sometimesButton)
            CommonFunction.commonFunctions.buttonNotSelectedColorSet(noButton)
        default : break
        }
    }
}

// MARK: - Life Cycle Functions
extension LMUserDrugsVC {

    override func initialSetup() {
        CommonFunction.commonFunctions.intrestButton(buttonName: yesButton)
        CommonFunction.commonFunctions.intrestButton(buttonName: sometimesButton)
        CommonFunction.commonFunctions.intrestButton(buttonName: noButton)
        CommonFunction.commonFunctions.intrestButton(buttonName: preferNotToSay)
        drugsViewModelObj.nextController = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMHomeVC.instantiate(fromAppStoryboard: .home)
            self.push(vc: controller)
        }
    }
}
