//
//  LMInvitesSentVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 10/06/22.
//

import UIKit

var reloadInviteClouser : (() -> Void)?

class LMInvitesSentVC : LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var inviteSentTableview: UITableView!
    @IBOutlet weak private(set) var activityIndicator: UIActivityIndicatorView!

    // MARK: - Properties
    var sentInviteViewModelObj : LMInvitesSentVM!
}

// MARK: - Life Cycle Methods
extension LMInvitesSentVC {

    override func initialSetup() {
        CommonFunction.commonFunctions.setupTableviewCell(tableView: inviteSentTableview, nibName: StringConstant.ViewController.lmInvitesSentTC)
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        stopAnimating = {
            [weak self] in
            guard let `self` = self else { return }
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
        sentInviteViewModelObj = LMInvitesSentVM()
        sentInviteViewModelObj.sentInvitesCall()
        reloadInviteClouser = {
            [weak self] in
            guard let `self` = self else { return }
            self.inviteSentTableview.reloadData()
        }
    }
}
