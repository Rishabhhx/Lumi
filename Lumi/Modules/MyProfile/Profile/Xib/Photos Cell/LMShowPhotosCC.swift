//
//  LMShowPhotosCC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 30/06/22.
//

import UIKit
import FirebaseStorage

class LMShowPhotosCC: UICollectionViewCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Outlets
    @IBOutlet weak private(set) var cellView: UIView!
    @IBOutlet weak private(set) var cellImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        CommonFunction.commonFunctions.viewRadius(view: cellView, radius: 5)
        cellImage.layer.cornerRadius = 5
        cellImage.image = ImageAssest.icProfileImgPlaceholder.imageAssest
    }

    override func prepareForReuse() {
        cellImage.image = ImageAssest.icProfileImgPlaceholder.imageAssest
    }
}
