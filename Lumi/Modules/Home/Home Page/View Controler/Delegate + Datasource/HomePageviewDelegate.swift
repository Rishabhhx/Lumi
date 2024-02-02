//
//  HomePageviewDelegate.swift
//  Lumi
//
//  Created by Rishabh Sharma on 19/05/22.
//

import UIKit

// MARK: Extensions UIPageViewController
extension LMHomeVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.firstIndex(of : viewController) else {return nil}
        let previousIndex = vcIndex - 1
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
