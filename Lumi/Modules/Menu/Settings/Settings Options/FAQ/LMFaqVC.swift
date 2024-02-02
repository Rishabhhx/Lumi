//
//  LMFaqVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 06/06/22.
//

import UIKit

class LMFaqVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var view1: UIView!
    @IBOutlet weak private(set) var view2: UIView!
    @IBOutlet weak private(set) var view3: UIView!
    @IBOutlet weak private(set) var view4: UIView!
    @IBOutlet weak private(set) var addButton: UIButton!
    @IBOutlet weak private(set) var addButton2: UIButton!
    @IBOutlet weak private(set) var addButton3: UIButton!
    @IBOutlet weak private(set) var addButton4: UIButton!

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    @IBAction private func addButton(_ sender: UIButton) {
        switch sender {
        case addButton:
            addButton.isSelected.toggle()
            if view1.isHidden {
                view1.isHidden = false
            } else {
                view1.isHidden = true
            }
        case addButton2:
            addButton2.isSelected.toggle()
            if view2.isHidden {
                view2.isHidden = false
            } else {
                view2.isHidden = true
            }
        case addButton3:
            addButton3.isSelected.toggle()
            if view3.isHidden {
                view3.isHidden = false
            } else {
                view3.isHidden = true
            }
        case addButton4:
            addButton4.isSelected.toggle()
            if view4.isHidden {
                view4.isHidden = false
            } else {
                view4.isHidden = true
            }
        default :
            addButton.isSelected.toggle()
            if view1.isHidden {
                view1.isHidden = false
            } else {
                view1.isHidden = true
            }
        }
    }

    override func initialSetup() {
    }
}
