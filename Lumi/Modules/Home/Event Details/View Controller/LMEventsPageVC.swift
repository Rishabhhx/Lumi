//
//  File.swift
//  Lumi
//
//  Created by Rishabh Sharma on 11/05/22.
//

import UIKit

var sendImage : (() -> UIImage)?
// MARK: - This class bind data that is scrollable for page view controller
class LMEventsPageVC: LMBaseVC {
    @IBOutlet weak private(set) var eventImages: UIImageView!
    var page: Pages1 = .pageOne
    override func initialSetup() {
        sendImage = {
            [weak self] in
            return self?.eventImages.image ?? UIImage()
        }
        eventImages.downloadImageFrom(link: alleventsObj[cellNo ?? 0].eventImages[page.index] , contentMode: .scaleAspectFill)
    }

    // MARK: - Bind page with view controller
    func bindData(page:Pages1) {
        self.page = page
    }
}
