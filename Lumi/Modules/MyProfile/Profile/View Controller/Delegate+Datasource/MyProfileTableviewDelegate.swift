//
//  MyProfileTableviewDelegate.swift
//  Lumi
//
//  Created by Rishabh Sharma on 09/07/22.
//

import UIKit

// MARK: - Tableview Delegate
extension LMMyProfileVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = myProflileTableview.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmNamePhotosTC, for: indexPath) as? LMNamePhotosTC else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = myProflileTableview.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmBasicInfoTC, for: indexPath) as? LMBasicInfoTC else { return UITableViewCell() }
            return cell
        case 2:
            guard let cell = myProflileTableview.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmMyBioTC, for: indexPath) as? LMMyBioTC else { return UITableViewCell() }
            return cell
        case 3:
            guard let cell = myProflileTableview.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmWorkEducationTC, for: indexPath) as? LMWorkEducationTC else { return UITableViewCell() }
            return cell
        case 4:
            guard let cell = myProflileTableview.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmPreferenceTC, for: indexPath) as? LMPreferenceTC else { return UITableViewCell() }
            return cell
        default:
            guard let cell = myProflileTableview.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmNamePhotosTC, for: indexPath) as? LMNamePhotosTC else { return UITableViewCell() }
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 20))
            headerView.backgroundColor = ColorAssest.topBar.colorAssest
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
            label.font = UIFont(name: StringConstant.WelcomeScreen.font, size: 15)!
            label.text = StringConstant.Menu.basicInfo
            label.textColor = ColorAssest.cloudBlue.colorAssest
            headerView.addSubview(label)
            return headerView
        } else if section == 2 {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 20))
            headerView.backgroundColor = ColorAssest.topBar.colorAssest
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
            label.font = UIFont(name: StringConstant.WelcomeScreen.font, size: 15)!
            label.text = StringConstant.Menu.bio
            label.textColor = ColorAssest.cloudBlue.colorAssest
            headerView.addSubview(label)
            return headerView
        } else if section == 3 {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 20))
            headerView.backgroundColor = ColorAssest.topBar.colorAssest
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
            label.font = UIFont(name: StringConstant.WelcomeScreen.font, size: 15)!
            label.text = StringConstant.Menu.workEducation
            label.textColor = ColorAssest.cloudBlue.colorAssest
            headerView.addSubview(label)
            return headerView
        } else if section == 4 {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 20))
            headerView.backgroundColor = ColorAssest.topBar.colorAssest
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
            label.font = UIFont(name: StringConstant.WelcomeScreen.font, size: 15)!
            label.text = StringConstant.Menu.preference
            label.textColor = ColorAssest.cloudBlue.colorAssest
            headerView.addSubview(label)
            return headerView
        } else {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 0))
            return headerView
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return UITableView.automaticDimension
        case 1:
            return CGFloat(60 * (3))
        case 2:
            return CGFloat(140 * (4))
        case 3:
            return CGFloat(60 * (2))
        case 4:
            return CGFloat(60 * (8))
        default:
            return 0
        }
    }
}
