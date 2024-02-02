//
//  LMSubscriptionVM.swift
//  Lumi
//
//  Created by Rishabh Sharma on 01/06/22.
//

import UIKit

class LMSubscriptionVM {

    func subscriptionCall() {
        WebServices.allSubscriptionApi(parameters: userProfileParam) { result in
            switch result {
            case .success(let data):
                debugPrint(data)
                allSubscriptionModelObj = data
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
