//
//  LMReportPopupVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 26/05/22.
//

import UIKit
import MotionToastView

// Protocol declare
protocol ReportPopupdismiss : AnyObject {
    func viewDismiss()
}

class LMReportPopupVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var reportButton: UIButton!
    @IBOutlet weak private(set) var iDontWant: UIButton!
    @IBOutlet weak private(set) var others: UIButton!
    @IBOutlet weak private(set) var hateSpeechOrVoilence: UIButton!
    @IBOutlet weak private(set) var inappropriateContent: UIButton!

    // MARK: - Properties
    weak var viewDismissDelegate : ReportPopupdismiss?
    var flag = false

    // MARK: - IBoutlets Action
    @IBAction private func inappropriateContent(_ sender: UIButton) {
        reportObj = ReportReason()
        switch sender {
        case inappropriateContent :
            reportObj?.reportReason = StringConstant.Home.inappropriateContent
            flag = true
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: inappropriateContent, color: ColorAssest.topBar.colorAssest, radius: 10.5)
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: reportButton, color: ColorAssest.redButton.colorAssest, radius: 22.5)
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: hateSpeechOrVoilence, color: ColorAssest.eventBar.colorAssest, radius: 10.5)
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: iDontWant, color: ColorAssest.eventBar.colorAssest, radius: 10.5)
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: others, color: ColorAssest.eventBar.colorAssest, radius: 10.5)

        case hateSpeechOrVoilence :
            reportObj?.reportReason = StringConstant.Home.hatespeechorvoilence
            flag = true
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: reportButton, color: ColorAssest.redButton.colorAssest, radius: 22.5)
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: hateSpeechOrVoilence, color: ColorAssest.topBar.colorAssest, radius: 10.5)
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: iDontWant, color: ColorAssest.eventBar.colorAssest, radius: 10.5)
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: inappropriateContent, color: ColorAssest.eventBar.colorAssest, radius: 10.5)
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: others, color: ColorAssest.eventBar.colorAssest, radius: 10.5)

        case iDontWant :
            reportObj?.reportReason = StringConstant.Home.idontwantthemtoseeme
            flag = true
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: reportButton, color: ColorAssest.redButton.colorAssest, radius: 22.5)
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: iDontWant, color: ColorAssest.topBar.colorAssest, radius: 10.5)
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: hateSpeechOrVoilence, color: ColorAssest.eventBar.colorAssest, radius: 10.5)
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: inappropriateContent, color: ColorAssest.eventBar.colorAssest, radius: 10.5)
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: others, color: ColorAssest.eventBar.colorAssest, radius: 10.5)

        case others :
            reportObj?.reportReason = StringConstant.Home.others
            flag = true
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: reportButton, color: ColorAssest.redButton.colorAssest, radius: 22.5)
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: others, color: ColorAssest.topBar.colorAssest, radius: 10.5)
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: hateSpeechOrVoilence, color: ColorAssest.eventBar.colorAssest, radius: 10.5)
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: inappropriateContent, color: ColorAssest.eventBar.colorAssest, radius: 10.5)
            CommonFunction.commonFunctions.buttonColorCorner(buttonName: iDontWant, color: ColorAssest.eventBar.colorAssest, radius: 10.5)

        default : break
        }
    }

    @IBAction private func cancleButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction private func reportButton(_ sender: Any) {
        if flag == false {
            MotionToast(message: StringConstant.Profile.selectOne, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            self.dismiss(animated: true, completion: nil)
            self.viewDismissDelegate?.viewDismiss()
        }
    }
}

// MARK: - Life Cycle Methods
extension LMReportPopupVC {

    override func initialSetup() {
        reportButton.layer.cornerRadius = 22.5
    }
}
