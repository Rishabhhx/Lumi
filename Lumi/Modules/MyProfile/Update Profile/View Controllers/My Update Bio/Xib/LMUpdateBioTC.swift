//
//  LMUpdateBioTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 04/07/22.
//

import UIKit

class LMUpdateBioTC: UITableViewCell, UITextViewDelegate {

    // MARK: - Outlets
    @IBOutlet weak private(set) var backView: UIView!
    @IBOutlet weak private(set) var quetionLabel: UILabel!
    @IBOutlet weak private(set) var answerLabel: UILabel!
    @IBOutlet weak private(set) var cancelButton: UIButton!
    @IBOutlet weak private(set) var addButton: UIButton!
    @IBOutlet weak private(set) var addCancleView: UIView!
    @IBOutlet weak private(set) var answerButton: UIButton!
    @IBOutlet weak private(set) var answerTextView: UITextView!
    @IBOutlet weak private(set) var answerView: UIView!

    // MARK: - IBActions
    @IBAction private func answerButton(_ sender: Any) {
        reloadTableView?()
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
        reloadTableView?()
        answerLabel.isHidden = false
        answerView.isHidden = true
        answerLabel.text = answerTextView.text
        addCancleView.isHidden = true
        bottomTextView()
        userProfileObj.userBio[sender.tag] = answerLabel.text!
    }

    @IBAction private func cancelButton(_ sender: Any) {
        reloadTableView?()
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
        underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,underlineAttriString.length))
        answerLabel.attributedText = underlineAttriString
    }
}

// MARK: - Life Cycle Methods
extension LMUpdateBioTC {
    override func awakeFromNib() {
        super.awakeFromNib()
        answerView.isHidden = true
        answerLabel.isHidden = true
        addCancleView.isHidden = true
        answerTextView.delegate = self
        answerButton.layer.cornerRadius = 17.5
        addButton.layer.cornerRadius = 17.5
        cancelButton.layer.cornerRadius = 17.5
        bottomTextView()
    }
    override func layoutSubviews() {
            super.layoutSubviews()

            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
        }
//    override func prepareForReuse() {
//        answerView.isHidden = true
//        answerLabel.isHidden = true
//        addCancleView.isHidden = true
//    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
