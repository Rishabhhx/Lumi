//
//  LMRevealEventsVM.swift
//  Lumi
//
//  Created by Rishabh Sharma on 20/06/22.
//

import UIKit

class LMRevealEventsVM {

    // MARK: - Api call for events details
    func myEventsDetailsCall() {
        WebServices.myEvents(parameters: userProfileParam) { result in
            switch result {
            case .success(let data):
                debugPrint(data)
                myeventsObj = data
                reloadEventTableView?()
                print(myeventsObj)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
