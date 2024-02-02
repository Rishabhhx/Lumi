//
//  BookingTableviewDelegate.swift
//  Lumi
//
//  Created by Rishabh Sharma on 16/06/22.
//

import UIKit

// MARK: - Tableview Delegate
extension LMMyBookingsVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allBookingEventsObj.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myBookingsTableView.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmMyBookingsTC, for: indexPath) as? LMMyBookingsTC else {
            return UITableViewCell()
        }
        cell.eventName.text = allBookingEventsObj[indexPath.row].eventID.eventName
        cell.eventLocation.text = allBookingEventsObj[indexPath.row].eventID.eventLocation
        let date = CommonFunction.commonFunctions.dateGeneral(tdate: allBookingEventsObj[indexPath.row].eventID.eventDate)
        let result = date.split { $0 == " " }
        cell.eventDate.text = String(result[0]) + " " + String(result[1].uppercased())
        cell.eventTime.text = String(result[3]) + " " + String(result[4])
        let weekday = CommonFunction.commonFunctions.getDayOfWeek(allBookingEventsObj[indexPath.row].eventID.eventDate)
        cell.eventDay.text = String(weekday ?? StringConstant.WelcomeScreen.emptyString)
        cell.eventImage.downloadImageFrom(link: allBookingEventsObj[indexPath.row].eventID.eventImages[0], contentMode: .scaleAspectFill)
        cell.eventPrice.text = String("$\(allBookingEventsObj[indexPath.row].eventID.price)+")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = LMBookingDetailsVC.instantiate(fromAppStoryboard: .menu)
        self.push(vc: controller)
        controller.selectedUser = indexPath.row
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
