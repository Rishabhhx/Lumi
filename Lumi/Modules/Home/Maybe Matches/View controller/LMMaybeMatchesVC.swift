//
//  LMMaybeMatchesVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 19/05/22.
//

import UIKit
var reloadMatches : (() -> Void)?
var stopAnimating : (() -> Void)?
var presentInvites : (() -> Void)?

class LMMaybeMatchesVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var matchesTableview: UITableView!
    @IBOutlet weak private(set) var activityIndicator: UIActivityIndicatorView!

    // MARK: - Properties
    var maybeMatchesViewModelObj : LMMaybeMatchesVM!
}

// MARK: - Life Cycle Methods
extension LMMaybeMatchesVC {
    override func initialSetup() {
        CommonFunction.commonFunctions.setupTableviewCell(tableView: matchesTableview, nibName: StringConstant.ViewController.lmMaybeMatchesTC)
        maybeMatchesViewModelObj = LMMaybeMatchesVM()
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
        maybeMatchesViewModelObj.lumiUserCall()
        matchesTableview.delegate = self
        matchesTableview.dataSource = self
    }
}

// MARK: - Dismiss Popup
extension LMMaybeMatchesVC : ReportPopupdismiss {
    func viewDismiss() {
        let controller = LMReportFeedbackVC.instantiate(fromAppStoryboard: .home)
        present(controller, animated: true)
    }
}
