//
//  LMMyBioQuesTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 22/06/22.
//

import UIKit

class LMMyBioQuesTC: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak private(set) var cellAnswer: UILabel!
    @IBOutlet weak private(set) var cellQuestion: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
