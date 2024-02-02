//
//  LMMyIntrestAgeVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 27/06/22.
//

import UIKit

class LMMyIntrestAgeVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet private weak var ageSlider: UISlider!
    @IBOutlet weak private(set) var minAge: UILabel!
    @IBOutlet weak private(set) var maxAge: UILabel!
    @IBOutlet weak private(set) var saveButton: UIButton!

    // MARK: - Variables
    var max = myProfileObj?.ageBetween[1]
    var min = myProfileObj?.ageBetween[0]
    var updateProfileViewModelObj : LMUpdateProfileVM!

    // MARK: - IBOutlets Actions
    @IBAction private func ageSlider(_ sender: UISlider) {
        let currentAge = Int(ageSlider.value)
        max = Int(currentAge)
        maxAge.text = "\(currentAge)"
    }

    @IBAction private func saveButton(_ sender: Any) {
        updateMyProfileObj?.ageBetween[0] = min ?? 18
        updateMyProfileObj?.ageBetween[1] = max ?? 75
        updateProfileViewModelObj.profileCall()
    }

    @IBAction private func backButton(_ sender: Any) {
        pop()
    }
}

// MARK: - Life Cycle Methods
extension LMMyIntrestAgeVC {

    override func initialSetup() {
        ageSlider.value = Float(myProfileObj?.ageBetween[1] ?? 0)
        maxAge.text = "\(myProfileObj?.ageBetween[1] ?? 0)"
        updateProfileViewModelObj = LMUpdateProfileVM()
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: saveButton , color: ColorAssest.redButton.colorAssest, radius: 22.5)
    }
}
