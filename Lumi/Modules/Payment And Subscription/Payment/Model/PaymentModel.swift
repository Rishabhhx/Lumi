//
//  PaymentModel.swift
//  Lumi
//
//  Created by Rishabh Sharma on 17/05/22.
//

import Foundation

var allPaymentObj = PaymentModel()

struct PaymentModel {
    var nameOnCard  : String?
    var cardNumber : String?
    var monthExpiration : String?
    var yearExpiration : String?
    var cvvNumber : String?
}

struct PaymentApi {
    var price : Int?
    var payTax : Int?
    var payDescription : String?
    var eventId : String?
}

var paymentApiObj = PaymentApi()

var paramsPayment: JSONDictionary {
    let param = ["price": paymentApiObj.price as Any,
                 "payTax": paymentApiObj.payTax as Any,
                 "payDescription": paymentApiObj.payDescription as Any] as [String : Any]
        return param
    }
var paramsBookEvent: JSONDictionary {
    let param = ["paymentId": paymentSucessObj?.id as Any] as [String : Any]
        return param
    }
var paramsbuySubscription: JSONDictionary {
    let param = ["paymentId": paymentSucessObj?.id as Any] as [String : Any]
        return param
    }

var paymentSucessObj: LMPaymentSucessModel?

struct LMPaymentSucessModel : Codable {

    var id : String
    var payTransactionId : String

    // MARK: - Coding Keys for Payment details
    enum PaymentSucessCodingKeys : String, CodingKey {
        case id = "_id"
        case payTransactionId
    }

    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: PaymentSucessCodingKeys.self)
        id = try value.decodeIfPresent(String.self, forKey: .id) ?? StringConstant.WelcomeScreen.emptyString
        payTransactionId = try value.decodeIfPresent(String.self, forKey: .payTransactionId) ?? StringConstant.WelcomeScreen.emptyString
    }
}
