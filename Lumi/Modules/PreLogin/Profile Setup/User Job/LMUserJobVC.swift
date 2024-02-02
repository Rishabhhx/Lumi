//
//  LMUserJobVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 20/04/22.
//

import UIKit
import MotionToastView

class LMUserJobVC: LMBaseVC, UITextFieldDelegate {

    // MARK: - Outlets
    @IBOutlet weak private(set) var jobTextField: UITextField!

    // MARK: - IBOutlet Actions for saving user job and moving next view controller
    @IBAction private func nextButton(_ sender: Any) {
        guard let job = jobTextField.text else { return }
        if job.isEmpty || job.trimmingCharacters(in: .whitespaces).isEmpty {
            MotionToast(message: StringConstant.Profile.jobEmpty, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            userProfileObj.userJob = jobTextField.text
            nextPage?()
        }
    }
}
