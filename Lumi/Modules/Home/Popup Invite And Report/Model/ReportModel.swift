//
//  ReportModel.swift
//  Lumi
//
//  Created by Rishabh Sharma on 27/05/22.
//

import UIKit

struct ReportReason {
    var reportReason : String?
    var reportfeedback : String?
}
struct UserIds {
    var eventId : String?
    var userId : String?
}
struct Offer {
    var isOfferingTicket = false
}

var offerObj : Offer?
var reportObj : ReportReason?
var userIdObj : UserIds?

var paramsReport: JSONDictionary {
    let param = ["reasons": reportObj?.reportReason as Any,
                 "otherReasons": reportObj?.reportfeedback as Any]
        return param
    }
var paramsBlock: JSONDictionary {
    let param = ["reasons": reportObj?.reportReason as Any,
                 "otherReasons": reportObj?.reportfeedback as Any]
        return param
    }
var paramsInvite: JSONDictionary {
    let param = ["isOfferingTicket": offerObj?.isOfferingTicket as Any]
        return param
    }
