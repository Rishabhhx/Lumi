//
//  LMMaybeMatchesVM.swift
//  Lumi
//
//  Created by Rishabh Sharma on 24/05/22.
//

import UIKit

class LMMaybeMatchesVM {

    // MARK: - Api call for events details
    func lumiUserCall() {
        WebServices.allLumiUser(parameters: userProfileParam) { result in
            switch result {
            case .success(let data):
                debugPrint(data)
                allLumiUserObj = data
                reloadMatches?()
                stopAnimating?()
            case .failure(let error):
                debugPrint(error)
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
