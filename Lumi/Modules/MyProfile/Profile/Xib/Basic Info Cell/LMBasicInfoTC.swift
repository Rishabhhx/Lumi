//
//  LMBasicInfoTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 22/06/22.
//

import UIKit

var basicInfoMyProfile : (() -> Void)?
var reloadPrefrence : (() -> Void)?

class LMBasicInfoTC: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak private var prefrenceTableview: UITableView!

    // MARK: - Properties
    var basicInfoObj : [CellImageText] = []
    var basicInfo : [String] = []
    var height : String?
}

// MARK: - Life Cycle Methods
extension LMBasicInfoTC {

    override func awakeFromNib() {
        super.awakeFromNib()
        basicInfoMyProfile = {
            [weak self] in
            guard let `self` = self else { return }
            self.height = "\(myProfileObj?.height[0] ?? 0),\(myProfileObj?.height[1] ?? 0)"
            self.basicInfo.append(myProfileObj?.gender ?? "")
            self.basicInfo.append("Cancer")
            self.basicInfo.append(self.height ?? StringConstant.WelcomeScreen.emptyString)
            self.prefrenceTableview.dataSource = self
            self.prefrenceTableview.delegate = self
            CommonFunction.commonFunctions.setupTableviewCell(tableView: self.prefrenceTableview, nibName: StringConstant.ViewController.lmMyProfileCellTC)
            self.prefrenceTableview.reloadData()
        }
        reloadPrefrence = {
            [weak self] in
            guard let `self` = self else { return }
            self.prefrenceTableview.reloadData()
        }
        basicInfoObj.append(CellImageText(image: ImageAssest.icProfileGender.imageAssest, text: StringConstant.Menu.gender))
        basicInfoObj.append(CellImageText(image: ImageAssest.icProfileZodiac.imageAssest, text: StringConstant.Menu.zodiac))
        basicInfoObj.append(CellImageText(image: ImageAssest.icProfileHeight.imageAssest, text: StringConstant.Menu.height))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - Tableview Delegate
extension LMBasicInfoTC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = prefrenceTableview.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmMyProfileCellTC, for: indexPath) as? LMMyProfileCellTC else { return UITableViewCell() }
        cell.cellImage.image = self.basicInfoObj[indexPath.row].image
        cell.cellQuestionLabel.text = self.basicInfoObj[indexPath.row].text
        cell.cellAnswerLabel.text = self.basicInfo[indexPath.row]
        if indexPath.row == 2 {
            cell.lineView.backgroundColor = .clear
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            pushViewControllerGender?()
        case 2:
            pushViewControllerHeight?()
        default:
            pushViewControllerGender?()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
