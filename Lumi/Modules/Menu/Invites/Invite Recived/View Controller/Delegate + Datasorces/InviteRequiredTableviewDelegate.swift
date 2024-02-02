//
//  InviteRequiredTableviewDelegate.swift
//  Lumi
//
//  Created by Rishabh Sharma on 16/06/22.
//

import UIKit

// MARK: - Tableview Delegate
extension LMInvitesReceivedVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allRecivedInvites.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = inviteRecivedTableview.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmInvitesReceivedTC, for: indexPath) as? LMInvitesReceivedTC else {
            return UITableViewCell()
        }
        cell.eventName.text = allRecivedInvites[indexPath.row].eventID.eventName
        cell.eventLocation.text = allRecivedInvites[indexPath.row].eventID.eventLocation
        cell.userName.text = allRecivedInvites[indexPath.row].invitedBy.name
//        cell.profileImage.downloadImageFrom(link: allRecivedInvites[indexPath.row].invitedBy.profilePicture[0], contentMode: .scaleAspectFill)
        if allRecivedInvites[indexPath.row].inviteStatus == StringConstant.Menu.pending {
            cell.arrowImage.isHidden = true
            cell.choiceView.isHidden = false
        } else if allRecivedInvites[indexPath.row].inviteStatus == "ACCEPTED" && allRecivedInvites[indexPath.row].isOfferingTicket == true {
            cell.statusView.layer.backgroundColor = ColorAssest.lightDarkBlue.colorAssest.cgColor
            cell.statusLabel.text = StringConstant.Menu.unreveal
            cell.choiceView.isHidden = true
            cell.arrowImage.isHidden = false
        } else if allRecivedInvites[indexPath.row].inviteStatus == "ACCEPTED" && allRecivedInvites[indexPath.row].isOfferingTicket == false {
            cell.choiceView.isHidden = true
            cell.arrowImage.isHidden = false
            cell.statusView.layer.backgroundColor = ColorAssest.myEvents.colorAssest.cgColor
            cell.statusLabel.text = StringConstant.Menu.buyTicket
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRecivedIdlousere = {
            return indexPath.row
        }
        if allRecivedInvites[indexPath.row].inviteStatus == "ACCEPTED" && allRecivedInvites[indexPath.row].isOfferingTicket == false {
            let controller = LMBookingDetailsVC.instantiate(fromAppStoryboard: .menu)
            self.push(vc: controller)
            controller.selectedUser = indexPath.row
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
