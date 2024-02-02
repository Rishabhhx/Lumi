//
//  LMSettingsTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 06/06/22.
//

import UIKit

class LMSettingsTC: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak private(set) var verifiedImage: UIImageView!
    @IBOutlet weak private(set) var emailLabel: UILabel!
    @IBOutlet weak private(set) var cellImage: UIImageView!
    @IBOutlet weak private(set) var cellLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
