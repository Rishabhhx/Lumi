//
//  LMMyPhotosVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 24/06/22.
//

import UIKit

class LMMyPhotosVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var save: UIButton!
    @IBOutlet weak private(set) var backButton: UIButton!
    @IBOutlet weak private(set) var myPhotosColllectionview: UICollectionView!

    // MARK: - Properties
    var updateProfileViewModelObj : LMUpdateProfileVM!

    // MARK: - IBoutlets Actions
    @IBAction private func save(_ sender: Any) {
        for vr in 0...(updateMyProfileObj?.profilePicture.count ?? 0) {
            if vr < updateMyProfileObj?.profilePicture.count ?? 0 {
                if updateMyProfileObj?.profilePicture[vr] == StringConstant.WelcomeScreen.emptyString {
                    updateMyProfileObj?.profilePicture.remove(at: vr)
                }
            }
        }
        // Jugad For Deleting pictures
//        updateMyProfileObj?.profilePicture.remove(at: 1)
        updateProfileViewModelObj.profileCall()
    }

    @IBAction private func backButton(_ sender: Any) {
        pop()
    }
}

// MARK: - Life Cycle Methods
extension LMMyPhotosVC {

    override func initialSetup() {
        updateProfileViewModelObj = LMUpdateProfileVM()
        myPhotosColllectionview.delegate = self
        myPhotosColllectionview.dataSource = self
        CommonFunction.commonFunctions.setupColllectionview(collectionView: myPhotosColllectionview, nibName: StringConstant.ViewController.lmMyPhotosCC)
        save.layer.cornerRadius = 22.5
        reloadCollectionView = {
            [weak self] in
            guard let `self` = self else { return }
            self.myPhotosColllectionview.reloadData()
        }
    }
}

// MARK: - CollectionView Delegate and Datasource
extension LMMyPhotosVC : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = myPhotosColllectionview.dequeueReusableCell(withReuseIdentifier: StringConstant.ViewController.lmMyPhotosCC, for: indexPath) as? LMMyPhotosCC else { return UICollectionViewCell() }
        if indexPath.row == 0 {
            CommonFunction.commonFunctions.viewBorderColor(viewName: cell.cellView, borderColor: ColorAssest.redButton.colorAssest.cgColor, borderWidth: 4,radius: 5)
            CommonFunction.commonFunctions.viewRadius(view: cell.currentProfileView, radius: 5)
            cell.currentProfileView.isHidden = false
        }
        if indexPath.row >= updateMyProfileObj?.profilePicture.count ?? 0 || updateMyProfileObj?.profilePicture[indexPath.row] == StringConstant.WelcomeScreen.emptyString {
            cell.userImage.isHidden = true
            cell.crossButton.isHidden = true
        } else {
            cell.userImage.isHidden = false
            cell.crossButton.isHidden = false
            cell.userImage.downloadImageFromFirebase(link: updateMyProfileObj?.profilePicture[indexPath.row] ?? StringConstant.WelcomeScreen.emptyString, contentMode: .scaleAspectFill)
            cell.onDelete = { [weak self] in
                updateMyProfileObj?.profilePicture[indexPath.row] = StringConstant.WelcomeScreen.emptyString
                cell.userImage.isHidden = true
                cell.crossButton.isHidden = true
                cell.cellNo = indexPath.row
                self?.myPhotosColllectionview.reloadData()
            }
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row < updateMyProfileObj?.profilePicture.count ?? 0 {
            updateMyProfileObj?.profilePicture.swapAt(0, indexPath.row)
            myPhotosColllectionview.reloadData()
        }
    }
}

extension LMMyPhotosVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns = ceil(6.0/2)
        return CGSize(width: collectionView.frame.width/2.0, height: collectionView.frame.height/columns)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
