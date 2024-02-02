//
//  MaybeMatchesTableviewDelegate.swift
//  Lumi
//
//  Created by Rishabh Sharma on 25/05/22.
//

import UIKit
var reportTagClouser : (() -> Int)?

// MARK: - Tableview Delegate and datasource
extension LMMaybeMatchesVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allLumiUserObj.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = matchesTableview.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmMaybeMatchesTC, for: indexPath) as? LMMaybeMatchesTC else { return UITableViewCell() }
        cell.lumiUsersName.text = allLumiUserObj[indexPath.row].name
        cell.lumiUserAge.text = String(CommonFunction.commonFunctions.calcAge(birthday: allLumiUserObj[indexPath.row].dob))
        cell.lumiUserLocation.text = allLumiUserObj[indexPath.row].homeTown
        cell.tableRowData.insert(allLumiUserObj[indexPath.row], at: 0)
        cell.inviteButton.addTarget(self, action: #selector(inviteAction(_:)), for: .touchUpInside)
        cell.inviteButton.tag = indexPath.row
        cell.reportButton.tag = indexPath.row
        cell.reportButton.addTarget(self, action: #selector(reportAction(_:)), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = LMMatchSelectedVC.instantiate(fromAppStoryboard: .home)
        self.push(vc: controller)
        controller.selectedUserId = allLumiUserObj[indexPath.row].id
    }
    @objc private func inviteAction(_ sender: UIButton) {
        print(sender.tag)
        maybeMatchesViewModelObj.myEventsDetailsCall()
        let controller = LMInviteEventPopupVC.instantiate(fromAppStoryboard: .home)
        self.present(controller, animated: true, completion: nil)
        controller.inviteUserLabel.text =  "\(StringConstant.Home.invite) \(allLumiUserObj[sender.tag].name) \(StringConstant.Home.toanEvent)"
        controller.userNameToOffer = allLumiUserObj[sender.tag].name
        controller.profilePic.downloadImageFrom(link: allLumiUserObj[sender.tag].profilePicture[0] , contentMode: .scaleAspectFill)
        userId = allLumiUserObj[sender.tag].id
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
