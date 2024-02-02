//
//  LMMyNameVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 24/06/22.
//

import UIKit

class LMMyNameVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var save: UIButton!
    @IBOutlet weak private(set) var userName: UITextField!

    // MARK: - Properties
    var updateProfileViewModelObj : LMUpdateProfileVM!

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    @IBAction private func save(_ sender: Any) {
        updateMyProfileObj?.name = userName.text ?? ""
        updateProfileViewModelObj.profileCall()
    }
}

// MARK: - Life Cycle Methods
extension LMMyNameVC {

    override func initialSetup() {
        updateProfileViewModelObj = LMUpdateProfileVM()
        userName.text = myProfileObj?.name
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: save , color: ColorAssest.redButton.colorAssest, radius: 22.5)
    }
}
