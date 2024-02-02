//
//  PhoneTextFieldDelegate.swift
//  Lumi
//
//  Created by Rishabh Sharma on 16/05/22.
//

import UIKit

// MARK: - TextField Extensions
extension LMContinueWithPhoneNoVC : UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let maxlength = 10
            let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            if !text.isEmpty {
                let allowedCharacters = StringConstant.SignUp.digits
                let allowedCharcterSet = CharacterSet(charactersIn: allowedCharacters)
                let typedCharcterSet = CharacterSet(charactersIn: string)
                return  text.count <= maxlength && allowedCharcterSet.isSuperset(of: typedCharcterSet)
            }
            return true
        }
}
