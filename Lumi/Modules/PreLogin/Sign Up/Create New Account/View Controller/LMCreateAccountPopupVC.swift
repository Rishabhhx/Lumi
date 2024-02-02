//
//  LMCreateAccountPopupVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 08/04/22.
//

import UIKit

// Protocol declare
protocol Popupdismiss : AnyObject {
    func viewDismiss()
}

class LMCreateAccountPopupVC: LMBaseVC {

    // MARK: - OUTLETS
    @IBOutlet weak private(set) var manualFill: UIButton!
    @IBOutlet weak private(set) var facebookFill: UIButton!

    // MARK: - Properties
    weak var viewDismissDelegate : Popupdismiss?

    // MARK: - User manulally fill the profile details
    @IBAction private func manualFill(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        self.viewDismissDelegate?.viewDismiss()
    }

    // MARK: - User facebook fill the profile details
    @IBAction private func facebookFill(_ sender: Any) {
        CommonFunction.commonFunctions.aleart(aleartMessage: StringConstant.WelcomeScreen.continueWithFacebook, self)
    }

}
// MARK: - Life Cycle Methods
extension LMCreateAccountPopupVC {

    override func initialSetup() {
        manualFill.backgroundColor = ColorAssest.redButton.colorAssest
        CommonFunction.commonFunctions.buttonShadow(buttonName: manualFill)
        facebookFill.backgroundColor = ColorAssest.facebook.colorAssest
        CommonFunction.commonFunctions.buttonShadow(buttonName: facebookFill)
        facebookFill.layer.shadowColor = ColorAssest.facebook.colorAssest.cgColor
    }
}
