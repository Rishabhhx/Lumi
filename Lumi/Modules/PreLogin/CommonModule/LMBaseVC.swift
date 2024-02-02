//
//  LMBaseVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 26/04/22.
//

import UIKit

class LMBaseVC: UIViewController {

    // MARK: - TO hide the keyboard when tap outside
    @objc func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Instantiate Storyboard
extension UIViewController {

    class func instantiate(fromAppStoryboard appStoryboard: LMStoryboard) -> Self {
        return appStoryboard.viewController(self)
    }

    class var storyboardID : String {
        return "\(self)"
    }
}

// MARK: - Life Cycle Functions
extension LMBaseVC {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - Setup functions
extension LMBaseVC {
    @objc func initialSetup() {
        // Initial setup for the class, is called in view did load
    }

    func push(vc:LMBaseVC,animated:Bool = true) {
        self.navigationController?.pushViewController(vc, animated: animated)
    }

    func pop(animated:Bool = true) {
        self.navigationController?.popViewController(animated: animated)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    override var shouldAutorotate: Bool {
        false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }
}
