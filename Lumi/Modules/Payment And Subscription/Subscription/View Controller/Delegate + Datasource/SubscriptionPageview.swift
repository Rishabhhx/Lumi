//
//  SubscriptionPageview.swift
//  Lumi
//
//  Created by Rishabh Sharma on 31/05/22.
//

import UIKit

// MARK: - Setup of page view controller
extension LMSubscriptionVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentVC = viewController as? LMSubscriptionPageVC else { return nil }
        var index = currentVC.page.index
        pageChange(index: index)
        if index == 0 {
            return nil
        }
        index -= 1
        let storyBoard : UIStoryboard = UIStoryboard(name: StringConstant.ViewController.home, bundle:nil)
        guard let nextViewController = storyBoard.instantiateViewController(withIdentifier: StringConstant.ViewController.lmSubscriptionPageVC) as? LMSubscriptionPageVC else { return nil}
        nextViewController.bindData(page: pages[index])
        return nextViewController
    }

    // MARK: - Changing view controller of pagevc
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentVC = viewController as? LMSubscriptionPageVC else {
            return nil
        }
        var index = currentVC.page.index
        pageChange(index: index)
        if index >= pages.count - 1 {
            return nil
        }
        index += 1
        let storyBoard : UIStoryboard = UIStoryboard(name: StringConstant.ViewController.home, bundle:nil)
        guard let nextViewController = storyBoard.instantiateViewController(withIdentifier: StringConstant.ViewController.lmSubscriptionPageVC) as? LMSubscriptionPageVC else { return nil}
        nextViewController.bindData(page: pages[index])
        return nextViewController
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func pageChange(index:Int) {
        pageControl.currentPage = index
    }
}
