//
//  LMLumidateSelectedVM.swift
//  Lumi
//
//  Created by Rishabh Sharma on 08/06/22.
//

import UIKit
class LMLumidateSelectedVM {

    var selectedUserIdClouser : (() -> String)?
    var lumidateDetailsShow : (() -> Void)?
    // MARK: - Api call for events details
    func lumidateDetailsCall() {
        if let userId = selectedUserIdClouser?() {
            WebServices.allLumiUserDetails(toAppend: userId, parameters: userProfileParam) { (result) in
                switch result {
                case .success(let data):
                    debugPrint(data)
                    allLumiUserDetailsObj = data
                    self.lumidateDetailsShow?()
                case .failure(let error):
                    debugPrint(error)
                }
            }
        }
    }

    // MARK: - Api call for block
    func blockUser() {
        WebServices.blockUser(toAppend: allLumiUserDetailsObj?.id ?? StringConstant.WelcomeScreen.emptyString, parameters: paramsReport) { result in
            switch result {
            case .success(let data):
                activityMessage?()
                debugPrint(data)
            case .failure(let error):
                activityMessage2?()
                debugPrint(error)
            }
        }
    }
}
