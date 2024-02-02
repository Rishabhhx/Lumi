//
//  LMCountryCodeTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 06/04/22.
//

import UIKit

class LMCountryCodeTC: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak private(set) var countryCode: UILabel!
    @IBOutlet weak private(set) var countryFlag: UIImageView!
    @IBOutlet weak private(set) var countryName: UILabel!

    // MARK: - Life Cycle Functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
