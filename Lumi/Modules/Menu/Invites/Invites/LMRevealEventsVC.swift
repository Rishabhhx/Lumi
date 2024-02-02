//
//  LMRevelEventsVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 18/06/22.
//

import UIKit
var reloadEventTableView : (() -> Void)?
class LMRevealEventsVC: LMBaseVC {

    @IBOutlet weak private(set) var popView: UIView!
    @IBOutlet weak private(set) var crossButton: UIButton!
    @IBOutlet weak private(set) var revealEventTableview: UITableView!

    // MARK: - Properties
    var revealEventsViewModelObj : LMRevealEventsVM!
    // MARK: - IBoutlets Actions
    @IBAction private func crossButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func initialSetup() {
        revealEventsViewModelObj = LMRevealEventsVM()
        revealEventsViewModelObj.myEventsDetailsCall()
        CommonFunction.commonFunctions.setupTableviewCell(tableView: revealEventTableview, nibName: StringConstant.ViewController.lmRevealEventsTC)
        reloadEventTableView = {
            [weak self] in
            guard let `self` = self else { return }
            self.revealEventTableview.reloadData()
        }
        CommonFunction.commonFunctions.viewRadius(view: popView, radius: 15)
    }
}
extension LMRevealEventsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myeventsObj.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = revealEventTableview.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmRevealEventsTC, for: indexPath) as? LMRevealEventsTC else {
            return UITableViewCell() }
        cell.eventName.text = myeventsObj[indexPath.row].eventData?[0].eventName
        cell.eventLocation.text = myeventsObj[indexPath.row].eventData?[0].eventLocation
        cell.eventDate.text = CommonFunction.commonFunctions.dateGeneral2(tdate: myeventsObj[indexPath.row].eventData?[0].eventDate ?? "")
        let weekday = CommonFunction.commonFunctions.getDayOfWeek(myeventsObj[indexPath.row].eventData?[0].eventDate ?? "")
        cell.eventDay.text = String(weekday?.prefix(3) ?? "").uppercased()
        cell.eventImage.downloadImageFrom(link: myeventsObj[indexPath.row].eventData?[0].eventImages[0] ?? "", contentMode: .scaleAspectFill)
        return cell
    }
}
