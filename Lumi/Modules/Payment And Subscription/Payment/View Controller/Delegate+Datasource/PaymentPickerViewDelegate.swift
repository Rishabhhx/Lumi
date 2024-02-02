//
//  PaymentPickerViewDelegate.swift
//  Lumi
//
//  Created by Rishabh Sharma on 18/05/22.
//

import UIKit

// MARK: - PickerView Delegate
extension LMPaymentVC : UIPickerViewDataSource, UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        monthExpiration.text = months[0]
        yearExpioration.text = year[0]
        if pickerView.tag == 0 {
            return months[row]
        } else {
            return year[row]
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            monthExpiration.text = months[row]
        } else {
            yearExpioration.text = year[row]
        }
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 0 {
            return 1
        } else {
            return 1
        }
    }

      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          if pickerView.tag == 0 {
              return months.count
          } else {
              return year.count
          }
      }
}
