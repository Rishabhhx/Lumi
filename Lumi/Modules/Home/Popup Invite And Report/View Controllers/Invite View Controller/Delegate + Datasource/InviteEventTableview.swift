//
//  InviteEventTableview.swift
//  Lumi
//
//  Created by Rishabh Sharma on 29/05/22.
//

import UIKit

// MARK: - Tableview Delegate and Datasource
extension LMInviteEventPopupVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myeventsObj.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = inviteTableView.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmInviteEventTC, for: indexPath) as? LMInviteEventTC else { return UITableViewCell() }
        cell.eventName.text = myeventsObj[indexPath.row].eventData?[0].eventName
        cell.eventLocation.text = myeventsObj[indexPath.row].eventData?[0].eventLocation
        cell.eventDate.text = CommonFunction.commonFunctions.dateGeneral2(tdate: myeventsObj[indexPath.row].eventData?[0].eventDate ?? "")
        let weekday = CommonFunction.commonFunctions.getDayOfWeek(myeventsObj[indexPath.row].eventData?[0].eventDate ?? "")
        cell.eventDay.text = String(weekday?.prefix(3) ?? "").uppercased()
        cell.eventPrice.text = "$\(myeventsObj[indexPath.row].eventData?[0].price ?? 5 )"
        cell.inviteButton.addTarget(self, action: #selector(inviteAction(_:)), for: .touchUpInside)
        cell.eventImage.downloadImageFrom(link: myeventsObj[indexPath.row].eventData?[0].eventImages[0] ?? "", contentMode: .scaleAspectFill)
        cell.inviteButton.tag = indexPath.row
        return cell
    }
    @objc private func inviteAction(_ sender: UIButton) {
        print(sender.tag)
        userEventId = myeventsObj[sender.tag].id
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
