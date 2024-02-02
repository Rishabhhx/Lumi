//
//  LMMyPhotosCC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 24/06/22.
//

import UIKit
import FirebaseStorage

class LMMyPhotosCC: UICollectionViewCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Outlets
    @IBOutlet weak private(set) var addButton: UIButton!
    @IBOutlet weak private(set) var userImage: UIImageView!
    @IBOutlet weak private(set) var crossButton: UIButton!
    @IBOutlet weak private(set) var cellView: UIView!
    @IBOutlet weak private(set) var currentProfileView: UIView!

    // MARK: - Properties
    private let choose = UIImagePickerController()
    var onDelete: (() -> Void)?
    var cellNo : Int = 0
    private let storage = Storage.storage().reference()

    // MARK: - Picking image from user device
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true , completion: nil)
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            userImage?.contentMode = .scaleAspectFill
            userImage?.image = pickedImage
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
            self.userImage?.image = ImageAssest.icProfileImgPlaceholder.imageAssest
        }
        let cancelButton = UIAlertAction(title: StringConstant.cancel.rawValue, style: UIAlertAction.Style.cancel) { _ in
        }
        alert.addAction(cancelButton)
        presentAlert?(alert)
        if userImage?.image == ImageAssest.icProfileImgPlaceholder.imageAssest {
            alert.addAction(okayButton)
        } else {
            alert.addAction(okayButton)
            alert.addAction(okayButton2)
        }
        reloadCollectionView?()
    }

    @IBAction private func crossButton(_ sender: Any) {
        onDelete?()
    }

    override func prepareForReuse() {
        self.currentProfileView.isHidden = true
        CommonFunction.commonFunctions.viewBorderColor(viewName: self.cellView, borderColor: ColorAssest.redButton.colorAssest.cgColor, borderWidth: 0,radius: 0)
    }
    override func awakeFromNib() {
        userImage.layer.cornerRadius = 5
        super.awakeFromNib()
    }
}
