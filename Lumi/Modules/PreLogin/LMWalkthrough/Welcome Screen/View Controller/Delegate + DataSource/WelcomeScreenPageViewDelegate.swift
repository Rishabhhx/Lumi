//
//  File.swift
//  Lumi
//
//  Created by Rishabh Sharma on 10/05/22.
//

import Foundation
import UIKit

// MARK: - Setup of page view controller
extension LMWelcomeScreenVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentVC = viewController as? LMPageVC else { return nil }
        var index = currentVC.page.index
        pageChange(index: index)
        if index == 0 {
            return nil
        }
        index -= 1
        let storyBoard : UIStoryboard = UIStoryboard(name: StringConstant.ViewController.preLogin, bundle:nil)
        guard let nextViewController = storyBoard.instantiateViewController(withIdentifier: StringConstant.ViewController.lmPageVC) as? LMPageVC else { return nil}
        nextViewController.bindData(page: pages[index])
        return nextViewController
    }

    // MARK: - Changing view controller of pagevc
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentVC = viewController as? LMPageVC else {
            return nil
        }
        var index = currentVC.page.index
        pageChange(index: index)
        if index >= pages.count - 1 {
            return nil
        }
        index += 1
        let storyBoard : UIStoryboard = UIStoryboard(name: StringConstant.ViewController.preLogin, bundle:nil)
        guard let nextViewController = storyBoard.instantiateViewController(withIdentifier: StringConstant.ViewController.lmPageVC) as? LMPageVC else { return nil}
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
