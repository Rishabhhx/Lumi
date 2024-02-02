//
//  LMInvitesSentTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 13/06/22.
//

import UIKit

class LMInvitesReceivedTC: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak private(set) var choiceView: UIView!
    @IBOutlet weak private(set) var cellView: UIView!
    @IBOutlet weak private(set) var profileImage: UIImageView!
    @IBOutlet weak private(set) var statusView: UIView!
    @IBOutlet weak private(set) var statusLabel: UILabel!
    @IBOutlet weak private(set) var userName: UILabel!
    @IBOutlet weak private(set) var arrowImage: UIImageView!
    @IBOutlet weak private(set) var eventLocation: UILabel!
    @IBOutlet weak private(set) var eventName: UILabel!

    // MARK: - IBOutlets Actions
    @IBAction private func acceptButton(_ sender: Any) {
        acceptInvite?()
        choiceView.isHidden = true
    }

    @IBAction private func revelButton(_ sender: Any) {
        showEvents?()
    }

    @IBAction private func rejectButton(_ sender: Any) {
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        CommonFunction.commonFunctions.viewRadius(view: cellView, radius: 3)
        profileImage.layer.cornerRadius = profileImage.frame.width/2
        CommonFunction.commonFunctions.viewRadius(view: statusView, radius: 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
