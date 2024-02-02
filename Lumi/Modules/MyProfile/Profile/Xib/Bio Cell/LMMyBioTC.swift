//
//  LMMyBioTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 22/06/22.
//

import UIKit

var bioInfo : (() -> Void)?
var reloadBio : (() -> Void)?

class LMMyBioTC: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak private var questionAnswerTableview: UITableView!

    // MARK: - Properties
    let numberOfQUestions: Int = myProfileObj?.bio.count ?? 0
    var bio : [String] = []
}

// MARK: - Private Functions
extension LMMyBioTC {

    @objc func buttonTapped() {

    }
}

// MARK: - Life Cycle Methods
extension LMMyBioTC {

    override func awakeFromNib() {
        super.awakeFromNib()
        bioInfo = {
            [weak self] in
            guard let `self` = self else { return }
            self.questionAnswerTableview.delegate = self
            self.questionAnswerTableview.dataSource = self
            CommonFunction.commonFunctions.setupTableviewCell(tableView: self.questionAnswerTableview, nibName: StringConstant.ViewController.lmMyBioQuesTC)
            CommonFunction.commonFunctions.setupTableviewCell(tableView: self.questionAnswerTableview, nibName: StringConstant.ViewController.footerCell)
        }
        self.bio.append(StringConstant.Profile.quo1)
        self.bio.append(StringConstant.Profile.quo2)
        self.bio.append(StringConstant.Profile.quo3)
        self.bio.append(StringConstant.Profile.quo4)
        reloadBio = {
            [weak self] in
            guard let `self` = self else { return }
            self.questionAnswerTableview.reloadData()
        }
    }
}

// MARK: - Tableview Delegate
extension LMMyBioTC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if numberOfQUestions >= 4 {
            return numberOfQUestions
        } else {
            return numberOfQUestions + 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == numberOfQUestions {
            guard let cell = questionAnswerTableview.dequeueReusableCell(withIdentifier: StringConstant.ViewController.footerCell, for: indexPath) as? FooterCell else { return UITableViewCell() }
            return cell
        }
        guard let cell = questionAnswerTableview.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmMyBioQuesTC, for: indexPath) as? LMMyBioQuesTC else { return UITableViewCell() }
        cell.cellQuestion.text = bio[indexPath.row]
        cell.cellAnswer.text = myProfileObj?.bio[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        pushViewControllerBio?()
        tableView.endUpdates()
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
