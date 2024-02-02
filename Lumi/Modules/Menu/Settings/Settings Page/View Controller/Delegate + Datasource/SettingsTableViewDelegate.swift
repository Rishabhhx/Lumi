//
//  SettingsTableViewDelegate.swift
//  Lumi
//
//  Created by Rishabh Sharma on 07/06/22.
//

import UIKit

// MARK: - Tableview Delegate and Datasource
extension LMSettingsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = settingsTableView.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmSettingsTC, for: indexPath) as? LMSettingsTC
        else { return UITableViewCell() }
        cell.cellLabel.text = iconTextObj[indexPath.row].text
        cell.cellImage.image = iconTextObj[indexPath.row].image
        if indexPath.row == 1 {
            cell.emailLabel.text = "scdcdcdscsdc@cds.com"
            cell.verifiedImage.image = ImageAssest.icEmailNotVerified.imageAssest
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let storyboard = UIStoryboard(name: StringConstant.ViewController.menu, bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: StringConstant.ViewController.lmUpdatePhoneVC)
            as? LMContinueWithPhoneNoVC
            navigationController?.pushViewController(vc!, animated: true)
            let updateNumberStatus = StringConstant.Menu.updatePhone
            UserDefaults.standard.set(updateNumberStatus, forKey: UserDefaultVar.updateNumberStatus.rawValue)
        case 1:
            let controller = LMRecoveryMailVC.instantiate(fromAppStoryboard: .menu)
            push(vc: controller)
        case 2:
            let controller = LMMyBookingsVC.instantiate(fromAppStoryboard: .menu)
            push(vc: controller)
        case 3:
            let controller = LMTermsAndConditionVC.instantiate(fromAppStoryboard: .menu)
            push(vc: controller)
        case 4:
            let controller = LMFaqVC.instantiate(fromAppStoryboard: .menu)
            push(vc: controller)
        case 5:
            let controller = LMAboutUsVC.instantiate(fromAppStoryboard: .menu)
            push(vc: controller)
        case 6:
            let controller = LMPrivacyPolicyVC.instantiate(fromAppStoryboard: .menu)
            push(vc: controller)
        default :
            let controller = LMPrivacyPolicyVC.instantiate(fromAppStoryboard: .menu)
            push(vc: controller)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
