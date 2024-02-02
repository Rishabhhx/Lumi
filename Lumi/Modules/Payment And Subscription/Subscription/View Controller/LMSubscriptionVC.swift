//
//  LMSubscriptionVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 31/05/22.
//

import UIKit
import MotionToastView

class LMSubscriptionVC: LMBaseVC {

    // MARK: - Outlets used in view controller
    @IBOutlet weak private(set) var myView: UIView!
    @IBOutlet weak private(set) var pageControl: UIPageControl!
    @IBOutlet weak private(set) var popular: UIView!
    @IBOutlet weak private(set) var twelveMonthView: UIView!
    @IBOutlet weak private(set) var sixMonthView: UIView!
    @IBOutlet weak private(set) var oneMonthView: UIView!
    @IBOutlet weak private(set) var paymentButton: UIButton!

    // MARK: - Properties
    private(set) var pages: [SubsctiptionPages] = SubsctiptionPages.allCases
    private(set) var currentIndex: Int = 0
    private(set) var pageController: UIPageViewController?
    var subscriptionVMObj : LMSubscriptionVM!

    @IBAction private func crossButton(_ sender: Any) {
        pop()
    }

    @IBAction private func paymentButton(_ sender: Any) {
        if userSubscriptionObj?.id == nil {
            MotionToast(message: StringConstant.Profile.selectOne, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            let controller = LMPaymentVC.instantiate(fromAppStoryboard: .home)
            push(vc: controller)
        }
    }
}

// MARK: - Private Functions
extension LMSubscriptionVC {

    // MARK: - Page controller setup
    private func setupPageController() {
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController?.dataSource = self
        pageController?.delegate = self
        pageController?.view.backgroundColor = .clear
        pageController?.view.frame = CGRect(x: 0,y: 0,width: myView.frame.width,height: myView.frame.height)
        addChild(pageController ?? UIViewController())
        myView.addSubview(pageController?.view ?? UIView())
        let storyBoard : UIStoryboard = UIStoryboard(name: StringConstant.ViewController.home, bundle:nil)
        guard let nextViewController = storyBoard.instantiateViewController(withIdentifier: StringConstant.ViewController.lmSubscriptionPageVC) as? LMSubscriptionPageVC else { return }
        nextViewController.bindData(page: pages[0])
        pageController?.setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        pageController?.didMove(toParent: self)
    }

    @objc func tapView1() {
        userSubscriptionObj?.id = allSubscriptionModelObj[2].id
        userSubscriptionObj?.price = allSubscriptionModelObj[2].price
            CommonFunction.commonFunctions.viewBorderColor(viewName: self.twelveMonthView, borderColor: ColorAssest.answerButton4.colorAssest.cgColor, borderWidth: 4, radius: 5)
        CommonFunction.commonFunctions.viewBorderColor(viewName: oneMonthView, borderColor: ColorAssest.answerButton3.colorAssest.cgColor, borderWidth: 4, radius: 5)
        CommonFunction.commonFunctions.viewBorderColor(viewName: sixMonthView, borderColor: ColorAssest.answerButton3.colorAssest.cgColor, borderWidth: 4, radius: 5)
    }

    @objc func tapView2() {
        userSubscriptionObj?.id = allSubscriptionModelObj[1].id
        userSubscriptionObj?.price = allSubscriptionModelObj[1].price
            CommonFunction.commonFunctions.viewBorderColor(viewName: self.sixMonthView, borderColor: ColorAssest.answerButton4.colorAssest.cgColor, borderWidth: 4, radius: 5)
        CommonFunction.commonFunctions.viewBorderColor(viewName: oneMonthView, borderColor: ColorAssest.answerButton3.colorAssest.cgColor, borderWidth: 4, radius: 5)
        CommonFunction.commonFunctions.viewBorderColor(viewName: twelveMonthView, borderColor: ColorAssest.answerButton3.colorAssest.cgColor, borderWidth: 4, radius: 5)
    }

    @objc func tapView3() {
        userSubscriptionObj?.id = allSubscriptionModelObj[0].id
        userSubscriptionObj?.price = allSubscriptionModelObj[0].price
            CommonFunction.commonFunctions.viewBorderColor(viewName: self.oneMonthView, borderColor: ColorAssest.answerButton4.colorAssest.cgColor, borderWidth: 4, radius: 5)
        CommonFunction.commonFunctions.viewBorderColor(viewName: sixMonthView, borderColor: ColorAssest.answerButton3.colorAssest.cgColor, borderWidth: 4, radius: 5)
        CommonFunction.commonFunctions.viewBorderColor(viewName: twelveMonthView, borderColor: ColorAssest.answerButton3.colorAssest.cgColor, borderWidth: 4, radius: 5)
    }
}

// MARK: - Life Cycle Methods
extension LMSubscriptionVC {

    override func initialSetup() {
        setupPageController()
        subscriptionVMObj = LMSubscriptionVM()
        userSubscriptionObj = UserSubscription()
        subscriptionVMObj.subscriptionCall()
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: paymentButton, color: ColorAssest.redButton.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.viewRadius(view: popular, radius: 9.5)
        CommonFunction.commonFunctions.viewBorderColor(viewName: sixMonthView, borderColor: ColorAssest.answerButton3.colorAssest.cgColor, borderWidth: 4,radius: 5)
        CommonFunction.commonFunctions.viewBorderColor(viewName: oneMonthView, borderColor: ColorAssest.answerButton3.colorAssest.cgColor, borderWidth: 4, radius: 5)
        CommonFunction.commonFunctions.viewBorderColor(viewName: twelveMonthView, borderColor: ColorAssest.answerButton3.colorAssest.cgColor, borderWidth: 4, radius: 5)
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(tapView1))
        twelveMonthView.addGestureRecognizer(tap1)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(tapView2))
        sixMonthView.addGestureRecognizer(tap2)
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(tapView3))
        oneMonthView.addGestureRecognizer(tap3)
    }
}
