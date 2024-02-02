//
//  LMChatTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 20/06/22.
//

import UIKit

class LMChatTC: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak private(set) var profilePicView: UIView!
    @IBOutlet weak private(set) var noOfMsgLabel: UILabel!
    @IBOutlet weak private(set) var noOfMsgView: UIView!
    @IBOutlet weak private(set) var chatView: UIView!
    @IBOutlet weak private(set) var userMessage: UILabel!
    @IBOutlet weak private(set) var profilePic: UIImageView!
    @IBOutlet weak private(set) var userName: UILabel!

    // MARK: - Life Cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        CommonFunction.commonFunctions.viewRadius(view: chatView, radius: 3)
        CommonFunction.commonFunctions.viewRadius(view: noOfMsgView, radius: noOfMsgView.layer.frame.width/2)
        CommonFunction.commonFunctions.viewRadius(view: profilePicView, radius: profilePicView.layer.frame.width/2)
        profilePic.layer.cornerRadius = profilePic.layer.frame.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
