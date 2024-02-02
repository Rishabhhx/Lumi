//
//  LMPhoneNoVM.swift
//  Lumi
//
//  Created by Rishabh Sharma on 07/04/22.

import Foundation
import UIKit
import MotionToastView

class LMPhoneNoVM {

    // MARK: - Stored Properties
    private(set) var credentials = Credentials() {
        didSet {
            phoneNumber = credentials.phoneNumber ?? StringConstant.WelcomeScreen.emptyString
        }
    }

    var credentialsInputErrorMessage:String = StringConstant.WelcomeScreen.emptyString
    private(set) var phoneNumber = ""
    func updateCredentials(phoneNumber: String) {
        credentials.phoneNumber = phoneNumber
    }

    // MARK: - Function which checks the number is valid or not
    func isValidPhone(phone: String) -> Bool {
        let phoneRegex = StringConstant.RegEx.phoneNoRegex
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phone)
    }

    // MARK: - Function which passes data from json file to country model
    func parseJSON() {
        guard let path = Bundle.main.path(forResource: StringConstant.ViewController.countryInfo, ofType: "json")
        else {
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            let jsonData = try Data(contentsOf: url)
            var result = try JSONDecoder().decode([NewCountryJson].self, from: jsonData)
            result = result.sorted { $0.code < $1.code }
            allCountryDataSet = result
            allCountryDataSet = allCountryDataSet.sorted { $0.name < $1.name }
        } catch let error {
            debugPrint(error)
        }
    }

    // MARK: - Function which checks phone field is emptty or not
    func credentialsInput() -> CredentialsInputStatus {
        if phoneNumber.isEmpty {
            credentialsInputErrorMessage = StringConstant.WelcomeScreen.phoneNoEmpty
            return .incorrect
        }
        if isValidPhone(phone: phoneNumber) {
            return .correct
        }
        return .incorrect
    }
}

// MARK: - API Call
extension LMPhoneNoVM {

    func loginAPICall() {
        if UserDefaults.standard.object(forKey: UserDefaultVar.updateNumberStatus.rawValue) as? String == "Update Phone Number" {
            WebServices.updatePhoneCall(parameters: updateParamsPhoneNo) { result in
                switch result {
                case .success(let data):
                    activityMessage?()
                    navigation?()
                    debugPrint(data)
                case .failure(let error):
                    activityMessage2?()
                    debugPrint(error)
                }
            }
        } else {
            WebServices.loginAPICall(parameters: paramsPhoneNo) { result in
                switch result {
                case .success(let data):
                    activityMessage?()
                    navigation?()
                    debugPrint(data)
                case .failure(let error):
                    activityMessage2?()
                    debugPrint(error)
                }
            }
        }
    }
}
