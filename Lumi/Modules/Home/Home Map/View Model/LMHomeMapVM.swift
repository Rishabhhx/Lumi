//
//  LMHomeMapVM.swift
//  Lumi
//
//  Created by Rishabh Sharma on 24/05/22.
//

import UIKit

class LMHomeMapVM {

    // MARK: - Api call for events details
    func eventDetailsCall() {
        WebServices.allEvents(parameters: userProfileParam) { result in
            switch result {
            case .success(let data):
                debugPrint(data)
                alleventsObj = data
                showAnnotations?()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
