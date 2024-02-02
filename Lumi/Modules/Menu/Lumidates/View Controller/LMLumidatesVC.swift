//
//  LMLumidatesVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 02/06/22.
//

import UIKit
var eventCall : (() -> Void)?
var blockUserCall : (() -> Void)?
var pushToEvent : (() -> Void)?
class LMLumidatesVC : LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var matchesTableview: UITableView!
    @IBOutlet weak private(set) var activityIndicator: UIActivityIndicatorView!

    // MARK: - Properties
    var lumidateViewModel : LMLumidatesVM!
}

// MARK: - Life Cycle Methods
extension LMLumidatesVC {

    override func initialSetup() {
        lumidateViewModel = LMLumidatesVM()
        CommonFunction.commonFunctions.setupTableviewCell(tableView: matchesTableview, nibName: StringConstant.ViewController.lmLumidatesTC)
        matchesTableview.delegate = self
        matchesTableview.dataSource = self
        lumidateViewModel.lumiUserCall()
        reloadMatches = {
            [weak self] in
            guard let `self` = self else { return }
            self.matchesTableview.reloadData()
        }
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        stopAnimating = {
            [weak self] in
            guard let `self` = self else { return }
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
        eventCall = {
            [weak self] in
            guard let `self` = self else { return }
            self.lumidateViewModel.selectedEventsCall()
        }
        blockUserCall = {
            [weak self] in
            guard let `self` = self else { return }
            self.lumidateViewModel.blockUser()
        }
        pushToEvent = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMEventDetailsVC.instantiate(fromAppStoryboard: .home)
            controller.tempEventName = selectedEventsObj?.eventName
            controller.tempFromAge = "\(selectedEventsObj?.ageBetween[0] ?? 18) - \(selectedEventsObj?.ageBetween[1] ?? 22)"
            controller.tempPrice = "$\(selectedEventsObj?.price ?? 0 )+"
            controller.paymentPrice = selectedEventsObj?.price
            controller.tempfreeDrinks = selectedEventsObj?.freeDrinks
            controller.tempEventDate = selectedEventsObj?.eventDate
            controller.tempEventLocation =  selectedEventsObj?.eventLocation
            controller.tempTicketsAvilable = selectedEventsObj?.availableTickets
            controller.tempNoOfAttendees = selectedEventsObj?.bookedTickets
            controller.tempDescription = selectedEventsObj?.eventDescription
            controller.eventId = selectedEventsObj?.id
            controller.tempLat = selectedEventsObj?.location.coordinates[0]
            controller.tempLong = selectedEventsObj?.location.coordinates[1]
            controller.isAvailableToBook = false
            self.push(vc: controller)
        }
    }
}

// MARK: - Dismiss Popup
extension LMLumidatesVC : ReportPopupdismiss {
    func viewDismiss() {
        let controller = LMReportFeedbackVC.instantiate(fromAppStoryboard: .home)
        present(controller, animated: true)
    }
}
