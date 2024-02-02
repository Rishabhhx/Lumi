//
//  LMUpdateProfileVM.swift
//  Lumi
//
//  Created by Rishabh Sharma on 28/06/22.
//

import Foundation
class LMUpdateProfileVM {
    func profileCall() {
        WebServices.profileCall(parameters: updateMyProfileParam) { result in
            switch result {
            case .success(let data):
                activityMessage?()
                popViewController?()
                debugPrint(data)
            case .failure(let error):
                activityMessage2?()
//                stopActivity?()
                debugPrint(error)
            }
        }
    }
}
