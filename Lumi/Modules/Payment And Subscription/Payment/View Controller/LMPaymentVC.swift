//
//  LMPaymentVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 12/05/22.
//

import UIKit
import mtpPickerField

class LMPaymentVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var monthExpiration: PickerField!
    @IBOutlet weak private(set) var nameOnCard: UITextField!
    @IBOutlet weak private(set) var cardNumber: UITextField!
    @IBOutlet weak private(set) var saveCardButton: UIButton!
    @IBOutlet weak private(set) var yearExpioration: PickerField!
    @IBOutlet weak private(set) var cvvNumber: UITextField!
    @IBOutlet weak private(set) var savedCardsView: UIView!
    @IBOutlet weak private(set) var savedCardsTableView: UITableView!

    // MARK: - Properties
    var months : [String] = []
    var year : [String] = []
    var noOfSavedCards = 3
    var paymentViewModelObj : LMPaymentVM!

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    @IBAction private func payButton(_ sender: Any) {
        guard let cardName = nameOnCard.text else { return }
        guard let cardNo = cardNumber.text else { return }
        guard let cardMonth = monthExpiration.text else { return }
        guard let cardYear = yearExpioration.text else { return }
        guard let cardCvv = cvvNumber.text else { return }
        if cardName.isEmpty || cardName.count <= 3 || cardName.trimmingCharacters(in: .whitespaces).isEmpty {
            MotionToast(message: StringConstant.Home.cardNameInvalid, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else if cardNo.isEmpty || cardNo.count <= 15 || cardNo.trimmingCharacters(in: .whitespaces).isEmpty {
            MotionToast(message: StringConstant.Home.cardNoInvalid, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else if cardMonth.isEmpty || cardMonth.trimmingCharacters(in: .whitespaces).isEmpty {
            MotionToast(message: StringConstant.Home.monthInvalid, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else if cardYear.isEmpty || cardYear.trimmingCharacters(in: .whitespaces).isEmpty {
            MotionToast(message: StringConstant.Home.yourLocation, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else if cardCvv.isEmpty || cardCvv.count <= 2 || cardCvv.trimmingCharacters(in: .whitespaces).isEmpty {
            MotionToast(message: StringConstant.Home.cvvInvalid, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            allPaymentObj.cardNumber = cardNo
            allPaymentObj.nameOnCard = cardName
            allPaymentObj.monthExpiration = monthExpiration.text
            allPaymentObj.yearExpiration = yearExpioration.text
            allPaymentObj.cvvNumber = cvvNumber.text
            paymentApiObj.price = eventPriceClouser?()
            paymentApiObj.payTax = 0
            paymentApiObj.payDescription = "Payment Done"
            paymentApiObj.eventId = eventIdClouser?()
            paymentViewModelObj.paymentApiCall()
        }
    }

    @IBAction private func saveCardButton(_ sender: Any) {
        saveCardButton.isSelected.toggle()
        if savedCardsView.isHidden {
            savedCardsView.isHidden = false
        } else {
            savedCardsView.isHidden = true
        }
    }
}

// MARK: - Private Functions
extension LMPaymentVC {

    func loopForMonthAndYear() {
        for monthLoop in 1...12 {
            months.append(String(monthLoop))
        }
        for yearLoop in 2022...2032 {
            year.append(String(yearLoop))
        }
    }
}

// MARK: - Life Cycle Methods
extension LMPaymentVC {

    override func initialSetup() {
        loopForMonthAndYear()
        paymentViewModelObj = LMPaymentVM()
        savedCardsView.isHidden = true
        CommonFunction.commonFunctions.setupTableviewCell(tableView: savedCardsTableView, nibName: StringConstant.ViewController.lmSavedCardsTC)
        hideKeyboardWhenTappedAround()
        cardNumber.delegate = self
        nameOnCard.delegate = self
        cvvNumber.delegate = self
        savedCardsTableView.delegate = self
        savedCardsTableView.dataSource = self
        monthExpiration.pickerView?.tag = 1
        monthExpiration.type = .pickerView
        monthExpiration.pickerView?.delegate=self
        monthExpiration.titleLabel?.text = StringConstant.Home.selectMonth
        yearExpioration.type = .pickerView
        yearExpioration.pickerView?.tag = 2
        yearExpioration.pickerView?.delegate=self
        yearExpioration.titleLabel?.text = StringConstant.Home.selectYear
        paymentViewModelObj.motionToast = {
            [weak self] in
            guard let `self` = self else { return }
            self.MotionToast(message: resultMesage ?? "", toastType: .success, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        }
        paymentViewModelObj.failureMotion = {
            [weak self] in
            guard let `self` = self else { return }
            self.MotionToast(message: resultMesage ?? "", toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        }
        paymentViewModelObj.navigate = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMHomeVC.instantiate(fromAppStoryboard: .home)
            self.push(vc: controller)
        }
    }
}
