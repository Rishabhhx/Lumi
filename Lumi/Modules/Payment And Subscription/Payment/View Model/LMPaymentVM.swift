//
//  LMPaymentVM.swift
//  Lumi
//
//  Created by Rishabh Sharma on 30/05/22.
//

import UIKit
import MotionToastView

class LMPaymentVM {
    var motionToast : (() -> Void)?
    var failureMotion : (() -> Void)?
    var navigate : (() -> Void)?
    func paymentApiCall() {
        WebServices.paymentApi(parameters: paramsPayment) { result in
            switch result {
            case .success(let data):
                debugPrint(data)
                paymentSucessObj = data
                if UserDefaults.standard.object(forKey: UserDefaultVar.subscription.rawValue) as? String != "subscribed" {
                    self.buySubscription()
                } else {
                    self.bookEvent()
                }
            case .failure(let error):
                self.failureMotion?()
                debugPrint(error)
            }
        }
    }

    func buySubscription() {
        WebServices.buySubscriptionApi(toAppend: userSubscriptionObj?.id ?? StringConstant.WelcomeScreen.emptyString, parameters: paramsbuySubscription) { result in
            switch result {
            case .success(let data):
                debugPrint(data)
                self.motionToast?()
                self.navigate?()
                UserDefaults.standard.set("subscribed", forKey: "subscription")
            case .failure(let error):
                debugPrint(error)
            }
        }
    }

    func bookEvent() {
        if let paymentId = paymentApiObj.eventId {
            WebServices.bookEventApi(toAppend: paymentId, parameters: paramsBookEvent) { result in
                switch result {
                case .success(let data):
                    debugPrint(data)
                    self.motionToast?()
                    self.navigate?()
                case .failure(let error):
                    self.failureMotion?()
                    debugPrint(error)
                }
            }
        }
    }
}
