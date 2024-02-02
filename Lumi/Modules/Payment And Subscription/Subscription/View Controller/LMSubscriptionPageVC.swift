//
//  LMSubscriptionPageVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 31/05/22.
//

import UIKit

class LMSubscriptionPageVC: LMBaseVC {

    var page: SubsctiptionPages = .pageOne
    @IBOutlet weak private(set) var nameTextView: UILabel!
    override func initialSetup() {
        nameTextView.text = page.name
    }

    // MARK: - Bind page with view controller
    func bindData(page:SubsctiptionPages) {
        self.page = page
    }
}
