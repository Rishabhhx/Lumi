//
//  LMUserBioVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 30/04/22.
//

import UIKit
import MotionToastView

class LMUserBioVC: LMBaseVC {

    // MARK: - IBOutlets
    @IBOutlet weak private(set) var bioTableView: UITableView!
    @IBAction private func nextButton(_ sender: Any) {
        if userProfileObj.userBio.count < 2 {
            MotionToast(message: StringConstant.Profile.invalidBio, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            nextPage?()
        }
    }
}

// MARK: - Life Cycle Methods
extension LMUserBioVC {
    override func initialSetup() {
        bioTableView.delegate = self
        bioTableView.dataSource = self
    }
}
