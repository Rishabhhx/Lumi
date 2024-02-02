//
//  ChatTableviewDelegate.swift
//  Lumi
//
//  Created by Rishabh Sharma on 27/06/22.
//

import UIKit

// MARK: - Tableview Delegate
extension LMChatVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = chatTableView.dequeueReusableCell(withIdentifier: StringConstant.ViewController.lmChatTC, for: indexPath) as? LMChatTC else { return UITableViewCell() }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = LMMessagesVC.instantiate(fromAppStoryboard: .menu)
        navigationController?.pushViewController(controller, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
