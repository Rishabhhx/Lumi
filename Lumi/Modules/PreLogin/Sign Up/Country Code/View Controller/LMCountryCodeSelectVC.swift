//
//  LMCountryCodeSelectVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 06/04/22.
//

// MARK: - Declare Protocol
var nextPageCcode : ((_ cCode : String) -> Void)?

import UIKit

class LMCountryCodeSelectVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var searchBar: UISearchBar!
    @IBOutlet weak private(set) var countryCodeTableView: UITableView!
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    // MARK: - Properties
    var filteredData = [NewCountryJson]()
    var isSearching = false
}

// MARK: - Life Cycle Methods
extension LMCountryCodeSelectVC {

    override func initialSetup() {
        countryCodeTableView.dataSource = self
        countryCodeTableView.delegate = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        countryCodeTableView.reloadData()
    }
}
