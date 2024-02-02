//
//  LMMatchesTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 19/05/22.
//

import UIKit
var openReportPopup : (() -> Void)?

class LMMaybeMatchesTC: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak private(set) var revealButton: UIButton!
    @IBOutlet weak private(set) var inviteButton: UIButton!
    @IBOutlet weak private(set) var reportView: UIView!
    @IBOutlet weak private(set) var reportButton: UIButton!
    @IBOutlet weak private(set) var lumiUserLocation: UILabel!
    @IBOutlet weak private(set) var lumiUserAge: UILabel!
    @IBOutlet weak private(set) var lumiUsersName: UILabel!
    @IBOutlet weak private(set) var profileCollectionview: UICollectionView!
    @IBOutlet weak private(set) var outerViewDating: UIView!
    @IBOutlet weak private(set) var revealButtonView: UIView!
    @IBOutlet weak private(set) var datingButtonView: UIView!
    @IBOutlet weak private(set) var inviteButtonView: UIView!
    @IBOutlet weak private(set) var curveView: UIView!
    @IBOutlet weak private(set) var pageControl: UIPageControl!

    // MARK: - Properties
    var tableRowData : [LMLumiUser] = []

    // MARK: - Outlet Action
    @IBAction private func dotReportButton(_ sender: Any) {
        reportButton.isSelected.toggle()
        if reportView.isHidden {
            reportView.isHidden = false
        } else {
            reportView.isHidden = true
        }
    }
}
// MARK: - Life Cycle Methods
extension LMMaybeMatchesTC {

    override func awakeFromNib() {
        super.awakeFromNib()
        profileCollectionview.delegate = self
        profileCollectionview.dataSource = self
        CommonFunction.commonFunctions.setupColllectionview(collectionView: profileCollectionview, nibName: StringConstant.ViewController.lmMatchesImagesCC)
        CommonFunction.commonFunctions.viewRadius(view: reportView, radius: 5)
        curveView.addShadow(location: .top, color: ColorAssest.viewShadow.colorAssest, opacity: 1, radius: 40)
        outerViewDating.addShadow(location: .top, color: ColorAssest.viewShadow.colorAssest, opacity: 1, radius: 40)
        inviteButtonView.layer.cornerRadius = inviteButtonView.layer.frame.width/2
        outerViewDating.layer.cornerRadius = outerViewDating.layer.frame.width/2
        datingButtonView.layer.cornerRadius = datingButtonView.layer.frame.width/2
        revealButtonView.layer.cornerRadius = revealButtonView.layer.frame.width/2
        curveView.layer.cornerRadius = curveView.layer.frame.width/2.7
        pageControl.hidesForSinglePage = true

    }
}

// MARK: - CollectionView Delegate and Datasource
extension LMMaybeMatchesTC : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableRowData.first?.profilePicture.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = profileCollectionview.dequeueReusableCell(withReuseIdentifier: StringConstant.ViewController.lmMatchesImagesCC, for: indexPath) as? LMMatchesImagesCC else { return UICollectionViewCell() }
            cell.profileImage.downloadImageFrom(link: tableRowData.first?.profilePicture[indexPath.row] ?? StringConstant.WelcomeScreen.emptyString, contentMode: .scaleAspectFill)
        pageControl.numberOfPages = tableRowData.first?.profilePicture.count ?? 1
        pageControl.currentPage = 0
        return cell
    }
}

extension LMMaybeMatchesTC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        pageControl.reloadInputViews()
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {

        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
