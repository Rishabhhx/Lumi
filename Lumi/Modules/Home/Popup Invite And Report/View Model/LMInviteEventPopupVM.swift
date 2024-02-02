//
//  LMInviteEventPopupVM.swift
//  Lumi
//
//  Created by Rishabh Sharma on 30/05/22.
//

import UIKit

class LMInviteEventPopupVM {

    func inviteEvent() {
        WebServices.inviteEventApi(toAppend: userEventId ?? "", toAppend2: userId ?? "", parameters: paramsInvite) { result in
            switch result {
            case .success(let data):
                debugPrint(data)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
