//
//  LMUserIntrestAgeVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 17/04/22.
//

import UIKit

class LMUserIntrestAgeVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet private weak var ageSlider: UISlider!
    @IBOutlet weak private(set) var minAge: UILabel!
    @IBOutlet weak private(set) var maxAge: UILabel!

    // MARK: - Variables
    var max : Int?
    var min = 18

    // MARK: - IBOutlets Actions
    @IBAction private func ageSlider(_ sender: UISlider) {
        let currentAge = Int(ageSlider.value)
        max = Int(currentAge)
        maxAge.text = "\(currentAge)"
    }

    @IBAction private func nextButton(_ sender: Any) {
        userProfileObj.userAgeIntrested.append(min)
        userProfileObj.userAgeIntrested.append(max ?? 18)
        nextPage?()
    }
}
