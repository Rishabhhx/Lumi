//
//  LMSendInvitePopupVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 26/05/22.
//

import UIKit
import MotionToastView

var sentClouser : (() -> Void)?
class LMSendInvitePopupVC: LMBaseVC {

    // MARK: Outlets
    @IBOutlet weak private(set) var userEventLabel: UILabel!
    @IBOutlet weak private(set) var checkButton: UIButton!
    @IBOutlet weak private(set) var sendButton: UIButton!
    @IBOutlet weak private(set) var userTicketLabel: UILabel!
    @IBOutlet weak private(set) var myView: UIView!

    // MARK: - Properties
    var nameOfferToBuy = String()
    var eventOfferToBuy = String()

    // MARK: - Iboutlets Actions
    @IBAction private func checkButton(_ sender: Any) {
        checkButton.isSelected.toggle()
        if checkButton.isSelected {
            offerObj?.isOfferingTicket = true
        }
    }

    @IBAction private func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction private func sendButton(_ sender: Any) {
        if checkButton.isSelected {
            dismiss(animated: true, completion: nil)
            sentClouser?()
            eventInviteClouser?()
        } else {
            MotionToast(message: StringConstant.Home.check, toastType: .warning, duration: .short, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        }
    }
}

// MARK: - Life Cycle Methods
extension LMSendInvitePopupVC {

    override func initialSetup() {
        userTicketLabel.text = nameOfferToBuy
        userEventLabel.text = eventOfferToBuy
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: sendButton, color: ColorAssest.redButton.colorAssest, radius: 22.5)
        CommonFunction.commonFunctions.viewRadius(view: myView, radius: 3)
    }
}
