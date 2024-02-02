//
//  LMSignupOTPVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 07/04/22.
//

import UIKit
import CoreData
import MotionToastView

var stopActivity : (() -> Void)?
var moveToHomeVC : (() -> Void)?

class LMSignupOTPVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak private(set) var otptextfield1: UITextField!
    @IBOutlet weak private(set) var otptextfield2: UITextField!
    @IBOutlet weak private(set) var otptextfield3: UITextField!
    @IBOutlet weak private(set) var otptextfield4: UITextField!
    @IBOutlet weak private(set) var verifyOTPButton: UIButton!

    // MARK: - Properties
    private(set) var userOTP : String!
    lazy var otpViewModelObj = LMOtpVM()

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    @IBAction private func resendCode(_ sender: Any) {
        resendCodeClouser!()
        MotionToast(message: StringConstant.WelcomeScreen.emptyString, toastType: .success, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
    }

    // MARK: - Verifying the otp user has enter
    @IBAction private func verifyOTPAction(_ sender: Any) {
        guard let otp1 = otptextfield1.text else {return}
        guard let otp2 = otptextfield2.text else {return}
        guard let otp3 = otptextfield3.text else {return}
        guard let otp4 = otptextfield4.text else {return}

        if otp1.isEmpty || otp2.isEmpty || otp3.isEmpty || otp4.isEmpty {
            MotionToast(message: StringConstant.WelcomeScreen.otpEmpty, toastType: .warning, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            otpViewModelObj.otpAPICall()
            activityIndicator.isHidden = false
//            let status = StringConstant.Constants.loginDone
//            UserDefaults.standard.set(status, forKey: StringConstant.Constants.status)
//            activityIndicator.startAnimating()
        }
    }
}

// MARK: - Private Functions
extension LMSignupOTPVC {

    static func create(viewModel:LMOtpVM) -> UIViewController {
            let obj = LMSignupOTPVC.instantiate(fromAppStoryboard: .main)
            obj.otpViewModelObj = viewModel
            return obj
        }

    // MARK: - Giving color and width to otpTextField
    func colorAndWidth(otptextfield : UITextField) {
        otptextfield.layer.borderColor = ColorAssest.otpBorder.colorAssest.cgColor
        otptextfield.layer.borderWidth = 1.0
        otptextfield.layer.cornerRadius = 5
    }

    // MARK: - Otp continuing text field
    @objc func changeCharacter(textField : UITextField) {
        guard let textFields = textField.text else {return}
        if textFields.utf8.count == 1 {
            switch textField {
            case otptextfield1:
                otptextfield2.becomeFirstResponder()
            case otptextfield2:
                otptextfield3.becomeFirstResponder()
            case otptextfield3:
                otptextfield4.becomeFirstResponder()
            case otptextfield4:
                otptextfield4.resignFirstResponder()
                guard let otp1 = otptextfield1.text else {return}
                guard let otp2 = otptextfield2.text else {return}
                guard let otp3 = otptextfield3.text else {return}
                guard let otp4 = otptextfield4.text else {return}
                userOTP = "\(otp1)\(otp2)\(otp3)\(otp4)"
                phoneNumberObj.otp = userOTP
            default:
                break
            }
        } else if textFields.isEmpty {
            switch textField {
            case otptextfield4:
                otptextfield3.becomeFirstResponder()
            case otptextfield3:
                otptextfield2.becomeFirstResponder()
            case otptextfield2:
                otptextfield1.becomeFirstResponder()
            default:
                break
            }
        }
    }
}

// MARK: - Life Cycle Methods
extension LMSignupOTPVC {

    override func initialSetup() {
        activityIndicator.isHidden = true
        hideKeyboardWhenTappedAround()
        colorAndWidth(otptextfield: otptextfield1)
        colorAndWidth(otptextfield: otptextfield2)
        colorAndWidth(otptextfield: otptextfield3)
        colorAndWidth(otptextfield: otptextfield4)
        verifyOTPButton.backgroundColor = ColorAssest.redButton.colorAssest
        CommonFunction.commonFunctions.buttonShadow(buttonName: verifyOTPButton)
        otptextfield1.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        otptextfield2.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        otptextfield3.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        otptextfield4.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        otpViewModelObj.nextController = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMSettingsVC.instantiate(fromAppStoryboard: .menu)
            self.push(vc: controller)
        }
        moveToHomeVC = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMHomeVC.instantiate(fromAppStoryboard: .home)
            self.push(vc: controller)
        }
        stopActivity = {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.otptextfield1.text = nil
            self.otptextfield2.text = nil
            self.otptextfield3.text = nil
            self.otptextfield4.text = nil
        }
    }
}
