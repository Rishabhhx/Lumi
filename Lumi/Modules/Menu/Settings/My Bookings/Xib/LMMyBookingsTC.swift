//
//  LMMyBookingsTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 09/06/22.
//

import UIKit

class LMMyBookingsTC: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak private(set) var cellView: UIView!
    @IBOutlet weak private(set) var eventPrice: UILabel!
    @IBOutlet weak private(set) var eventLocation: UILabel!
    @IBOutlet weak private(set) var eventName: UILabel!
    @IBOutlet weak private(set) var eventDate: UILabel!
    @IBOutlet weak private(set) var eventTime: UILabel!
    @IBOutlet weak private(set) var eventDay: UILabel!
    @IBOutlet weak private(set) var eventImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        CommonFunction.commonFunctions.viewRadius(view: cellView, radius: 3)
        eventImage.layer.cornerRadius = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
