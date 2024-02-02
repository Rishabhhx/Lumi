//
//  LMContinueWithPhoneNoVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 06/04/22.
//

import UIKit
import CoreData
import MotionToastView

var resendCodeClouser : (() -> Void)?
var activityMessage : (() -> Void)?
var activityMessage2 : (() -> Void)?
var navigation : (() -> Void)?
class LMContinueWithPhoneNoVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak private(set) var phoneNoTextView: UITextField!
    @IBOutlet weak private(set) var countryCode: UILabel!
    @IBOutlet weak private(set) var countryFlag: UIImageView!
    @IBOutlet weak private(set) var getOTP: UIButton!

    // MARK: - Properties
    var phoneViewModelObj : LMPhoneNoVM!
    var phoneNumber: String?

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    // MARK: - Getting otp at the user phone number
    @IBAction private func getOTPAction(_ sender: Any) {
        guard let phoneText = phoneNoTextView.text else { return }
        if phoneText.isEmpty {
            MotionToast(message: StringConstant.WelcomeScreen.phoneNoEmpty, toastType: .warning, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            phoneViewModelObj.updateCredentials(phoneNumber: phoneNoTextView.text ?? StringConstant.WelcomeScreen.emptyString)
            switch phoneViewModelObj.credentialsInput() {
            case .correct:
                phoneNumber = "\(countryCode.text ?? StringConstant.WelcomeScreen.emptyString)\(phoneNoTextView.text ?? StringConstant.WelcomeScreen.emptyString)"
                let trimmedString = phoneNumber?.trimmingCharacters(in: .whitespaces)
                phoneNumberObj.phoneNumber = trimmedString
                activityIndicator.isHidden = false
                activityIndicator.startAnimating()
                phoneViewModelObj.loginAPICall()
                debugPrint(phoneNumberObj.phoneNumber ?? StringConstant.WelcomeScreen.emptyString)
                guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
                let entity = NSEntityDescription.entity(forEntityName: StringConstant.ViewController.entity, in: context)
                let newEntity = NSManagedObject(entity: entity!, insertInto: context)
                newEntity.setValue(phoneNoTextView.text, forKey: "phoneNumber")
                do {
                    try context.save()
                    debugPrint(StringConstant.done.rawValue)
                } catch {
                    debugPrint(StringConstant.remove.rawValue)
                }
            case .incorrect:
                MotionToast(message: StringConstant.WelcomeScreen.invalidPhoneNo, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
                phoneNoTextView.text = nil
                return
            }
        }
    }

    // MARK: - Open country codes selecting controller
    @IBAction private func countryNoSelectButton(_ sender: UIButton) {
        phoneViewModelObj.parseJSON()
        let controller = LMCountryCodeSelectVC.instantiate(fromAppStoryboard: .main)
        push(vc: controller)
    }

    static func create(viewModel:LMPhoneNoVM) -> UIViewController {
            let obj = LMContinueWithPhoneNoVC.instantiate(fromAppStoryboard: .main)
            obj.phoneViewModelObj = viewModel
            return obj
        }
}

// MARK: - Life Cycle Methods
extension LMContinueWithPhoneNoVC {

    override func initialSetup() {
        phoneViewModelObj = LMPhoneNoVM()
        activityIndicator.isHidden = true
        nextPageCcode = { cCode in
            self.countryCode.text = cCode
        }
        resendCodeClouser = {
            [weak self] in
            guard let `self` = self else { return }
            self.phoneViewModelObj.loginAPICall()
        }
        view.layoutIfNeeded()
        phoneNoTextView.delegate = self
        hideKeyboardWhenTappedAround()
        phoneNumberObj.phoneNumber = "\(phoneNoTextView.text ?? StringConstant.WelcomeScreen.emptyString)\(countryCode.text ?? StringConstant.WelcomeScreen.emptyString)"
        phoneNoTextView.keyboardType = .phonePad
        getOTP.backgroundColor = ColorAssest.redButton.colorAssest
        CommonFunction.commonFunctions.buttonShadow(buttonName: getOTP)
        navigation = {
            [weak self] in
            guard let `self` = self else { return }
            if UserDefaults.standard.object(forKey: UserDefaultVar.updateNumberStatus.rawValue) as? String == "Update Phone Number" {
                let controller = LMSettingsVC.instantiate(fromAppStoryboard: .menu)
                self.push(vc: controller)
            } else {
                let controller = LMSignupOTPVC.create(viewModel: LMOtpVM())
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
        activityMessage = {
            [weak self] in
            guard let `self` = self else { return }
            self.MotionToast(message: resultMesage ?? StringConstant.WelcomeScreen.emptyString, toastType: .success, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        }
        activityMessage2 = {[weak self] in
            guard let `self` = self else { return }
            self.MotionToast(message: resultMesage ?? StringConstant.WelcomeScreen.emptyString, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
}
