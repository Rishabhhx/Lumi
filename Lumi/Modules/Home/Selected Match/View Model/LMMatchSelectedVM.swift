//
//  LMMatchSelectedVM.swift
//  Lumi
//
//  Created by Rishabh Sharma on 25/05/22.
//

import UIKit
class LMMatchSelectedVM {

    var selectedUserIdClouser : (() -> String)?
    var lumiUserDetailsShow : (() -> Void)?

    // MARK: - Api call for events details
    func lumiUserDetailsCall() {
        if let userId = selectedUserIdClouser?() {
            WebServices.allLumiUserDetails(toAppend: userId, parameters: userProfileParam) { (result) in
                switch result {
                case .success(let data):
                    debugPrint(data)
                    allLumiUserDetailsObj = data
                    self.lumiUserDetailsShow?()
                case .failure(let error):
                    debugPrint(error)
                }
            }
        }
    }

    // MARK: - Api call for events details
    func myEventsDetailsCall() {
        WebServices.myEvents(parameters: userProfileParam) { result in
            switch result {
            case .success(let data):
                debugPrint(data)
                myeventsObj = data
                reloadEvents?()
                print(myeventsObj)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
