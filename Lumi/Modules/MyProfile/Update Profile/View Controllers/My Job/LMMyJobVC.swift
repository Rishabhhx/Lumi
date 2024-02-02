//
//  LMMyJobVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 27/06/22.
//

import UIKit

class LMMyJobVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var save: UIButton!
    @IBOutlet weak private(set) var userJob: UITextField!

    // MARK: - Properties
    var updateProfileViewModelObj : LMUpdateProfileVM!

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    @IBAction private func save(_ sender: Any) {
        updateMyProfileObj?.jobTitle = userJob.text ?? StringConstant.WelcomeScreen.emptyString
        updateProfileViewModelObj.profileCall()
    }
}

// MARK: - Life Cycle Methods
extension LMMyJobVC {

    override func initialSetup() {
        updateProfileViewModelObj = LMUpdateProfileVM()
        userJob.text = myProfileObj?.jobTitle
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: save , color: ColorAssest.redButton.colorAssest, radius: 22.5)
    }
}
