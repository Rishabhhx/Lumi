//
//  LMInviteEventPopupVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 25/05/22.
//

import UIKit
var userId : String?
var userEventId : String?
var reloadEvents : (() -> Void)?

class LMInviteEventPopupVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var inviteUserLabel: UILabel!
    @IBOutlet weak private(set) var picView: UIView!
    @IBOutlet weak private(set) var profilePic: UIImageView!
    @IBOutlet private(set) var myView: UIView!
    @IBOutlet weak private(set) var popView: UIView!
    @IBOutlet weak private(set) var crossButton: UIButton!
    @IBOutlet weak private(set) var inviteTableView: UITableView!

    // MARK: - Properties
    var inviteEventViewModel : LMInviteEventPopupVM!
    var userNameToOffer : String?

    // MARK: - IBoutlets Actions
    @IBAction private func crossButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Life Cycle Methods
extension LMInviteEventPopupVC {
    override func initialSetup() {
        inviteEventViewModel = LMInviteEventPopupVM()
        CommonFunction.commonFunctions.setupTableviewCell(tableView: inviteTableView, nibName: StringConstant.ViewController.lmInviteEventTC)
        profilePic.layer.cornerRadius = profilePic.layer.frame.width/2
        picView.layer.cornerRadius = picView.layer.frame.width/2
        popView.layer.cornerRadius = 15
        inviteTableView.delegate = self
        inviteTableView.dataSource = self
        invitePopupClouser = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMSendInvitePopupVC.instantiate(fromAppStoryboard: .home)
            controller.nameOfferToBuy = "\(StringConstant.Home.offerToBuy) \(self.userNameToOffer ?? StringConstant.WelcomeScreen.emptyString)\(StringConstant.Home.ticket)"
            controller.eventOfferToBuy = "\(StringConstant.Home.sureInvite) \(self.userNameToOffer ?? StringConstant.WelcomeScreen.emptyString) \(StringConstant.Home.thisEvent)"
            self.present(controller, animated: true, completion: nil)
        }
        eventInviteClouser = {
            [weak self] in
            guard let `self` = self else { return }
            self.inviteEventViewModel.inviteEvent()
        }
        reloadEvents = {
            [weak self] in
            guard let `self` = self else { return }
            self.inviteTableView.reloadData()
        }
    }
}
