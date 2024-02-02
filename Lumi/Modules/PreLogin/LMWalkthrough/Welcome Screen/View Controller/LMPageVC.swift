//
//  LMPageVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 05/04/22.
//

import UIKit

// MARK: - This class bind data that is scrollable for page view controller
class LMPageVC: LMBaseVC {
    var page: Pages = .pageOne
    @IBOutlet weak private(set) var nameTextView: UILabel!
    override func initialSetup() {
        nameTextView.text = page.name
    }

    // MARK: - Bind page with view controller
    func bindData(page:Pages) {
        self.page = page
    }
}
