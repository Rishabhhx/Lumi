//
//  PaymentTextfieldDelegate.swift
//  Lumi
//
//  Created by Rishabh Sharma on 18/05/22.
//

import UIKit

// MARK: - TextField Delegate
extension LMPaymentVC : UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == cardNumber {
            let maxlength = 19
            let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            if !text.isEmpty {
                let allowedCharcterSet = NSCharacterSet.decimalDigits
                let typedCharcterSet = CharacterSet(charactersIn: string)
                return  text.count <= maxlength && allowedCharcterSet.isSuperset(of: typedCharcterSet)
            }
            return true
        } else if textField == cvvNumber {
            let maxlength = 3
            let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            if !text.isEmpty {
                let allowedCharcterSet = NSCharacterSet.decimalDigits
                let typedCharcterSet = CharacterSet(charactersIn: string)
                return  text.count <= maxlength && allowedCharcterSet.isSuperset(of: typedCharcterSet)
            }
            return true
        } else {
            let maxlength = 25
            let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            if !text.isEmpty {
                let allowedCharacters = StringConstant.RegEx.alphabets
                let allowedCharcterSet = CharacterSet(charactersIn: allowedCharacters)
                let typedCharcterSet = CharacterSet(charactersIn: string)
                return  text.count <= maxlength && allowedCharcterSet.isSuperset(of: typedCharcterSet)
            }
            return true
        }
    }
}
