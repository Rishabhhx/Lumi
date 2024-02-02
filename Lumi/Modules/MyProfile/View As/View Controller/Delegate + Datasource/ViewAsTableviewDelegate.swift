//
//  ViewAsTableviewDelegate.swift
//  Lumi
//
//  Created by Rishabh Sharma on 30/06/22.
//

import UIKit

// MARK: - Tableview delegate and data source
extension LMViewAsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = matchesTableview.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmViewAsTC, for: indexPath) as? LMViewAsTC else { return UITableViewCell() }
        cell.lumiUsersName.text = myProfileObj?.name
        cell.lumiUserAge.text = String(CommonFunction.commonFunctions.calcAge(birthday: myProfileObj?.dob ?? StringConstant.WelcomeScreen.emptyString))
        cell.lumiUserLocation.text = myProfileObj?.homeTown
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
