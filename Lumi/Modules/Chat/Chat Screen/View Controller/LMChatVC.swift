//
//  LMChatVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 20/06/22.
//

import UIKit

class LMChatVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var chatTableView: UITableView!

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }
}

// MARK: - Life Cycle Methods
extension LMChatVC {

    override func initialSetup() {
        CommonFunction.commonFunctions.setupTableviewCell(tableView: chatTableView, nibName: StringConstant.ViewController.lmChatTC)
    }
}
