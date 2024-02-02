//
//  LMUserDrugsVM.swift
//  Lumi
//
//  Created by Rishabh Sharma on 10/05/22.
//

import Foundation
import UIKit

class LMUserDrugsVM {
    var nextController : (() -> Void)?

    // MARK: - Getting profile api call
    func profileCall() {
        WebServices.profileCall(parameters: userProfileParam) { result in
            switch result {
            case .success(let data):
                self.nextController?()
                activityMessage?()
                debugPrint(data)
            case .failure(let error):
                activityMessage2?()
                stopActivity?()
                debugPrint(error)
            }
        }
    }
}
