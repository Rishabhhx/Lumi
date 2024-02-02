//
//  LMInviteEventTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 25/05/22.
//

import UIKit
var invitePopupClouser : (() -> Void)?
var eventInviteClouser : (() -> Void)?

class LMInviteEventTC: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak private(set) var eventName: UILabel!
    @IBOutlet weak private(set) var eventPrice: UILabel!
    @IBOutlet weak private(set) var eventDay: UILabel!
    @IBOutlet weak private(set) var eventDate: UILabel!
    @IBOutlet weak private(set) var eventLocation: UILabel!
    @IBOutlet weak private(set) var eventImage: UIImageView!
    @IBOutlet weak private(set) var inviteButton: UIButton!

    // MARK: - Iboutlets Actions
    @IBAction private func inviteButton(_ sender: Any) {
        invitePopupClouser?()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: inviteButton, color: ColorAssest.answerButton.colorAssest, radius: 17.5)
        sentClouser = {
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: self.inviteButton, color: ColorAssest.answerButton4.colorAssest, radius: 17.5)
            self.inviteButton.setTitle(StringConstant.sent.rawValue, for: .normal)
            self.layoutIfNeeded()
        }
    }
}
