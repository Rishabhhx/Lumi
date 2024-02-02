//
//  ShareToInsta.swift
//  Lumi
//
//  Created by Rishabh Sharma on 08/08/22.
//

import UIKit

class ShareToInsta: UIViewController {

    @IBOutlet weak private var instaPhoto: UIImageView!
    @IBOutlet weak private var shareOnInstaButton: UIButton!
    private lazy var instaHandler = InstagramHandler()

    @IBAction private func shareOnInstaButton(_ sender: Any) {
        let image = instaPhoto.image
        instaHandler.post(.image, image)


    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
