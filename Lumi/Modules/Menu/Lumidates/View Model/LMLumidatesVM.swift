//
//  File.swift
//  Lumi
//
//  Created by Rishabh Sharma on 09/06/22.
//

import Foundation
class LMLumidatesVM {

    // MARK: - Api call for events details
    func lumiUserCall() {
        WebServices.allLumidates(parameters: userProfileParam) { result in
            switch result {
            case .success(let data):
                debugPrint(data)
                allLumidatesObj = data
                reloadMatches?()
                stopAnimating?()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }

    // MARK: - Api call for events details
    func selectedEventsCall() {
        WebServices.selectedEventDetail(toAppend: allLumidatesObj[selectedCellClouser?() ?? 0].eventID.id, parameters: userProfileParam) { (result) in
            switch result {
            case .success(let data):
                debugPrint(data)
                selectedEventsObj = data
                pushToEvent?()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }

    // MARK: - Api call for Block
    func blockUser() {
        WebServices.blockUser(toAppend: allLumidatesObj[selectedCellClouser?() ?? 0].invitedTo.id, parameters: paramsReport) { result in
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
