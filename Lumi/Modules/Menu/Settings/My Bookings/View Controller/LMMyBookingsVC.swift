//
//  LMMyBookingsVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 09/06/22.
//

import UIKit

class LMMyBookingsVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var myBookingsTableView: UITableView!
    @IBOutlet weak private(set) var backButton: UIButton!
    @IBOutlet weak private(set) var activityIndicator: UIActivityIndicatorView!

    // MARK: - Properties
    var myBookingsViewModelObj : LMMyBookingsVM!

    // MARK: - IBOutlets Action
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }
}

// MARK: - Life Cycle Methods
extension LMMyBookingsVC {

    override func initialSetup() {
        CommonFunction.commonFunctions.setupTableviewCell(tableView: myBookingsTableView, nibName: StringConstant.ViewController.lmMyBookingsTC)
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        myBookingsViewModelObj = LMMyBookingsVM()
        stopAnimating = {
            [weak self] in
            guard let `self` = self else { return }
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
        myBookingsViewModelObj.reloadBookings = {
            [weak self] in
            guard let `self` = self else { return }
            self.myBookingsTableView.reloadData()
        }
        myBookingsViewModelObj.bookingsEvent()
    }
}
