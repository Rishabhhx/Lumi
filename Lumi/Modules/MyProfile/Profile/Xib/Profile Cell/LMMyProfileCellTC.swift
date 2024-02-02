//
//  LMMyProfileCellTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 22/06/22.
//

import UIKit

class LMMyProfileCellTC: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak private(set) var lineView: UIView!
    @IBOutlet weak private(set) var cellAnswerLabel: UILabel!
    @IBOutlet weak private(set) var cellQuestionLabel: UILabel!
    @IBOutlet weak private(set) var cellImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
