//
//  LMBioTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 02/05/22.
//

import UIKit

class LMBioTC: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak private(set) var backView: UIView!
    @IBOutlet weak private(set) var quetionLabel: UILabel!
    @IBOutlet weak private(set) var answerLabel: UILabel!
    @IBOutlet weak private(set) var cancelButton: UIButton!
    @IBOutlet weak private(set) var addButton: UIButton!
    @IBOutlet weak private(set) var addCancleView: UIView!
    @IBOutlet weak private(set) var answerView: UIView!
    @IBOutlet weak private(set) var answerButton: UIButton!
    @IBOutlet weak private(set) var answerTextView: UITextView!

    // MARK: - IBActions
    @IBAction private func answerButton(_ sender: Any) {
        if answerView.isHidden {
            answerView.isHidden = false
        } else {
            answerView.isHidden = true
        }
        if answerButton.isHidden {
            answerButton.isHidden = false
        } else {
            answerButton.isHidden = true
        }
        if addCancleView.isHidden {
            addCancleView.isHidden = false
        } else {
            addCancleView.isHidden = true
        }
    }

    @IBAction private func addButton(_ sender: UIButton) {
        answerView.isHidden = true
        answerLabel.text = answerTextView.text
        addCancleView.isHidden = true
        bottomTextView()
        userProfileObj.userBio[sender.tag] = answerLabel.text!
    }

    @IBAction private func cancelButton(_ sender: Any) {
        answerView.isHidden = true
        addCancleView.isHidden = true
        if answerButton.isHidden {
            answerButton.isHidden = false
        } else {
            answerButton.isHidden = true
        }
    }

    private func bottomTextView() {
        answerLabel.text = answerTextView.text
        let text = answerLabel.text
        let underlineAttriString = NSMutableAttributedString(string: text ?? StringConstant.WelcomeScreen.emptyString)
        underlineAttriString.addAttribute(.foregroundColor, value: ColorAssest.cancelBorder.colorAssest, range: NSMakeRange(0,underlineAttriString.length))
        underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,underlineAttriString.length))
        answerLabel.attributedText = underlineAttriString
    }
}

// MARK: - Life Cycle Methods
extension LMBioTC {
    override func awakeFromNib() {
        super.awakeFromNib()
        answerView.isHidden = true
        addCancleView.isHidden = true
        answerTextView.delegate = self
        answerButton.backgroundColor = ColorAssest.answerButton.colorAssest
        answerButton.layer.cornerRadius = 17.5
        addButton.backgroundColor = ColorAssest.answerButton.colorAssest
        addButton.layer.cornerRadius = 17.5
        cancelButton.layer.cornerRadius = 17.5
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.borderColor = ColorAssest.cancelBorder.colorAssest.cgColor
        bottomTextView()
    }
    override func layoutSubviews() {
            super.layoutSubviews()

            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
        }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
