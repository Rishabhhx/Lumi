//
//  RecoveryMaiModel.swift
//  Lumi
//
//  Created by Rishabh Sharma on 01/07/22.
//

import Foundation

var emailObj = EmailVerify()

struct EmailVerify : Codable {
    var email : String?
}
var verifyMailDic: JSONDictionary {
    let param = ["email": emailObj.email as Any] as [String : Any]
        return param
    }
