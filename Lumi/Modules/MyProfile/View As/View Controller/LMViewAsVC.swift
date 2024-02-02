//
//  LMMaybeMatchesVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 19/05/22.
//

import UIKit

class LMViewAsVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var matchesTableview: UITableView!

    // MARK: - IBOutelet Action
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }
}

// MARK: - Life Cycle Methods
extension LMViewAsVC {

    override func initialSetup() {
        reloadMatches = {
            [weak self] in
            guard let `self` = self else { return }
            self.matchesTableview.reloadData()
        }
        CommonFunction.commonFunctions.setupTableviewCell(tableView: matchesTableview, nibName:  StringConstant.ViewController.lmViewAsTC)
        matchesTableview.delegate = self
        matchesTableview.dataSource = self
    }
}
