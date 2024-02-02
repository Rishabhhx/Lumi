//
//  LMMatchSelectedVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 21/05/22.
//

import UIKit
import TagListView

class LMLumidateSelectedVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var tagListView: TagListView!
    @IBOutlet weak private(set) var reportButton: UIButton!
    @IBOutlet weak private(set) var reportView: UIView!
    @IBOutlet weak private(set) var blockButton: UIButton!
    @IBOutlet weak private(set) var blockView: UIView!
    @IBOutlet weak private(set) var curveView: UIView!
    @IBOutlet weak private(set) var lumiUserLocation: UILabel!
    @IBOutlet weak private(set) var lumiUserAge: UILabel!
    @IBOutlet weak private(set) var lumiUsersName: UILabel!
    @IBOutlet weak private(set) var outerViewDating: UIView!
    @IBOutlet weak private(set) var chatButtonView: UIView!
    @IBOutlet weak private(set) var profileCollectionview: UICollectionView!
    @IBOutlet weak private(set) var bioCollectionView: UICollectionView!
    @IBOutlet private(set) weak var pageControl: UIPageControl!

    // MARK: - Properties
    var questionArr = [StringConstant.Profile.quo1,StringConstant.Profile.quo2,StringConstant.Profile.quo3,StringConstant.Profile.quo4]
    var selectedUserId : String?
    var height : String?
    var lumidateSelectedViewModelObj : LMLumidateSelectedVM!

    // MARK: - Outlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    @IBAction private func dotReportButton(_ sender: Any) {
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

    @IBAction private func reportButton(_ sender: Any) {
        let controller = LMReportPopupVC.instantiate(fromAppStoryboard: .home)
        controller.viewDismissDelegate = self
        self.present(controller, animated: true, completion: nil)
    }

    @IBAction private func blockButton(_ sender: Any) {
        lumidateSelectedViewModelObj.blockUser()
    }

    @IBAction private func chatButton(_ sender: Any) {
    }
}

// MARK: - Life Cycle Methods
extension LMLumidateSelectedVC {
    override func initialSetup() {
        lumidateSelectedViewModelObj = LMLumidateSelectedVM()
        lumidateSelectedViewModelObj.selectedUserIdClouser = {
            return self.selectedUserId ?? StringConstant.WelcomeScreen.emptyString
        }
        lumidateSelectedViewModelObj.lumidateDetailsCall()
        lumidateSelectedViewModelObj.lumidateDetailsShow = {
            [weak self] in
            guard let `self` = self else { return }
            self.height = "\(allLumiUserDetailsObj?.height[0] ?? 0),\(allLumiUserDetailsObj?.height[1] ?? 0)"
            self.profileCollectionview.reloadData()
            self.bioCollectionView.reloadData()
            self.lumiUsersName.text = allLumiUserDetailsObj?.name
            self.lumiUserAge.text = String(CommonFunction.commonFunctions.calcAge(birthday: allLumiUserDetailsObj?.dob ?? StringConstant.WelcomeScreen.emptyString))
            self.lumiUserLocation.text = allLumiUserDetailsObj?.homeTown
            let date = CommonFunction.commonFunctions.dateGeneral2(tdate: allLumiUserDetailsObj?.dob ?? StringConstant.WelcomeScreen.emptyString)
            self.tagListView.addTags([" \(StringConstant.Home.height) \(self.height ?? StringConstant.WelcomeScreen.emptyString)","\(StringConstant.Home.birthDay) \(date)","\(StringConstant.Home.education) \(allLumiUserDetailsObj?.eduLevel ?? StringConstant.WelcomeScreen.emptyString)","\(StringConstant.Home.job) \(allLumiUserDetailsObj?.jobTitle ?? StringConstant.WelcomeScreen.emptyString)","\(StringConstant.Home.religiousBelief) \(allLumiUserDetailsObj?.religiousBelief ?? StringConstant.WelcomeScreen.emptyString)","\(StringConstant.Home.politicalLeaning) \(allLumiUserDetailsObj?.politicalLeaning ?? StringConstant.WelcomeScreen.emptyString)","\(StringConstant.Home.cigarette) \(allLumiUserDetailsObj?.haveCigarette ?? StringConstant.WelcomeScreen.emptyString)","\(StringConstant.Home.marijuana) \(allLumiUserDetailsObj?.haveMarijuana ?? StringConstant.WelcomeScreen.emptyString)","\(StringConstant.Home.drugs) \(allLumiUserDetailsObj?.haveDrugs ?? StringConstant.WelcomeScreen.emptyString)","\(StringConstant.Home.homeTown) \(allLumiUserDetailsObj?.homeTown ?? StringConstant.WelcomeScreen.emptyString)"])
        }
        CommonFunction.commonFunctions.viewRadius(view: reportView, radius: 5)
        CommonFunction.commonFunctions.viewRadius(view: blockView, radius: 5)
        curveView.addShadow(location: .top, color: ColorAssest.viewShadow.colorAssest, opacity: 1, radius: 40)
        outerViewDating.addShadow(location: .top, color: ColorAssest.viewShadow.colorAssest, opacity: 1, radius: 40)
        CommonFunction.commonFunctions.setupColllectionview(collectionView: profileCollectionview, nibName: StringConstant.ViewController.lmMatchesImagesCC)
        CommonFunction.commonFunctions.setupColllectionview(collectionView: bioCollectionView, nibName: StringConstant.ViewController.lmUserBioCC)
        tagListView.textFont = UIFont.init(name: StringConstant.WelcomeScreen.font, size: 14)!
        tagListView.alignment = .leading
        chatButtonView.layer.cornerRadius = chatButtonView.layer.frame.width/2
        outerViewDating.layer.cornerRadius = outerViewDating.layer.frame.width/2
        curveView.layer.cornerRadius = curveView.layer.frame.width/2.7
        pageControl.hidesForSinglePage = true
    }
}

// MARK: - Dismiss Popup
extension LMLumidateSelectedVC : ReportPopupdismiss {
    func viewDismiss() {
        let controller = LMReportFeedbackVC.instantiate(fromAppStoryboard: .home)
        present(controller, animated: true)
    }
}
