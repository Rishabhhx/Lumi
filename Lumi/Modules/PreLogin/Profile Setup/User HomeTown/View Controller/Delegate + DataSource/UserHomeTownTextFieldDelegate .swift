//
//  File.swift
//  Lumi
//
//  Created by Rishabh Sharma on 10/05/22.
//

import Foundation
import UIKit

extension LMUserHomeTownVC : UITextFieldDelegate {

    // MARK: - Textfield function for searching the hometown
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        homeTownTextField.resignFirstResponder()
        return true
    }

    @objc func searchRecords(_ textField: UITextField) {
        CityInfo.cityInfo.city_names.removeAll()
        guard let text = textField.text else {return}
        if !text.isEmpty {
            for city in originalCountriesList {
                if let countryToSearch = textField.text {
                    let range = city.lowercased().range(of: countryToSearch, options: .caseInsensitive, range: nil, locale: nil)
                    if range != nil {
                        CityInfo.cityInfo.city_names.append(city)
                    }
                }
            }
        } else {
            for city in originalCountriesList {
                CityInfo.cityInfo.city_names.append(city)
            }
        }
        tblCountryList.reloadData()
    }
}
