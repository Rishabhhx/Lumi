//
//  LMMyBookingsVM.swift
//  Lumi
//
//  Created by Rishabh Sharma on 16/06/22.
//

import Foundation
class LMMyBookingsVM {

    var reloadBookings : (() -> Void)?

    // MARK: - Api call for events details
    func bookingsEvent() {
        WebServices.allBookingEvents(parameters: userProfileParam) { result in
            switch result {
            case .success(let data):
                debugPrint(data)
                allBookingEventsObj = data
                self.reloadBookings?()
                stopAnimating?()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
