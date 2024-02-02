//
//  LMReportFeedbackVM.swift
//  Lumi
//
//  Created by Rishabh Sharma on 29/05/22.
//

import UIKit

class LMReportFeedbackVM {

    func reportUser() {
        WebServices.reportUser(toAppend: allLumiUserObj[reportTagClouser?() ?? 0].id, parameters: paramsReport) { result in
            switch result {
            case .success(let data):
                debugPrint(data)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
