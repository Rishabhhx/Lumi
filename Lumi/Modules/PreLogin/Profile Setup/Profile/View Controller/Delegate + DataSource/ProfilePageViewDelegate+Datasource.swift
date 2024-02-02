//
//  Profile PageViewDelegate + datasource.swift
//  Lumi
//
//  Created by Rishabh Sharma on 10/05/22.
//

import Foundation
import UIKit

// MARK: Extensions UIPageViewController
extension LMProfileVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.firstIndex(of : viewController) else {return nil}
        let previousIndex = vcIndex - 1
        prevIndex = previousIndex
        guard previousIndex >= 0 else {return nil}
        guard viewControllerList.count > previousIndex else {return nil}
        return viewControllerList[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.firstIndex(of : viewController) else {return nil}
        let nextIndex = vcIndex + 1
        guard viewControllerList.count != nextIndex else {return nil}
        guard viewControllerList.count > nextIndex else {return nil}
        return viewControllerList[nextIndex]
    }
}

// MARK: UIPageViewController Extensions
extension UIPageViewController {

    var isPagingEnabled: Bool {
        get {
            var isEnabled: Bool = true
            for view in view.subviews {
                if let subView = view as? UIScrollView {
                    isEnabled = subView.isScrollEnabled
                }
            }
            return isEnabled
        }
        set {
            for view in view.subviews {
                if let subView = view as? UIScrollView {
                    subView.isScrollEnabled = newValue
                }
            }
        }
    }

    // MARK: - Move to next page controller
    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        if let currentViewController = viewControllers?[0] {
            if let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) {
                setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
            }
        }
    }

    // MARK: - Move to previous page controlller
    func goToPreviousPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        if let currentViewController = viewControllers?[0] {
            if let previousPage = dataSource?.pageViewController(self, viewControllerBefore: currentViewController) {
                setViewControllers([previousPage], direction: .reverse, animated: true, completion: completion)
            }
        }
    }
}
