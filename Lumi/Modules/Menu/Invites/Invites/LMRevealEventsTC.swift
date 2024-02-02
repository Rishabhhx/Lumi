//
//  LMRevelEventsTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 18/06/22.
//

import UIKit

class LMRevealEventsTC: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak private(set) var eventView: UIView!
    @IBOutlet weak private(set) var eventName: UILabel!
    @IBOutlet weak private(set) var eventDay: UILabel!
    @IBOutlet weak private(set) var eventDate: UILabel!
    @IBOutlet weak private(set) var eventLocation: UILabel!
    @IBOutlet weak private(set) var eventImage: UIImageView!
    @IBOutlet weak private(set) var checkButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        CommonFunction.commonFunctions.viewRadius(view: eventView, radius: 3)
    }

    @IBAction private func checkButton(_ sender: Any) {
        checkButton.isSelected.toggle()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
