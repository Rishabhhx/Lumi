//
//  File.swift
//  Lumi
//
//  Created by Rishabh Sharma on 10/05/22.
//

import Foundation
import UIKit

// MARK: - Tableview delegates
extension LMUserBioVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bioTableView.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmBioTC, for: indexPath) as? LMBioTC
        cell?.addButton.tag = indexPath.row
        switch indexPath.row {
        case 0 :
            cell?.backView.layer.backgroundColor = ColorAssest.backView.colorAssest.cgColor
            cell?.answerButton.layer.backgroundColor = ColorAssest.answerButton.colorAssest.cgColor
            cell?.quetionLabel.text = StringConstant.Profile.quo1
            cell?.addButton.layer.backgroundColor = ColorAssest.answerButton.colorAssest.cgColor
        case 1 :
            cell?.backView.layer.backgroundColor = ColorAssest.backView2.colorAssest.cgColor
            cell?.answerButton.layer.backgroundColor = ColorAssest.answerButton2.colorAssest.cgColor
            cell?.quetionLabel.text = StringConstant.Profile.quo2
            cell?.addButton.layer.backgroundColor = ColorAssest.answerButton2.colorAssest.cgColor
        case 2 :
            cell?.backView.layer.backgroundColor = ColorAssest.backView3.colorAssest.cgColor
            cell?.answerButton.layer.backgroundColor = ColorAssest.answerButton3.colorAssest.cgColor
            cell?.quetionLabel.text = StringConstant.Profile.quo3
            cell?.addButton.layer.backgroundColor = ColorAssest.answerButton3.colorAssest.cgColor
        case 3 :
            cell?.backView.layer.backgroundColor = ColorAssest.backView4.colorAssest.cgColor
            cell?.answerButton.layer.backgroundColor = ColorAssest.answerButton4.colorAssest.cgColor
            cell?.quetionLabel.text = StringConstant.Profile.quo4
            cell?.addButton.layer.backgroundColor = ColorAssest.answerButton4.colorAssest.cgColor
        default:
            cell?.backView.layer.backgroundColor = ColorAssest.redButton.colorAssest.cgColor
            cell?.answerButton.layer.backgroundColor = ColorAssest.answerButton.colorAssest.cgColor
            cell?.quetionLabel.text = StringConstant.Profile.quo1
            cell?.addButton.layer.backgroundColor = ColorAssest.answerButton.colorAssest.cgColor
        }
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
