//
//  LMCreateNewAccountVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 07/04/22.
//

import UIKit

class LMCreateNewAccountVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var createNewAccount: UIButton!
    @IBOutlet weak private(set) var linkExisting: UIButton!

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers
        for aViewController in viewControllers {
            if aViewController is LMWelcomeScreenVC {
                self.navigationController!.popToViewController(aViewController, animated: true)
            }
        }
    }

    // MARK: - Creating new account of user
    @IBAction private func createNewAccount(_ sender: Any) {
        let controller = LMCreateAccountPopupVC.instantiate(fromAppStoryboard: .main)
        controller.viewDismissDelegate = self
        present(controller, animated: true, completion: nil)
    }

    @IBAction private func linkExisting(_ sender: Any) {
        // We will link exisitng account of user if he has previously login
    }

}

// MARK: - Life Cycle Methods
extension LMCreateNewAccountVC {

    override func initialSetup() {
        createNewAccount.backgroundColor = ColorAssest.redButton.colorAssest
        CommonFunction.commonFunctions.buttonShadow(buttonName: createNewAccount)
        linkExisting.backgroundColor = ColorAssest.linkExisting.colorAssest
        linkExisting.layer.cornerRadius = 22.5
    }
}

// MARK: - Dismiss Popup
extension LMCreateNewAccountVC : Popupdismiss {

    func viewDismiss() {
        let controller = LMProfileVC.instantiate(fromAppStoryboard: .main)
        push(vc: controller)
    }
}
