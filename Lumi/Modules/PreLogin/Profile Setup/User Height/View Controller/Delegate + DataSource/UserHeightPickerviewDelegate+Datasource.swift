//
//  User Height PickerviewDelegate + Datasource.swift
//  Lumi
//
//  Created by Rishabh Sharma on 10/05/22.
//

import Foundation
import UIKit

// MARK: - UIPickerView
extension LMUserHeightVC : UIPickerViewDataSource ,UIPickerViewDelegate {

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
