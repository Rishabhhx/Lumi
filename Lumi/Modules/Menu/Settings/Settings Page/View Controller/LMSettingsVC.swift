//
//  LMSettingsVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 06/06/22.
//

import UIKit

class LMSettingsVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var settingsTableView: UITableView!
    @IBOutlet weak private(set) var logoutButton: UIButton!
    @IBOutlet weak private(set) var activityIndicator: UIActivityIndicatorView!

    // MARK: - IBOutlets Actions
    @IBAction private func logoutButton(_ sender: Any) {
        logoutAPICall()
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }

    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    func logoutAPICall() {
        WebServices.logoutAPICall(parameters: paramsPhoneNo) { result in
            switch result {
            case .success(let data):
                activityMessage?()
                self.removeUserDefaultAfterLogout()
                stopAnimating?()
                debugPrint(data)
            case .failure(let error):
                activityMessage2?()
                debugPrint(error)
            }
        }
    }

    func removeUserDefaultAfterLogout() {
        UserDefaults.standard.removeObject(forKey: UserDefaultVar.loginType.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaultVar.status.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaultVar.updateNumberStatus.rawValue)
        LMRouter.checkAppinitalizationFlow()
    }
}

// MARK: - Life Cycle Methods
extension LMSettingsVC {

    override func initialSetup() {
        CommonFunction.commonFunctions.setupTableviewCell(tableView: settingsTableView, nibName: StringConstant.ViewController.lmSettingsTC)
        activityMessage = {
            [weak self] in
            guard let `self` = self else { return }
            self.MotionToast(message: resultMesage ?? StringConstant.WelcomeScreen.emptyString, toastType: .success, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        }
        activityMessage2 = {
            [weak self] in
            guard let `self` = self else { return }
            self.MotionToast(message: resultMesage ?? StringConstant.WelcomeScreen.emptyString, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        }
        activityIndicator.isHidden = true
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: logoutButton, color: ColorAssest.greyblue.colorAssest, radius: 22.5)
        logoutButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
}
