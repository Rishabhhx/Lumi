//
//  LMInvitesSentTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 13/06/22.
//

import UIKit

class LMInvitesSentTC: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak private(set) var cellView: UIView!
    @IBOutlet weak private(set) var profileImage: UIImageView!
    @IBOutlet weak private(set) var statusView: UIView!
    @IBOutlet weak private(set) var statusLabel: UILabel!
    @IBOutlet weak private(set) var userName: UILabel!
    @IBOutlet weak private(set) var arrowImage: UIImageView!
    @IBOutlet weak private(set) var eventLocation: UILabel!
    @IBOutlet weak private(set) var eventName: UILabel!

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
