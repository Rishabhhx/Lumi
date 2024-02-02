//
//  SubscriptionModel.swift
//  Lumi
//
//  Created by Rishabh Sharma on 01/06/22.
//

import UIKit
var allSubscriptionModelObj : [LMSubscriptionModel] = []

struct LMSubscriptionModel : Codable {

    var id : String
    var subscriptionPlan : String
    var subscriptionMonths : Int
    var price : Int

    // MARK: - Coding Keys for event details
    enum SubscriptionCodingKeys : String, CodingKey {
        case id = "_id"
        case subscriptionPlan
        case subscriptionMonths
        case price
    }

    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: SubscriptionCodingKeys.self)
        id = try value.decodeIfPresent(String.self, forKey: .id) ?? StringConstant.WelcomeScreen.emptyString
        subscriptionPlan = try value.decodeIfPresent(String.self, forKey: .subscriptionPlan) ?? StringConstant.WelcomeScreen.emptyString
        subscriptionMonths = try value.decodeIfPresent(Int.self, forKey: .subscriptionMonths) ?? 0
        price = try value.decodeIfPresent(Int.self, forKey: .price) ?? 1
    }
}
struct UserSubscription {
    var id : String?
    var price : Int?
}
var userSubscriptionObj : UserSubscription?
