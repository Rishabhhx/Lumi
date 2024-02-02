//
//  LMUpdateBio.swift
//  Lumi
//
//  Created by Rishabh Sharma on 04/07/22.
//

import UIKit

class LMUpdateBioVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var bioTableview: UITableView!

}

// MARK: - Life Cycle Methods
extension LMUpdateBioVC {

    override func initialSetup() {
        CommonFunction.commonFunctions.setupTableviewCell(tableView: bioTableview, nibName: StringConstant.ViewController.lmUpdateBioTC)
        reloadTableView = {
            [weak self] in
            guard let `self` = self else { return }
            self.bioTableview.reloadData()
        }
    }
}
