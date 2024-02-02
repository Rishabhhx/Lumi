//
//  InviteSentTableviewDelegate.swift
//  Lumi
//
//  Created by Rishabh Sharma on 16/06/22.
//

import UIKit

// MARK: - Tableview Delegate
extension LMInvitesSentVC : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSentInvites.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = inviteSentTableview.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmInvitesSentTC, for: indexPath) as? LMInvitesSentTC else {
            return UITableViewCell()
        }
        cell.eventName.text = allSentInvites[indexPath.row].eventID.eventName
        cell.eventLocation.text = allSentInvites[indexPath.row].eventID.eventLocation
        cell.userName.text = allSentInvites[indexPath.row].invitedTo.name
        cell.statusLabel.text = allSentInvites[indexPath.row].inviteStatus
        cell.profileImage.downloadImageFrom(link: allSentInvites[indexPath.row].invitedTo.profilePicture[0], contentMode: .scaleAspectFill)
        let status = allSentInvites[indexPath.row].inviteStatus
        cell.statusLabel.text = status.capitalized
        if allSentInvites[indexPath.row].inviteStatus == StringConstant.Menu.pending {
            cell.statusView.layer.backgroundColor = ColorAssest.pending.colorAssest.cgColor
            cell.statusLabel.textColor = ColorAssest.pendingText.colorAssest
            cell.arrowImage.isHidden = true
        } else if allSentInvites[indexPath.row].isOfferingTicket == false {
            cell.statusView.layer.backgroundColor = ColorAssest.myEvents.colorAssest.cgColor
            cell.statusLabel.text = StringConstant.Menu.buyTicket
        } else {
            cell.statusView.layer.backgroundColor = ColorAssest.lightDarkBlue.colorAssest.cgColor
            cell.statusLabel.text = StringConstant.Menu.bookingsRevealed
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if allSentInvites[indexPath.row].inviteStatus == StringConstant.Menu.bookingsRevealed {
            let controller = LMBookingDetailsVC.instantiate(fromAppStoryboard: .menu)
            self.push(vc: controller)
            controller.selectedUser = indexPath.row
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
