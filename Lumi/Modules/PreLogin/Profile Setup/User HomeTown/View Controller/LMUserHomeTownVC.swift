//
//  LMUserHomeTownVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 20/04/22.
//

import UIKit
import MotionToastView

class LMUserHomeTownVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var homeTownTextField: UITextField!
    @IBOutlet weak private(set) var tblCountryList: UITableView!

    // MARK: - Properties
    private(set) var originalCountriesList:[String] = Array()

    // MARK: - IBOutlets Actions
    @IBAction private func nextButton(_ sender: Any) {
        guard let homeTown = homeTownTextField.text else {return}
        if homeTown.isEmpty || homeTown.trimmingCharacters(in: .whitespaces).isEmpty {
            MotionToast(message: StringConstant.Profile.homeTownEmpty, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            for city in CityInfo.cityInfo.city_names {
                if city == homeTownTextField.text {
                    userProfileObj.userHomeTown = homeTownTextField.text
                    nextPage?()
                    break
                }
            }
        }
    }
}

// MARK: - Life Cycle Functions
extension LMUserHomeTownVC {

    override func initialSetup() {
        for city in CityInfo.cityInfo.city_names {
            originalCountriesList.append(city)
        }
        tblCountryList.delegate = self
        tblCountryList.dataSource = self
        homeTownTextField.delegate = self
        homeTownTextField.addTarget(self, action: #selector(searchRecords(_ :)), for: .editingChanged)
    }
}
