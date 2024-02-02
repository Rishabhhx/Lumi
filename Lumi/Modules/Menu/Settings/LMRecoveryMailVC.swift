//
//  LMRecoveryMailVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 01/07/22.
//

import UIKit

class LMRecoveryMailVC: LMBaseVC {

    @IBAction private func backButton(_ sender: Any) {
        pop()
    }
    @IBAction private func verifyButton(_ sender: Any) {
        verifyMail()
    }
    func verifyMail() {
        WebServices.verifyMailCall(parameters: verifyMailDic) { result in
            switch result {
            case .success(let data):
                activityMessage?()
                self.pop()
                debugPrint(data)
            case .failure(let error):
                activityMessage2?()
                debugPrint(error)
            }
        }
    }
    @IBOutlet weak private(set) var verifyButton: UIButton!
    @IBOutlet weak private(set) var emailText: UITextField!
    override func initialSetup() {
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: verifyButton , color: ColorAssest.redButton.colorAssest, radius: 22.5)
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

    }
}
