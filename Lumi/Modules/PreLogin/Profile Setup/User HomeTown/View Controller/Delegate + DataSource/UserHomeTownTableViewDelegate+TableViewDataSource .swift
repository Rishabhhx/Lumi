//
//  File.swift
//  Lumi
//
//  Created by Rishabh Sharma on 10/05/22.
//

import Foundation
import UIKit

// MARK: - Extension UITableView
extension LMUserHomeTownVC :  UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CityInfo.cityInfo.city_names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: StringConstant.ViewController.city)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: StringConstant.ViewController.city)
        }
        cell?.textLabel?.text = CityInfo.cityInfo.city_names[indexPath.row]
        cell?.contentView.backgroundColor = ColorAssest.lightWhite.colorAssest
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        homeTownTextField.text = CityInfo.cityInfo.city_names[indexPath.row]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
