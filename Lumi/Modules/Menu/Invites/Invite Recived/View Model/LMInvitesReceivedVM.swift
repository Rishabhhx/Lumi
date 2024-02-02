//
//  LMInvitesRecivedVM.swift
//  Lumi
//
//  Created by Rishabh Sharma on 13/06/22.
//

import UIKit
class LMInvitesReceivedVM {
    // MARK: - Api call for events details
    func recivedInvitesCall() {
        WebServices.allRecivedInvites(parameters: userProfileParam) { result in
            switch result {
            case .success(let data):
                debugPrint(data)
                allSentRecivedInvites = data
                allRecivedInvites = allSentRecivedInvites.filter { data in
                    data.inviteType == "SENT"
                }
                reloadRecivedCLouser?()
                stopAnimating?()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }

    // MARK: - Accept Invite
    func acceptInvite() {
            WebServices.acceptInviteApi(toAppend: allRecivedInvites[selectedRecivedIdlousere?() ?? 0].id, parameters: paramsBookEvent) { result in
                switch result {
                case .success(let data):
                    debugPrint(data)
                case .failure(let error):
                    debugPrint(error)
                }
            }
    }

    // MARK: - Decline Invite
    func declineInvite() {
        WebServices.declineInviteApi(toAppend: allRecivedInvites[selectedRecivedIdlousere?() ?? 0].invitedBy.id, parameters: paramsBookEvent) { result in
            switch result {
            case .success(let data):
                debugPrint(data)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
