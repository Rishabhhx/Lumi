//
//  Webservices+EndPoints.swift
//  Lumi
//
//  Created by Rishabh Sharma on 27/04/22.
//

import Foundation
extension WebServices {

    enum EndPoint : String {
        // MARK: - OnBoarding
        case phoneNumberPost = "/v1/user/signup/get-otp"
        case otpPost = "/v1/user/signup/verify-otp"
        case profilePost = "/v1/user/profile/update"
        case allEventsGet = "/v1/user/event/all-events"
        case allLumiUserGet = "/v1/user/match/maybe-matches"
        case allLumiUserDetailsGet = "/v1/user/match/profile/"
        case reportUser = "/v1/user/match/report/"
        case paymentPost = "/v1/payment"
        case bookeEventPost = "/v1/user/event/book-event/"
        case inviteEventsPost = "/v1/user/event/my-events/"
        case subscriptionGet = "/v1/user/all-subscriptions"
        case buySubscriptionPost = "/v1/user/subscribe-plan/"
        case myEventsGet = "/v1/user/event/my-events"
        case updatePhonePatch = "/v1/user/change-phoneNumber"
        case lumidatesGet = "/v1/user/lumidates"
        case selectedEventGet = "/v1/user/event/details/"
        case blockUser = "/v1/user/match/block/"
        case bookingEventsGet = "/v1/user/my-bookings"
        case sentInvites = "/v1/user/match/invite/sent"
        case recivedInvites = "/v1/user/match/invite/received"
        case acceptInvite = "/v1/user/match/invite/accept/"
        case declineInvite = "/v1/user/match/invite/decline/"
        case getMyProfile = "/v1/user/profile"
        case logoutPost = "/v1/user/logout"
        case verifyEmail = "/v1/user/verify-email"

        // MARK: - API url path
        var path : String {
            return "https://lumidevapi.appskeeper.in" + rawValue
        }

        // MARK: - Static content url path
        var staticContentPath : String {
            return "https://lumidevapi.appskeeper.in" + rawValue
        }
    }
}
