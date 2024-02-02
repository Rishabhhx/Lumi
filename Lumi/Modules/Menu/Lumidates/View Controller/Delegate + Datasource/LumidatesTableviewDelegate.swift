//
//  MaybeMatchesTableviewDelegate.swift
//  Lumi
//
//  Created by Rishabh Sharma on 02/06/22.
//

import UIKit
var blockTagClouser : (() -> Int)?
var changeLabelText : (() -> Void)?

// MARK: - Tableview Delegate and datasource
extension LMLumidatesVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allLumidatesObj.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = matchesTableview.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmLumidatesTC, for: indexPath) as? LMLumidatesTC else { return UITableViewCell() }
        cell.lumiUsersName.text = allLumidatesObj[indexPath.row].invitedTo.name
        cell.lumiUserAge.text = String(CommonFunction.commonFunctions.calcAge(birthday: allLumidatesObj[indexPath.row].invitedTo.dob))
        cell.lumiUserLocation.text = allLumidatesObj[indexPath.row].invitedTo.homeTown
        cell.eventNameLabel.text = allLumidatesObj[indexPath.row].eventID.eventName
        cell.tableRowData.insert(allLumidatesObj[indexPath.row], at: 0)
        cell.reportButton.tag = indexPath.row
        cell.reportButton.addTarget(self, action: #selector(reportAction(_:)), for: .touchUpInside)
        changeLabelText = {
            cell.lumiUsersName.text = allLumidatesObj[indexPath.row].eventID.eventName
            cell.lumiUserLocation.text = allLumidatesObj[indexPath.row].eventID.eventLocation
            cell.lumiUserAge.text = String(CommonFunction.commonFunctions.dateGeneral(tdate: allLumidatesObj[indexPath.row].eventID.eventDate))
            self.matchesTableview.reloadData()
        }
        cell.selectedCellNo = indexPath.row
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = LMLumidateSelectedVC.instantiate(fromAppStoryboard: .menu)
        self.push(vc: controller)
        controller.selectedUserId = allLumidatesObj[indexPath.row].invitedTo.id
    }

    @objc private func reportAction(_ sender: UIButton) {
        print(sender.tag)
        reportTagClouser = {
            return sender.tag
        }
        let controller = LMReportPopupVC.instantiate(fromAppStoryboard: .home)
        controller.viewDismissDelegate = self
        self.present(controller, animated: true, completion: nil)
    }
}
