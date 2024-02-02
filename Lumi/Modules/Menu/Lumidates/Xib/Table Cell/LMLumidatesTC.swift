//
//  LMLumidatesTC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 19/05/22.
//

import UIKit

var selectedCellClouser : (() -> Int)?
class LMLumidatesTC: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak private(set) var eventNameView: UIView!
    @IBOutlet weak private(set) var eventNameLabel: UILabel!
    @IBOutlet weak private(set) var eventView: UIView!
    @IBOutlet weak private(set) var reportView: UIView!
    @IBOutlet weak private(set) var reportButton: UIButton!
    @IBOutlet weak private(set) var lumiUserLocation: UILabel!
    @IBOutlet weak private(set) var lumiUserAge: UILabel!
    @IBOutlet weak private(set) var lumiUsersName: UILabel!
    @IBOutlet weak private(set) var profileCollectionview: UICollectionView!
    @IBOutlet weak private(set) var outerViewChat: UIView!
    @IBOutlet weak private(set) var chatButtonView: UIView!
    @IBOutlet weak private(set) var curveView: UIView!
    @IBOutlet weak private(set) var pageControl: UIPageControl!
    @IBOutlet weak private(set) var blockButton: UIButton!
    @IBOutlet weak private(set) var dotReportButton: UIButton!
    @IBOutlet weak private(set) var blockView: UIView!

    // MARK: - Properties
    var tableRowData : [Lumidates] = []
    var selectedCellNo : Int?

    // MARK: - Outlet Action
    @IBAction private func blockButton(_ sender: Any) {
        blockUserCall?()
    }

    @IBAction private func dotReportButton(_ sender: Any) {
        reportButton.isSelected.toggle()
        if reportView.isHidden {
            reportView.isHidden = false
        } else {
            reportView.isHidden = true
        }
        if blockView.isHidden {
            blockView.isHidden = false
        } else {
            blockView.isHidden = true
        }
    }
}

// MARK: - Private Functions
extension LMLumidatesTC {

    @objc func tapView1() {
        eventCall?()
    }
}

// MARK: - Life Cycle Methods
extension LMLumidatesTC {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectedCellClouser = {
            return self.selectedCellNo ?? 0
        }
        profileCollectionview.delegate = self
        profileCollectionview.dataSource = self
        CommonFunction.commonFunctions.setupColllectionview(collectionView: profileCollectionview, nibName: StringConstant.ViewController.lmLumidatesImagesCC)
        CommonFunction.commonFunctions.viewRadius(view: reportView, radius: 5)
        CommonFunction.commonFunctions.viewRadius(view: blockView, radius: 5)
        curveView.addShadow(location: .top, color: ColorAssest.viewShadow.colorAssest, opacity: 1, radius: 40)
        outerViewChat.addShadow(location: .top, color: ColorAssest.viewShadow.colorAssest, opacity: 1, radius: 40)
        eventView.layer.cornerRadius = 11.2
        eventNameView.layer.cornerRadius = 11.2
        outerViewChat.layer.cornerRadius = outerViewChat.layer.frame.width/2
        chatButtonView.layer.cornerRadius = chatButtonView.layer.frame.width/2
        curveView.layer.cornerRadius = curveView.layer.frame.width/2.7
        pageControl.hidesForSinglePage = true
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(tapView1))
        eventNameView.addGestureRecognizer(tap1)
    }
}

// MARK: - CollectionView Delegate and Datasource
extension LMLumidatesTC : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = profileCollectionview.dequeueReusableCell(withReuseIdentifier: StringConstant.ViewController.lmLumidatesImagesCC, for: indexPath) as? LMLumidatesImagesCC else { return UICollectionViewCell() }
        switch indexPath.row {
        case 0:
            cell.profileImage.downloadImageFrom(link: tableRowData.first?.invitedTo.profilePicture[indexPath.row] ?? StringConstant.WelcomeScreen.emptyString, contentMode: .scaleAspectFill)
        case 1:
            cell.profileImage.downloadImageFrom(link: tableRowData.first?.invitedTo.profilePicture[indexPath.row] ?? StringConstant.WelcomeScreen.emptyString, contentMode: .scaleAspectFill)
        case 2:
            cell.profileImage.downloadImageFrom(link: tableRowData.first?.eventID.eventImages[0] ?? StringConstant.WelcomeScreen.emptyString, contentMode: .scaleAspectFill)
            changeLabelText?()
        case 3:
            cell.profileImage.downloadImageFrom(link: tableRowData.first?.eventID.eventImages[1] ?? StringConstant.WelcomeScreen.emptyString, contentMode: .scaleAspectFill)
            changeLabelText?()
        default:
            cell.profileImage.downloadImageFrom(link: tableRowData.first?.eventID.eventImages[1] ?? StringConstant.WelcomeScreen.emptyString, contentMode: .scaleAspectFill)
        }
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        return cell
    }
}

extension LMLumidatesTC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item > 1 {
            lumiUsersName.text = tableRowData.first?.eventID.eventName
            lumiUserAge.text = CommonFunction.commonFunctions.dateGeneral(tdate: tableRowData.first?.eventID.eventDate ?? "")
            lumiUserLocation.text = tableRowData.first?.eventID.eventLocation
            dotReportButton.isHidden = true
        } else if indexPath.item < 2 {
            lumiUsersName.text = tableRowData.first?.invitedTo.name
            lumiUserAge.text = String(CommonFunction.commonFunctions.calcAge(birthday: tableRowData.first?.invitedTo.dob ?? ""))
            lumiUserLocation.text = tableRowData.first?.invitedTo.homeTown
            dotReportButton.isHidden = false
        }
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
