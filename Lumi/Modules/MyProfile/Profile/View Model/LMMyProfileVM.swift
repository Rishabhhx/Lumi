//
//  LMMyProfileVM.swift
//  Lumi
//
//  Created by Rishabh Sharma on 27/06/22.
//

import UIKit
class LMMyProfileVM {

    // MARK: - Api call for events details
    func eventDetailsCall() {
        WebServices.myProfile(parameters: userProfileParam) { result in
            switch result {
            case .success(let data):
                debugPrint(data)
                myProfileObj = data
                updateMyProfileObj = myProfileObj
                bioInfo?()
                let controller = LMMyProfileVC.instantiate(fromAppStoryboard: .myProfile)
                controller.numberOfCellInSubTable = myProfileObj?.bio.count ?? 0
                print(controller.numberOfCellInSubTable)
                downloadMyProflie?()
                basicInfoMyProfile?()
                reloadBio?()
                reloadTableView?()
                reloadCollectionView?()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
