//
//  LMOtpVM.swift
//  Lumi
//
//  Created by Rishabh Sharma on 28/04/22.
//

import UIKit

class LMOtpVM {
    var nextController : (() -> Void)?
    var failureAlert : (() -> Void)?

    // MARK: - Getting otp api call
    func otpAPICall() {
        if UserDefaults.standard.object(forKey: UserDefaultVar.updateNumberStatus.rawValue) as? String == "Update Phone Number" {
            self.nextController?()
        } else {
            WebServices.otpAPICall(parameters: paramsOtp) { result in
                switch result {
                case .success(let data):
                    activityMessage?()
                    LMRouter.checkAppinitalizationFlow()
                    debugPrint(data)
                case .failure(let error):
                    activityMessage2?()
                    stopActivity?()
                    debugPrint(error)
                }
            }
        }
    }
}
