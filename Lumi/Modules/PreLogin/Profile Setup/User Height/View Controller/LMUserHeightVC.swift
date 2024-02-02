//
//  LMUserHeightVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 13/04/22.
//

import UIKit

class LMUserHeightVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var feetPickerView: UIPickerView!
    @IBOutlet weak private(set) var inchesPickerView: UIPickerView!

    // MARK: - Properties
    private(set) var feet : [Int] = []
    private(set) var inches : [Int] = []
    public var userHeightFeet : Int?
    public var userHeightInches : Int?

    // MARK: - IBOutlets Action
    @IBAction private func nextButton(_ sender: Any) {
        nextPage?()
        userProfileObj.userHeight.append(userHeightFeet ?? 1)
        userProfileObj.userHeight.append(userHeightInches ?? 1)
    }
}

// MARK: - Life Cycle Functions
extension LMUserHeightVC {

    override func initialSetup() {
        feetPickerView.dataSource = self
        feetPickerView.delegate = self
        inchesPickerView.dataSource = self
        inchesPickerView.delegate = self
        for loop1 in 0..<7 {
            feet.insert((loop1+1), at: loop1)
        }
        for loop2 in 0..<12 {
            inches.insert((loop2+1), at: loop2)
        }
    }
}
