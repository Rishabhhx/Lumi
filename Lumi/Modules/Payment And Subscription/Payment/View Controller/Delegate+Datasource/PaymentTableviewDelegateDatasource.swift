//
//  File.swift
//  Lumi
//
//  Created by Rishabh Sharma on 18/05/22.
//

import UIKit

// MARK: - TableView Delegates and datasource
extension LMPaymentVC: UITableViewDelegate , UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noOfSavedCards
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = savedCardsTableView.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmSavedCardsTC, for: indexPath) as? LMSavedCardsTC else { return UITableViewCell() }
        cell.selectedButonNo = indexPath.row
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
