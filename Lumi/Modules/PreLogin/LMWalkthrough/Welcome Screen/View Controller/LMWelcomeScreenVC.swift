//
//  ViewController.swift
//  Lumi
//
//  Created by Rishabh Sharma on 04/04/22.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import MotionToastView

class LMWelcomeScreenVC: LMBaseVC {

    // MARK: - Outlets used in view controller
    @IBOutlet weak private(set) var myView: UIView!
    @IBOutlet weak private(set) var pageControl: UIPageControl!
    @IBOutlet weak private(set) var moreInfo: UILabel!

    // MARK: - Properties
    private(set) var pages: [Pages] = Pages.allCases
    private(set) var currentIndex: Int = 0
    private(set) var pageController: UIPageViewController?

    // MARK: - Enter Details From Facebook
    @IBAction private func continueWithFaceBookAction(_ sender: UIButton) {
        let fbLoginManager : LoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["email"], from: self) { result, error in
            if error == nil {
                let fbloginresult : LoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions.contains("email") {
                    self.getFBUserData()
                }
            }
        }
    }
    // MARK: - Enter Details From Instagram
    @IBAction private func continueWithInstagramAction(_ sender: UIButton) {
        CommonFunction.commonFunctions.aleart(aleartMessage: StringConstant.WelcomeScreen.continueWithInstagram, self)
    }

    // MARK: - Enter Details From Phone Number
    @IBAction private func continueWithPhoneNumberAction(_ sender: UIButton) {
        let controller = LMContinueWithPhoneNoVC.instantiate(fromAppStoryboard: .main)
        push(vc: controller)
    }
}

// MARK: - Private Functions
extension LMWelcomeScreenVC {

    // MARK: - Page controller setup
    private func setupPageController() {
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController?.dataSource = self
        pageController?.delegate = self
        pageController?.view.backgroundColor = .clear
        pageController?.view.frame = CGRect(x: 0,y: 0,width: myView.frame.width,height: myView.frame.height)
        addChild(pageController ?? UIViewController())
        myView.addSubview(pageController?.view ?? UIView())
        let storyBoard : UIStoryboard = UIStoryboard(name: "PreLogin", bundle:nil)
        guard let nextViewController = storyBoard.instantiateViewController(withIdentifier: StringConstant.ViewController.lmPageVC) as? LMPageVC else { return }
        nextViewController.bindData(page: pages[0])
        pageController?.setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        pageController?.didMove(toParent: self)
    }

    // MARK: - User Data from facebook
    private func getFBUserData() {
        if (AccessToken.current) != nil {
            GraphRequest(graphPath: "me", parameters: ["fields": "id, email, first_name, last_name, picture, short_name, name, middle_name, name_format,age_range"]).start { _ , result, _ in
                if let result = result {
                    debugPrint(result)
                }
            }
        }
    }

    private func lableProperties(text : NSAttributedString) {
        moreInfo.attributedText = text
    }

    // MARK: - Making label perfor action on tap
    @objc func tapLabel(gesture: UITapGestureRecognizer) {
        if gesture.didTapAttributedTextInLabel(label: moreInfo, targetText: StringConstant.WelcomeScreen.termsAndCondition) {
            let controller = LMTermsAndConditionVC.instantiate(fromAppStoryboard: .menu)
            push(vc: controller)
        } else {
            debugPrint(StringConstant.done.rawValue)
        }
    }

    // MARK: - Attribute strings function
    private func bottomTextView() {
        moreInfo.text = StringConstant.WelcomeScreen.bottomScreenTextView
        let text = moreInfo.text
        let underlineAttriString = NSMutableAttributedString(string: text ?? "")
        let termsRange = (text! as NSString).range(of: StringConstant.WelcomeScreen.termsAndCondition)
        underlineAttriString.addAttribute(.foregroundColor, value: ColorAssest.redButton.colorAssest, range: termsRange)
        underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: termsRange)
        moreInfo.attributedText = underlineAttriString
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(tapLabel(gesture:)))
        moreInfo.isUserInteractionEnabled = true
        moreInfo.addGestureRecognizer(tapAction)

    }
}

// MARK: - Life Cycle Methods
extension LMWelcomeScreenVC {
    override func initialSetup() {
        if let token = AccessToken.current,
           !token.isExpired {
            let token = token.tokenString
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "id, email, first_name, last_name, picture, short_name, name, middle_name, name_format,age_range"], tokenString: token, version: nil, httpMethod: .get)
            request.start { (_ , _ , _) in
            }
        }
        view.backgroundColor = ColorAssest.notSelected.colorAssest
        setupPageController()
        bottomTextView()
    }
}

// MARK: Tap Gesture
extension UITapGestureRecognizer {

    func didTapAttributedTextInLabel(label: UILabel, targetText: String) -> Bool {
        guard let attributedString = label.attributedText, let lblText = label.text else { return false }
        let targetRange = (lblText as NSString).range(of: targetText)
        let mutableAttribString = NSMutableAttributedString(attributedString: attributedString)
        mutableAttribString.addAttributes(
            [NSAttributedString.Key.font: label.font ?? UIFont.smallSystemFontSize],
            range: NSRange(location: 0, length: attributedString.length)
        )
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: mutableAttribString)
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        let locationOfTouchInLabel = location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y:
                                                        locationOfTouchInLabel.y - textContainerOffset.y)
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
