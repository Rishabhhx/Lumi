//
//  SearchBarDelegate.swift
//  Lumi
//
//  Created by Rishabh Sharma on 10/05/22.
//

import Foundation
import UIKit

// MARK: - SearchBar delegate
extension LMCountryCodeSelectVC : UISearchBarDelegate {
func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    if searchBar.text == nil || searchBar.text == StringConstant.WelcomeScreen.emptyString {
        isSearching = false
        view.endEditing(true)
        countryCodeTableView.reloadData()
    } else {
        isSearching = true
        filteredData = allCountryDataSet.filter({ json in
            return json.name == searchText
        })
        countryCodeTableView.reloadData()
    }
}
}
