//
//  LMSentInviteVM.swift
//  Lumi
//
//  Created by Rishabh Sharma on 13/06/22.
//

import UIKit
class LMInvitesSentVM {

    // MARK: - Api call for events details
    func sentInvitesCall() {
        WebServices.allSentInvites(parameters: userProfileParam) { result in
            switch result {
            case .success(let data):
                debugPrint(data)
                allSentRecivedInvites = data
                allSentInvites = allSentRecivedInvites.filter { data in
                    data.inviteType == "SENT"
                }
                reloadInviteClouser?()
                stopAnimating?()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
