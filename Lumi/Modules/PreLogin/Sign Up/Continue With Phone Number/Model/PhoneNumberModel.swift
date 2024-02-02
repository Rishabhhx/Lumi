//
//  PhoneNumberModel.swift
//  Lumi
//
//  Created by Rishabh Sharma on 07/04/22.
//

import Foundation

// MARK: - Model for storing user phone number
var phoneNumberObj = Credentials()
struct Credentials : Codable {
    var phoneNumber : String?
    var otp : String?
}

var paramsPhoneNo: JSONDictionary {
    let param = ["phoneNumber": phoneNumberObj.phoneNumber as Any] as [String : Any]
        return param
    }
var updateParamsPhoneNo: JSONDictionary {
    let param = ["newPhoneNumber": phoneNumberObj.phoneNumber as Any] as [String : Any]
        return param
    }
var paramsOtp: JSONDictionary {
    let param = ["phoneNumber": phoneNumberObj.phoneNumber as Any,
                 "otp": phoneNumberObj.otp as Any,
                 "loginType": "PHONENUMBER"] as [String : Any]
        return param
    }
