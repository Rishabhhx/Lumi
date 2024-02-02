//
//  LMInvitesVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 10/06/22.
//

import UIKit

class LMInvitesVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var genderSegmentControlCustom: WMSegment!
    @IBOutlet weak private(set) var containerView : UIView!

    // MARK: Properties
    private lazy var summaryViewController: LMInvitesSentVC = {
        let storyboard = UIStoryboard(name: StringConstant.ViewController.menu, bundle: Bundle.main)
        reloadInviteClouser?()
        var viewController = storyboard.instantiateViewController(withIdentifier: StringConstant.ViewController.lmInvitesSentVC) as? LMInvitesSentVC
        self.add(asChildViewController: viewController ?? UIViewController())
        return viewController!
    }()

    private lazy var sessionsViewController: LMInvitesReceivedVC = {
        let storyboard = UIStoryboard(name: StringConstant.ViewController.menu, bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: StringConstant.ViewController.lmInvitesReceivedVC) as? LMInvitesReceivedVC
        self.add(asChildViewController: viewController ?? UIViewController())
        return viewController!
    }()

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction private func segmentValueChange(_ sender: WMSegment) {
        switch sender.selectedSegmentIndex {
        case 0:
            remove(asChildViewController: sessionsViewController)
            add(asChildViewController: summaryViewController)
        case 1:
            remove(asChildViewController: summaryViewController)
            add(asChildViewController: sessionsViewController)
        default:
            break
        }
    }
}

// MARK: - Private Functions
extension LMInvitesVC {

    static func viewController() -> LMInvitesVC {
        let controller = LMInvitesVC.instantiate(fromAppStoryboard: .menu)
        return controller
    }

    private func add(asChildViewController viewController: UIViewController) {
        addChild(viewController)
        containerView.addSubview(viewController.view)
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }

    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}

// MARK: Life Cycle Methods
extension LMInvitesVC {

    override func initialSetup() {
        add(asChildViewController: summaryViewController)
        genderSegmentControlCustom.SelectedFont = UIFont(name: StringConstant.WelcomeScreen.fontBold, size: 16)!
        genderSegmentControlCustom.normalFont = UIFont(name: StringConstant.WelcomeScreen.fontSemibold, size: 18)!
    }
}
