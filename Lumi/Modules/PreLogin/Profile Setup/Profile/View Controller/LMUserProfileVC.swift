//
//  LMUserProfileVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 12/04/22.
//

import UIKit
import MotionToastView

var nextPage : (() -> Void)?
class LMUserProfileVC: LMBaseVC, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {

    // MARK: - Outlets
    @IBOutlet weak private(set) var nameTextField: UITextField!
    @IBOutlet weak private(set) var profileImage1: UIImageView!
    @IBOutlet weak private(set) var profileImage2: UIImageView!
    @IBOutlet weak private(set) var profileImage3: UIImageView!
    @IBOutlet weak private(set) var profileImage4: UIImageView!
    @IBOutlet weak private(set) var profileImage5: UIImageView!
    @IBOutlet weak private(set) var profileImage6: UIImageView!
    @IBOutlet weak private(set) var dobTextField : UITextField!
    @IBOutlet weak private(set) var monthField : UITextField!
    @IBOutlet weak private(set) var yearField : UITextField!
    @IBOutlet weak private(set) var button1 : UIButton!
    @IBOutlet weak private(set) var button2 : UIButton!
    @IBOutlet weak private(set) var button3 : UIButton!
    @IBOutlet weak private(set) var button4 : UIButton!
    @IBOutlet weak private(set) var button5 : UIButton!
    @IBOutlet weak private(set) var button6 : UIButton!
    @IBOutlet weak private(set) var genderSegmentControlCustom: WMSegment!

    // MARK: - Properties
    private(set) var profileImage : UIImageView?
    private let choose = UIImagePickerController()

    // MARK: - IBOutlets Actions
    @IBAction private func allAddButton(_ sender : UIButton) {
        let alert = UIAlertController(title: StringConstant.Profile.selectOne, message: StringConstant.Profile.imageSelect, preferredStyle: UIAlertController.Style.actionSheet)
        let okayButton = UIAlertAction(title: StringConstant.Profile.photoLibrary, style: UIAlertAction.Style.default) { _ in
            self.choose.sourceType = .photoLibrary
            self.choose.allowsEditing = true
            self.present(self.choose, animated: true ,completion: nil)
        }
        let okayButton2 = UIAlertAction(title: StringConstant.remove.rawValue, style: UIAlertAction.Style.default) { _ in
            self.profileImage?.image = nil
        }
        let cancelButton = UIAlertAction(title: StringConstant.cancel.rawValue, style: UIAlertAction.Style.cancel) { _ in
        }
        alert.addAction(cancelButton)
        present(alert , animated: true , completion: nil)
        switch sender {
        case button1 : profileImage  = profileImage1
            if profileImage1?.image == nil {
                alert.addAction(okayButton)
            } else {
                alert.addAction(okayButton)
                alert.addAction(okayButton2)
            }
        case button2 : profileImage  = profileImage2
            if profileImage2?.image == nil {
                alert.addAction(okayButton)
            } else {
                alert.addAction(okayButton)
                alert.addAction(okayButton2)
            }
        case button3 : profileImage  = profileImage3
            if profileImage3?.image == nil {
                alert.addAction(okayButton)
            } else {
                alert.addAction(okayButton)
                alert.addAction(okayButton2)
            }
        case button4 : profileImage  = profileImage4
            if profileImage4?.image == nil {
                alert.addAction(okayButton)
            } else {
                alert.addAction(okayButton)
                alert.addAction(okayButton2)
            }
        case button5 : profileImage  = profileImage5
            if profileImage5?.image == nil {
                alert.addAction(okayButton)
            } else {
                alert.addAction(okayButton)
                alert.addAction(okayButton2)
            }
        case button6 : profileImage  = profileImage6
            if profileImage6?.image == nil {
                alert.addAction(okayButton)
            } else {
                alert.addAction(okayButton)
                alert.addAction(okayButton2)
            }
        default : debugPrint(StringConstant.WelcomeScreen.emptyString)
        }
    }

