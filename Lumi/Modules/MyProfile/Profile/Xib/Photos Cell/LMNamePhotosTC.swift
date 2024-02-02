//
//  LMNamePhotosTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 22/06/22.
//

import UIKit

var downloadMyProflie : (() -> Void)?
var reloadCollectionView : (() -> Void)?

class LMNamePhotosTC: UITableViewCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Outlets
    @IBOutlet weak private(set) var collectionHeight: NSLayoutConstraint!
    @IBOutlet weak private(set) var userMail: UILabel!
    @IBOutlet weak private(set) var editButton: UIButton!
    @IBOutlet weak private(set) var userName: UILabel!
    @IBOutlet weak private(set) var viewProfileView: UIView!
    @IBOutlet weak private(set) var myPhotosCollectionview: UICollectionView!

    // MARK: - Properties
    private(set) var profileImage : UIImageView?
    private let choose = UIImagePickerController()

    // MARK: - IBOutlets Actions
    @IBAction private func editButton(_ sender: Any) {
        moveToMyName?()
    }

    @objc func tapView1() {
        pushViewAs?()
    }
}

// MARK: - Life Cycle Methods
extension LMNamePhotosTC {
    override func awakeFromNib() {
        super.awakeFromNib()
        downloadMyProflie = {
            self.userName.text = myProfileObj?.name
        }
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(tapView1))
        viewProfileView.addGestureRecognizer(tap1)
        reloadCollectionView = {
            self.myPhotosCollectionview.reloadData()
        }
        CommonFunction.commonFunctions.setupColllectionview(collectionView: myPhotosCollectionview, nibName: StringConstant.ViewController.lmShowPhotosCC)
        myPhotosCollectionview.delegate = self
        myPhotosCollectionview.dataSource = self
        CommonFunction.commonFunctions.viewRadius(view: viewProfileView, radius: 12)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - Collectionview Delegate
extension LMNamePhotosTC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if myProfileObj?.profilePicture.count ?? 0 <= 3 {
            collectionHeight.constant = 103.25
            reloadTableView?()
            return 3
        } else {
            collectionHeight.constant = 206.5
            reloadTableView?()
            return 6
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = myPhotosCollectionview.dequeueReusableCell(withReuseIdentifier: StringConstant.ViewController.lmShowPhotosCC, for: indexPath) as? LMShowPhotosCC else { return UICollectionViewCell() }
        if indexPath.row < myProfileObj?.profilePicture.count ?? 0 {
            cell.cellImage.downloadImageFrom(link: myProfileObj?.profilePicture[indexPath.row] ?? StringConstant.WelcomeScreen.emptyString, contentMode: .scaleAspectFill)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        moveToMyPhotos?()
    }
}

extension LMNamePhotosTC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myPhotosCollectionview.frame.width/3, height: 103.25 )
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
