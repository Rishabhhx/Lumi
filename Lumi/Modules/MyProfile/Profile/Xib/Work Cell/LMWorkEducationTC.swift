//
//  LMWorkEducationTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 22/06/22.
//

import UIKit
class LMWorkEducationTC: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak private var prefrenceTableview: UITableView!

    // MARK: - Properties
    var workEducationObj : [CellImageText] = []
    var workEducation : [String] = []
}

// MARK: - Private Functions
extension LMWorkEducationTC {

    override func awakeFromNib() {
        super.awakeFromNib()
        workEducation.append(myProfileObj?.jobTitle ?? StringConstant.WelcomeScreen.emptyString)
        workEducation.append(myProfileObj?.eduLevel ?? StringConstant.WelcomeScreen.emptyString)
        prefrenceTableview.dataSource = self
        prefrenceTableview.delegate = self
        CommonFunction.commonFunctions.setupTableviewCell(tableView: prefrenceTableview, nibName: StringConstant.ViewController.lmMyProfileCellTC)
        workEducationObj.append(CellImageText(image: ImageAssest.icProfileWork.imageAssest, text: StringConstant.Menu.work))
        workEducationObj.append(CellImageText(image: ImageAssest.icProfileEducation.imageAssest, text: StringConstant.Menu.education))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - Tableview Delegate
extension LMWorkEducationTC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = prefrenceTableview.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmMyProfileCellTC, for: indexPath) as? LMMyProfileCellTC else { return UITableViewCell() }
        cell.cellImage.image = workEducationObj[indexPath.row].image
        cell.cellQuestionLabel.text = workEducationObj[indexPath.row].text
        cell.cellAnswerLabel.text = workEducation[indexPath.row]
        if indexPath.row == 1 {
            cell.lineView.backgroundColor = .clear
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            pushViewControllerWork?()
        case 1:
            pushViewControllerEducation?()
        default:
            pushViewControllerGender?()
        }
    }
}
