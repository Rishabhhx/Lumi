//
//  SecondViewController.swift
//  SOF_SortArrayOfCustomObject
//
//  Created by WiOS Test User on 01/02/18.
//  Copyright © 2018 WiOS Test User. All rights reserved.
//

import UIKit

var reloadRecivedCLouser : (() -> Void)?
var showEvents : (() -> Void)?
var selectedRecivedIdlousere : (() -> Int)?
var acceptInvite : (() -> Void)?

class LMInvitesReceivedVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var inviteRecivedTableview: UITableView!
    @IBOutlet weak private(set) var activityIndicator: UIActivityIndicatorView!

    // MARK: - Properties
    var recivedInvitesViewModelObj : LMInvitesReceivedVM!
}

// MARK: - Life Cycle Methods
extension LMInvitesReceivedVC {

    override func initialSetup() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        stopAnimating = {
            [weak self] in
            guard let `self` = self else { return }
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
        recivedInvitesViewModelObj = LMInvitesReceivedVM()
        recivedInvitesViewModelObj.recivedInvitesCall()
        CommonFunction.commonFunctions.setupTableviewCell(tableView: inviteRecivedTableview, nibName: StringConstant.ViewController.lmInvitesReceivedTC)
        reloadRecivedCLouser = {
            [weak self] in
            guard let `self` = self else { return }
            self.inviteRecivedTableview.reloadData()
        }
        acceptInvite = {
            [weak self] in
            guard let `self` = self else { return }
            self.recivedInvitesViewModelObj.acceptInvite()
        }
        showEvents = {
            [weak self] in
            guard let `self` = self else { return }
            let storyboard = UIStoryboard(name: "Menu", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "LMRevealEventsVC")
            as? LMRevealEventsVC
            self.navigationController?.present(vc ?? UIViewController(), animated: true)
        }
    }
}
