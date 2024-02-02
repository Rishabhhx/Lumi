//
//  LMProfileVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 13/04/22.
//

import UIKit

class LMProfileVC: LMBaseVC {

    // MARK: Outlets
    @IBOutlet weak private(set) var myView: UIView!
    @IBOutlet weak private(set) var statusCollectionView: UICollectionView!

    // MARK: Variables
    var prevIndex = Int()
    var count = 0
    var statusListNotSelected = [String]()
    private(set) var pageController: UIPageViewController?
    lazy var viewControllerList : [UIViewController] = {
        let controller = LMCreateNewAccountVC.instantiate(fromAppStoryboard: .main)
        let vc1 = LMUserProfileVC.instantiate(fromAppStoryboard: .main)
        let vc2 = LMUserBioVC.instantiate(fromAppStoryboard: .main)
        let vc3 = LMUserHeightVC.instantiate(fromAppStoryboard: .main)
        let vc4 = LMUserLocationVC.instantiate(fromAppStoryboard: .main)
        let vc5 = LMUserIntrestedVC.instantiate(fromAppStoryboard: .main)
        let vc6 = LMUserIntrestAgeVC.instantiate(fromAppStoryboard: .main)
        let vc7 = LMUserHomeTownVC.instantiate(fromAppStoryboard: .main)
        let vc8 = LMUserJobVC.instantiate(fromAppStoryboard: .main)
        let vc9 = LMUserEducationVC.instantiate(fromAppStoryboard: .main)
        let vc10 = LMUserReligionVC.instantiate(fromAppStoryboard: .main)
        let vc11 = LMUserPoliticalVC.instantiate(fromAppStoryboard: .main)
        let vc12 = LMUserCigarettesVC.instantiate(fromAppStoryboard: .main)
        let vc13 = LMUserAlcoholVC.instantiate(fromAppStoryboard: .main)
        let vc14 = LMUserMarijuanaVC.instantiate(fromAppStoryboard: .main)
        let vc15 = LMUserDrugsVC.instantiate(fromAppStoryboard: .main)
        return [vc1,vc2,vc3,vc4,vc5,vc6,vc7,vc8,vc9,vc10,vc11,vc12,vc13,vc14,vc15]
    }()

    // MARK: - IBOutlets Actions
    @IBAction private func previousButton(_ sender: Any) {
        if count >= 1 {
            pageController?.goToPreviousPage()
            statusCollectionView.reloadData()
            statusList[count] = statusListNotSelected[count]
            statusList[count - 1] = statusListSelected[count - 1]
            self.count -= 1
        } else {
            pop()
        }
    }
}

// MARK: Private Functions
extension LMProfileVC {

    // MARK: - Page controller setup
    private func setupPageController() {
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController?.dataSource = self
        pageController?.delegate = self
        pageController?.view.backgroundColor = .clear
        pageController?.view.frame = CGRect(x: 0,y: 0,width: myView.frame.width,height: myView.frame.height)
        addChild(pageController ?? UIViewController())
        myView.addSubview(pageController?.view ?? UIView())
        if let firstViewController = viewControllerList.first {
            pageController?.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
}

// MARK: - Life Cycle Methods
extension LMProfileVC {

    override func initialSetup() {
        statusListNotSelected = statusList
        self.setupPageController()
        hideKeyboardWhenTappedAround()
        pageController?.isPagingEnabled = false
        nextPage = {
            [weak self] in
            guard let `self` = self else { return }
            if self.count <= 14 {
                self.count += 1
                self.pageController?.goToNextPage()
                self.statusCollectionView.reloadData()
                statusList[self.count] = statusListSelected[self.count]
                statusList[self.count - 1] = self.statusListNotSelected[self.count - 1]
                statusList[0] = ImageAssest.overviewInactive.rawValue
            }
        }
    }
}
