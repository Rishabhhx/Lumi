//
//  LMSavedCardsTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 16/05/22.
//

import UIKit

class LMSavedCardsTC: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak private(set) var cardSelectedButton: UIButton!
    @IBOutlet weak private(set) var cardName: UILabel!
    @IBOutlet weak private(set) var cardNumber: UILabel!
    public var selectedButonNo : Int?
    // MARK: - IBOutlets Actions
    @IBAction private func cardSelectedButton(_ sender: UIButton) {
        if selectedButonNo == sender.tag {
        }
        sender.isSelected.toggle()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
