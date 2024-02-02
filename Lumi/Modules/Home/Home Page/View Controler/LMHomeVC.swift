//
//  LMHomeVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 18/05/22.
//

import UIKit

var hideTopBar : (() -> Void)?
var showTopBar : (() -> Void)?
var goToEvents : (() -> Void)?
var goToMaybe : (() -> Void)?
var goToLumidates : (() -> Void)?
var goToSettings : (() -> Void)?
var goToInvites : (() -> Void)?

class LMHomeVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var myView: UIView!
    @IBOutlet weak private(set) var topBarView: UIView!
    @IBOutlet weak private(set) var myProfileButton: UIButton!
    @IBOutlet weak private(set) var chatButton: UIButton!
    @IBOutlet weak private(set) var menuButton: UIButton!
    @IBOutlet weak private(set) var eventMatesButton: UIButton!
    private(set) var pageController: UIPageViewController?

    // MARK: - Properties
    lazy var viewControllerList : [UIViewController] = {
        let vc1 = LMHomeMapVC.instantiate(fromAppStoryboard: .home)
        return [vc1]
    }()
    let person = UIImage(systemName: "person.fill")
    var vc: VisibleVC = .anyVC

    // MARK: - IBoutlets Actions
    @IBAction private func eventMatesButton(_ sender: Any) {
        eventMatesButton.isSelected.toggle()
        vc = .anyVC
        if eventMatesButton.isSelected {
            eventMatesButton.setImage(ImageAssest.icTopNavigationMates.imageAssest, for: .normal)
            menuButton.setImage(ImageAssest.icTopNavigationMenu.imageAssest, for: .normal)
            myProfileButton.setImage(person, for: .normal)
            chatButton.setImage(ImageAssest.icTopNavigationChatInactive.imageAssest, for: .normal)
            pageController?.setViewControllers([LMMaybeMatchesVC.instantiate(fromAppStoryboard: .home)], direction: .forward, animated: true, completion: nil)
        } else {
            eventMatesButton.setImage(ImageAssest.icTopNavigationEvent.imageAssest, for: .normal)
            menuButton.setImage(ImageAssest.icTopNavigationMenu.imageAssest, for: .normal)
            myProfileButton.setImage(person, for: .normal)
            chatButton.setImage(ImageAssest.icTopNavigationChatInactive.imageAssest, for: .normal)
            pageController?.setViewControllers([LMHomeMapVC.instantiate(fromAppStoryboard: .home)], direction: .reverse, animated: true, completion: nil)
        }
    }

    @IBAction private func menuButton(_ sender: Any) {
        if vc != .menu {
            vc = .menu
            menuButton.setImage(ImageAssest.icTopNavigationMenuActive.imageAssest, for: .normal)
            eventMatesButton.setImage(ImageAssest.icToggleInactive.imageAssest, for: .normal)
            myProfileButton.setImage(person, for: .normal)
            chatButton.setImage(ImageAssest.icTopNavigationChatInactive.imageAssest, for: .normal)
            self.eventMatesButton.backgroundColor =  ColorAssest.clear.colorAssest
            pageController?.setViewControllers([LMMenuVC.instantiate(fromAppStoryboard: .menu)], direction: .reverse, animated: true, completion: nil)
            self.eventMatesButton.isUserInteractionEnabled = true
        }
    }

    @IBAction private func chatButton(_ sender: Any) {
        if vc != .chat {
            vc = .chat
            pageController?.setViewControllers([ShareToInsta.instantiate(fromAppStoryboard: .menu)], direction: .forward, animated: true, completion: nil)
            menuButton.setImage(ImageAssest.icTopNavigationMenu.imageAssest, for: .normal)
            eventMatesButton.setImage(ImageAssest.icToggleInactive.imageAssest, for: .normal)
            myProfileButton.setImage(person, for: .normal)
            self.eventMatesButton.backgroundColor =  ColorAssest.clear.colorAssest
            chatButton.setImage(ImageAssest.icTopNavigationChatActive.imageAssest, for: .normal)
            self.eventMatesButton.isUserInteractionEnabled = true
        }
    }

    @IBAction private func myProfileButton(_ sender: Any) {
        if vc != .myProfile {
            vc = .myProfile
            pageController?.setViewControllers([LMMyProfileVC.instantiate(fromAppStoryboard: .myProfile)], direction: .reverse, animated: true, completion: nil)
            menuButton.setImage(ImageAssest.icTopNavigationMenu.imageAssest, for: .normal)
            eventMatesButton.setImage(ImageAssest.icToggleInactive.imageAssest, for: .normal)
            self.eventMatesButton.backgroundColor =  ColorAssest.clear.colorAssest
            chatButton.setImage(ImageAssest.icTopNavigationChatInactive.imageAssest, for: .normal)
            myProfileButton.setImage(ImageAssest.icTopNavigationProfileActive.imageAssest, for: .normal)
            self.eventMatesButton.isUserInteractionEnabled = true
        }
    }
}

// MARK: Private Functions
extension LMHomeVC {

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
extension LMHomeVC {
    override func initialSetup() {
        topBarView.layer.cornerRadius = 3
        self.setupPageController()
        hideKeyboardWhenTappedAround()
        pageController?.isPagingEnabled = false
        hideTopBar = {
            [weak self] in
            guard let `self` = self else { return }
            self.topBarView.isHidden = true
        }
        showTopBar = {
            [weak self] in
            guard let `self` = self else { return }
            self.topBarView.isHidden = false
        }
        goToEvents = {
            [weak self] in
            guard let `self` = self else { return }
            self.vc = .anyVC
            self.eventMatesButton.setImage(ImageAssest.icTopNavigationEvent.imageAssest, for: .normal)
            self.menuButton.setImage(ImageAssest.icTopNavigationMenu.imageAssest, for: .normal)
            self.pageController?.setViewControllers([LMHomeMapVC.instantiate(fromAppStoryboard: .home)], direction: .forward, animated: true, completion: nil)
        }
        goToMaybe = {
            [weak self] in
            guard let `self` = self else { return }
            self.vc = .anyVC
            self.eventMatesButton.setImage(ImageAssest.icTopNavigationMates.imageAssest, for: .normal)
            self.menuButton.setImage(ImageAssest.icTopNavigationMenu.imageAssest, for: .normal)
            self.pageController?.setViewControllers([LMMaybeMatchesVC.instantiate(fromAppStoryboard: .home)], direction: .forward, animated: true, completion: nil)
        }
        goToLumidates = {
            [weak self] in
            guard let `self` = self else { return }
            self.vc = .anyVC
            self.menuButton.isSelected.toggle()
            self.pageController?.setViewControllers([LMLumidatesVC.instantiate(fromAppStoryboard: .menu)], direction: .forward, animated: true, completion: nil)
            self.menuButton.setImage(ImageAssest.icTopNavigationMenu.imageAssest, for: .normal)
            let origImage = UIImage(systemName: "eye.fill")
            let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
            self.eventMatesButton.setImage(tintedImage, for: .normal)
            self.eventMatesButton.tintColor = ColorAssest.redButton.colorAssest
            self.eventMatesButton.isUserInteractionEnabled = false
        }
        goToSettings = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMSettingsVC.instantiate(fromAppStoryboard: .menu)
            self.push(vc: controller)

        }
        goToInvites = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMInvitesVC.instantiate(fromAppStoryboard: .menu)
            self.push(vc: controller)

        }
    }
}
