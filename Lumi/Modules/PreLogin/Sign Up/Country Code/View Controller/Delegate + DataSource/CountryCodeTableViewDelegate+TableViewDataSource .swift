//
//  File.swift
//  Lumi
//
//  Created by Rishabh Sharma on 10/05/22.
//

import Foundation
import UIKit

// MARK: - Extension for tableview of country code selector
extension LMCountryCodeSelectVC : UITableViewDelegate , UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredData.count
        }
        return allCountryDataSet.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = countryCodeTableView.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmCountryCodeTC, for: indexPath) as? LMCountryCodeTC else { return UITableViewCell() }
        if isSearching {
            cell.countryName.text = filteredData[indexPath.row].name
            cell.countryCode.text = filteredData[indexPath.row].code
        } else {
            cell.countryCode.text = allCountryDataSet[indexPath.row].code
            cell.countryName.text = allCountryDataSet[indexPath.row].name
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearching {
            nextPageCcode?(filteredData[indexPath.row].code)
        } else {
            nextPageCcode?(allCountryDataSet[indexPath.row].code)
        }
        pop()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
