//
//  LMReportFeedbackVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 27/05/22.
//

import UIKit
import MotionToastView

class LMReportFeedbackVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var reportButton: UIButton!
    @IBOutlet weak private(set) var feedbackTextView: UITextView!

    // MARK: - Properties
    var feedbackVMObj : LMReportFeedbackVM!

    // MARK: - IBoutlets Actions
    @IBAction private func reportButton(_ sender: Any) {
        reportObj?.reportfeedback = feedbackTextView.text
        dismiss(animated: true)
        MotionToast(message: StringConstant.Home.reportSubmitted, toastType: .success, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        feedbackVMObj.reportUser()
    }

    @IBAction private func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
}

// MARK: - Life Cycle MEthods
extension LMReportFeedbackVC {

    override func initialSetup() {
        feedbackVMObj = LMReportFeedbackVM()
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: reportButton, color: ColorAssest.redButton.colorAssest, radius: 22.5)
    }
}
