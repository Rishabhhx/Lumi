//
//  LMPreferenceTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 22/06/22.
//

import UIKit

class LMPreferenceTC: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak private var prefrenceTableview: UITableView!

    // MARK: - Properties
    var prefrenceObj : [CellImageText] = []
    var preference : [String] = []
    var ageBetween : String?
}

// MARK: - Life Cycle Methods
extension LMPreferenceTC {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.ageBetween = "\(myProfileObj?.ageBetween[0] ?? 0)-\(myProfileObj?.ageBetween[1] ?? 0)"
        preference.append(myProfileObj?.interestedIn ?? StringConstant.WelcomeScreen.emptyString)
        preference.append(ageBetween ?? StringConstant.WelcomeScreen.emptyString)
        preference.append(myProfileObj?.religiousBelief ?? StringConstant.WelcomeScreen.emptyString)
        preference.append(myProfileObj?.politicalLeaning ?? StringConstant.WelcomeScreen.emptyString)
        preference.append(myProfileObj?.haveCigarette ?? StringConstant.WelcomeScreen.emptyString)
        preference.append(myProfileObj?.haveAlcohol ?? StringConstant.WelcomeScreen.emptyString)
        preference.append(myProfileObj?.haveMarijuana ?? StringConstant.WelcomeScreen.emptyString)
        preference.append(myProfileObj?.haveDrugs ?? StringConstant.WelcomeScreen.emptyString)
        prefrenceObj.append(CellImageText(image: ImageAssest.icProfileInterestedIn.imageAssest, text: StringConstant.Menu.intrestedin))
        prefrenceObj.append(CellImageText(image: ImageAssest.icProfileAge.imageAssest, text: StringConstant.Menu.age))
        prefrenceObj.append(CellImageText(image: ImageAssest.icProfileReligious.imageAssest, text: StringConstant.Menu.religiousBelief))
        prefrenceObj.append(CellImageText(image: ImageAssest.icProfilePolitical.imageAssest, text: StringConstant.Menu.politicalLeaning))
        prefrenceObj.append(CellImageText(image: ImageAssest.icProfileCigarette.imageAssest, text: StringConstant.Menu.cigarette))
        prefrenceObj.append(CellImageText(image: ImageAssest.icProfileAlcohol.imageAssest, text: StringConstant.Menu.alcohol))
        prefrenceObj.append(CellImageText(image: ImageAssest.icProfileMarijuana.imageAssest, text: StringConstant.Menu.marijuana))
        prefrenceObj.append(CellImageText(image: ImageAssest.icProfileDrugs.imageAssest, text: StringConstant.Menu.drugs))
        prefrenceTableview.dataSource = self
        prefrenceTableview.delegate = self
        CommonFunction.commonFunctions.setupTableviewCell(tableView: prefrenceTableview, nibName: StringConstant.ViewController.lmMyProfileCellTC)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - Tableview Delegate
extension LMPreferenceTC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = prefrenceTableview.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmMyProfileCellTC, for: indexPath) as? LMMyProfileCellTC else { return UITableViewCell() }
        cell.cellImage.image = prefrenceObj[indexPath.row].image
        cell.cellQuestionLabel.text = prefrenceObj[indexPath.row].text
        cell.cellAnswerLabel.text = preference[indexPath.row]
        if indexPath.row == 7 {
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
            pushViewControllerIntrestIn?()
        case 1:
            pushViewControllerIntrestAge?()
        case 2:
            pushViewControllerReligious?()
        case 3:
            pushViewControllerPolotical?()
        case 4:
            pushViewControllerCigarettes?()
        case 5:
            pushViewControllerAlcohol?()
        case 6:
            pushViewControllerMarijuana?()
        case 7:
            pushViewControllerDrugs?()
        default:
            pushViewControllerGender?()
        }
    }
}