    // MARK: - Setting the user gender
    @IBAction private func segmentValueChange(_ sender: WMSegment) {
        switch sender.selectedSegmentIndex {
        case 0:
            userProfileObj.userGender = StringConstant.Profile.male
        case 1:
            userProfileObj.userGender = StringConstant.Profile.female
        case 2:
            userProfileObj.userGender = StringConstant.Profile.nonBinary
        default:
            break
        }
    }

    // MARK: - Moving to next controller and checking valiation
    @IBAction private func nextButton(_ sender: Any) {
        guard let name = nameTextField.text else {return}
        guard let date = dobTextField.text else {return}
        if name.isEmpty || name.count <= 3 || name.trimmingCharacters(in: .whitespaces).isEmpty {
            MotionToast(message: StringConstant.SignUp.nameInvalid, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else if userProfileObj.userProfileImage.count < 1 {
            MotionToast(message: StringConstant.SignUp.photosInvalid, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else if date.isEmpty {
            MotionToast(message: StringConstant.SignUp.dobInvalid, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            userProfileObj.userName = nameTextField.text
            userProfileObj.userDob = dobTextField.text
            nextPage?()
        }
    }
}

// MARK: - Private Functions
extension LMUserProfileVC {

    // MARK: - Picking image from user device
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true , completion: nil)
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            profileImage?.contentMode = .scaleAspectFill
            profileImage?.image = pickedImage
            userProfileObj.userProfileImage.append(profileImage?.image ?? UIImage())
        }
    }

    // MARK: - Setting up user datepicker
    private func createpicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        let calendar = Calendar(identifier: .gregorian)
        let currentDate = Date()
        var components = DateComponents()
        components.calendar = calendar
        components.year = -18
        components.month = 12
        let maxDate = calendar.date(byAdding: components, to: currentDate)
        components.year = -100
        let minDate = calendar.date(byAdding: components, to: currentDate)
        datePicker.maximumDate = maxDate
        datePicker.minimumDate = minDate
        dobTextField.inputView = datePicker
        monthField.inputView = datePicker
        yearField.inputView = datePicker
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        let cancel = UIBarButtonItem(title: StringConstant.cancel.rawValue, style: .plain, target: self, action: #selector(self.cancelclick))
        let done = UIBarButtonItem(title: StringConstant.done.rawValue, style: .done, target: self, action: #selector(doneclick))
        let flexible  = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([cancel , flexible ,done], animated: false)
        dobTextField.inputAccessoryView = toolbar
        monthField.inputAccessoryView = toolbar
        yearField.inputAccessoryView = toolbar
        datePicker.preferredDatePickerStyle  = .wheels
    }

    @objc func cancelclick() {
        dobTextField.resignFirstResponder()
        monthField.resignFirstResponder()
        yearField.resignFirstResponder()
    }

    @objc func doneclick() {
        if let datePicker = dobTextField.inputView as? UIDatePicker {
            let dateFormat = DateFormatter()
            dateFormat.dateStyle = DateFormatter.Style.short
            dateFormat.dateFormat = StringConstant.Profile.dateFormate
            dateFormat.locale = Locale(identifier: StringConstant.Profile.locale)
            dateFormat.timeZone = TimeZone(identifier: StringConstant.Profile.timeZone)
            dobTextField.text = dateFormat.string(from: datePicker.date)
            monthField.text = dateFormat.string(from: datePicker.date)
            yearField.text = dateFormat.string(from: datePicker.date)
            let result = dobTextField.text!.split { $0 == "/" }
            dobTextField.text = String(result[0])
            monthField.text = String(result[1])
            yearField.text = String(result[2])
        }
        dobTextField.resignFirstResponder()
        monthField.resignFirstResponder()
        yearField.resignFirstResponder()
    }
}

// MARK: - Life Cycle Functions
extension LMUserProfileVC {

    override func initialSetup() {
        self.createpicker()
        choose.delegate = self
        hideKeyboardWhenTappedAround()
        userProfileObj.userGender = StringConstant.Profile.male
        genderSegmentControlCustom.SelectedFont = UIFont(name: StringConstant.WelcomeScreen.font, size: 14)!
        genderSegmentControlCustom.normalFont = UIFont(name: StringConstant.WelcomeScreen.font, size: 14)!
    }
}
