//
//  LMShowPhotosCC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 30/06/22.
//

import UIKit
import FirebaseStorage

class LMPostPhotosCC: UICollectionViewCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private let choose = UIImagePickerController()
    private let storage = Storage.storage().reference()

    // MARK: - Outlets
    @IBOutlet weak private(set) var cellView: UIView!
    @IBOutlet weak private(set) var cellImage: UIImageView!

    // MARK: - Picking image from user device
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true , completion: nil)
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            cellImage?.contentMode = .scaleAspectFill
            cellImage?.image = pickedImage
            guard let imageData = pickedImage.pngData() else {
                return
            }
            let ref = storage.child("images/profileImage").putData(imageData, metadata: nil, completion: { _, error in
                guard error == nil else {
                    print("Failed to upload")
                    return
                }
                self.storage.child("images/profileImage").downloadURL(completion: { url, error in
                    guard let url = url , error == nil else {
                        return
                    }
                    let urlString = url.absoluteString
                    print("Download Url: \(urlString)")
                    updateMyProfileObj?.profilePicture.append(urlString)
                })
            })
        }
    }

    // MARK: - IBOutlets Actions
    @IBAction private func addButton(_ sender: Any) {
        let alert = UIAlertController(title: StringConstant.Profile.selectOne, message: StringConstant.Profile.imageSelect, preferredStyle: UIAlertController.Style.actionSheet)
        let okayButton = UIAlertAction(title: StringConstant.Profile.photoLibrary, style: UIAlertAction.Style.default) { _ in
            self.choose.sourceType = .photoLibrary
            self.choose.allowsEditing = true
            self.choose.delegate = self
            presentImagePicker?(self.choose)
        }
        let okayButton2 = UIAlertAction(title: StringConstant.remove.rawValue, style: UIAlertAction.Style.default) { _ in
            self.cellImage?.image = ImageAssest.icProfileImgPlaceholder.imageAssest
        }
        let cancelButton = UIAlertAction(title: StringConstant.cancel.rawValue, style: UIAlertAction.Style.cancel) { _ in
        }
        alert.addAction(cancelButton)
        presentAlert?(alert)
        if cellImage?.image == ImageAssest.icProfileImgPlaceholder.imageAssest {
            alert.addAction(okayButton)
        } else {
            alert.addAction(okayButton)
            alert.addAction(okayButton2)
        }
        reloadCollectionView?()
    }
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
