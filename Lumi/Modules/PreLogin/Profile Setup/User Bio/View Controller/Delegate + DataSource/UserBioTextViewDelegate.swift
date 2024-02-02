//
//  User Bio TextView Delegate.swift
//  Lumi
//
//  Created by Rishabh Sharma on 10/05/22.
//

import Foundation
import UIKit

// MARK: - TextView Delegate
extension LMBioTC : UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let textFieldText = textView.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + text.count
        return count <= 70
    }
}
