//
//  LMMyProfileVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 22/06/22.
//

import UIKit
import MotionToastView

var reloadTableView : (() -> Void)?
var moveToMyPhotos : (() -> Void)?
var moveToMyName : (() -> Void)?
var presentImagePicker : ((_ imageChoose: UIImagePickerController) -> Void)?
var presentAlert : ((_ aleart1: UIAlertController) -> Void)?
var pushViewControllerGender : (() -> Void)?
var pushViewControllerHeight : (() -> Void)?
var pushViewControllerWork : (() -> Void)?
var pushViewControllerEducation : (() -> Void)?
var pushViewControllerIntrestAge : (() -> Void)?
var pushViewControllerIntrestIn : (() -> Void)?
var pushViewControllerReligious : (() -> Void)?
var pushViewControllerPolotical : (() -> Void)?
var pushViewControllerCigarettes : (() -> Void)?
var pushViewControllerBio : (() -> Void)?
var pushViewControllerAlcohol : (() -> Void)?
var pushViewControllerMarijuana : (() -> Void)?
var pushViewControllerDrugs : (() -> Void)?
var pushViewAs : (() -> Void)?
var popViewController : (() -> Void)?

class LMMyProfileVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var myProflileTableview: UITableView!

    // MARK: Properties
    var numberOfCellInSubTable = Int()
    var myProfileViewModelObj : LMMyProfileVM!
}

// MARK: - Life Cycle Methods
extension LMMyProfileVC {

    override func initialSetup() {
        myProfileViewModelObj = LMMyProfileVM()
        myProflileTableview.delegate = self
        myProflileTableview.dataSource = self
        CommonFunction.commonFunctions.setupTableviewCell(tableView: myProflileTableview, nibName: StringConstant.ViewController.lmNamePhotosTC)
        CommonFunction.commonFunctions.setupTableviewCell(tableView: myProflileTableview, nibName: StringConstant.ViewController.lmBasicInfoTC)
        CommonFunction.commonFunctions.setupTableviewCell(tableView: myProflileTableview, nibName: StringConstant.ViewController.lmMyBioTC)
        CommonFunction.commonFunctions.setupTableviewCell(tableView: myProflileTableview, nibName: StringConstant.ViewController.lmWorkEducationTC)
        CommonFunction.commonFunctions.setupTableviewCell(tableView: myProflileTableview, nibName: StringConstant.ViewController.lmPreferenceTC)
        popViewController = {
            [weak self] in
            guard let `self` = self else { return }
            self.pop()
        }
        activityMessage = {
            [weak self] in
            guard let `self` = self else { return }
            self.MotionToast(message: resultMesage ?? StringConstant.WelcomeScreen.emptyString, toastType: .success, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        }
        activityMessage2 = {
            [weak self] in
            guard let `self` = self else { return }
            self.MotionToast(message: resultMesage ?? StringConstant.WelcomeScreen.emptyString, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        }
        pushViewControllerGender = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMMyGenderVC.instantiate(fromAppStoryboard: .myProfile)
            self.push(vc: controller)
        }
        pushViewControllerHeight = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMMyHeightVC.instantiate(fromAppStoryboard: .myProfile)
            self.push(vc: controller)
        }
        pushViewControllerWork = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMMyJobVC.instantiate(fromAppStoryboard: .myProfile)
            self.push(vc: controller)
        }
        pushViewControllerEducation = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMMyEducationVC.instantiate(fromAppStoryboard: .myProfile)
            self.push(vc: controller)
        }
        pushViewControllerIntrestAge = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMMyIntrestAgeVC.instantiate(fromAppStoryboard: .myProfile)
            self.push(vc: controller)
        }
        pushViewControllerIntrestIn = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMIntrestedInVC.instantiate(fromAppStoryboard: .myProfile)
            self.push(vc: controller)
        }
        pushViewControllerReligious = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMMyReligiousBeliefVC.instantiate(fromAppStoryboard: .myProfile)
            self.push(vc: controller)
        }
        pushViewControllerBio = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMUpdateBioVC.instantiate(fromAppStoryboard: .myProfile)
            self.push(vc: controller)
        }
        pushViewControllerPolotical = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMMyPoloticalLearningVC.instantiate(fromAppStoryboard: .myProfile)
            self.push(vc: controller)
        }
        pushViewControllerCigarettes = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMMyCigaretteVC.instantiate(fromAppStoryboard: .myProfile)
            self.push(vc: controller)
        }
        pushViewControllerAlcohol = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMMyAlcoholVC.instantiate(fromAppStoryboard: .myProfile)
            self.push(vc: controller)
        }
        pushViewControllerMarijuana = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMMyMarijuanaVC.instantiate(fromAppStoryboard: .myProfile)
            self.push(vc: controller)
        }
        pushViewControllerDrugs = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMMyDrugsVC.instantiate(fromAppStoryboard: .myProfile)
            self.push(vc: controller)
        }
        pushViewAs = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMViewAsVC.instantiate(fromAppStoryboard: .myProfile)
            self.push(vc: controller)
        }
        reloadTableView = {
            [weak self] in
            guard let `self` = self else { return }
            self.myProflileTableview.reloadData()
        }
        presentImagePicker = {  [weak self] choose in
            guard let `self` = self else { return }
            self.present(choose, animated: true ,completion: nil)
        }
        presentAlert = {
            [weak self] aleart in
            guard let `self` = self else { return }
            self.present(aleart , animated: true , completion: nil)
        }
        moveToMyPhotos = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMMyPhotosVC.instantiate(fromAppStoryboard: .myProfile)
            self.push(vc: controller)
        }
        moveToMyName = {
            [weak self] in
            guard let `self` = self else { return }
            let controller = LMMyNameVC.instantiate(fromAppStoryboard: .myProfile)
            self.push(vc: controller)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        myProfileViewModelObj.eventDetailsCall()
        reloadPrefrence?()
    }
}
