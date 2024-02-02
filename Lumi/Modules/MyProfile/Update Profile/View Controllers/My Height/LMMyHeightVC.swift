//
//  LMMyHeightVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 27/06/22.
//

import UIKit

class LMMyHeightVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var inchesPickerView: UIPickerView!
    @IBOutlet weak private(set) var feetPickerView: UIPickerView!
    @IBOutlet weak private(set) var saveButton: UIButton!

    // MARK: - Properties
    private(set) var feet : [Int] = []
    private(set) var inches : [Int] = []
    public var userHeightFeet : Int?
    public var userHeightInches : Int?
    var updateProfileViewModelObj : LMUpdateProfileVM!

    // MARK: - IBOutlets Action
    @IBAction private func saveButton(_ sender: Any) {
        updateMyProfileObj?.height[0] = userHeightFeet ?? 0
        updateMyProfileObj?.height[1] = userHeightInches ?? 1
        updateProfileViewModelObj.profileCall()
    }

    @IBAction private func backButton(_ sender: Any) {
        pop()
    }
}

// MARK: - Life Cycle Functions
extension LMMyHeightVC {

    override func initialSetup() {
        updateProfileViewModelObj = LMUpdateProfileVM()
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: saveButton , color: ColorAssest.redButton.colorAssest, radius: 22.5)
        feetPickerView.dataSource = self
        feetPickerView.delegate = self
        inchesPickerView.dataSource = self
        inchesPickerView.delegate = self
        for loop1 in 0..<7 {
            feet.insert((loop1+1), at: loop1)
        }
        for loop2 in 0..<12 {
            inches.insert((loop2+1), at: loop2)
        }
    }
}

// MARK: - UIPickerView
extension LMMyHeightVC : UIPickerViewDataSource ,UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return feet.count
        } else {
            return inches.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return "\(feet[row])"
        } else {
            return "\(inches[row])"
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == feetPickerView {
            switch component {
            case 0:
                userHeightFeet = feet[row]
            default:
                break
            }
        } else {
            switch component {
            case 0:
                userHeightInches = inches[row]
            default:
                break
            }
        }
    }
}
