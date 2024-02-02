//
//  UpdateBioTableview.swift
//  Lumi
//
//  Created by Rishabh Sharma on 09/07/22.
//

import UIKit

// MARK: - Tableview Delegate
extension LMUpdateBioVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = bioTableview.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmUpdateBioTC, for: indexPath) as? LMUpdateBioTC else { return UITableViewCell() }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
