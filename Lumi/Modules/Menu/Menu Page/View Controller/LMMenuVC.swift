//
//  LMMenuVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 01/06/22.
//

import UIKit

class LMMenuVC: LMBaseVC {

    // MARK: - Outlets    
    @IBOutlet weak private(set) var outerEventsView: UIView!
    @IBOutlet weak private(set) var innerEventsView: UIView!
    @IBOutlet weak private(set) var innerMaybeView: UIView!
    @IBOutlet weak private(set) var innerLumidatesView: UIView!
    @IBOutlet weak private(set) var outerSettingsView: UIView!
    @IBOutlet weak private(set) var innerSettingsView: UIView!
    @IBOutlet weak private(set) var outerLumidatesView: UIView!
    @IBOutlet weak private(set) var outerInvitesView: UIView!
    @IBOutlet weak private(set) var innerInvitesView: UIView!
    @IBOutlet weak private(set) var outerMaybeView: UIView!

    // MARK: - Functions
    @objc func tapView1() {
        goToEvents?()
    }
    @objc func tapView2() {
        goToMaybe?()
    }
    @objc func tapView3() {
        goToLumidates?()
    }
    @objc func tapView4() {
        goToSettings?()
    }
    @objc func tapView5() {
        goToInvites?()
    }
}

// MARK: - Life Cycle Methods
extension LMMenuVC {
    override func initialSetup() {
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(tapView1))
        outerEventsView.addGestureRecognizer(tap1)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(tapView2))
        outerMaybeView.addGestureRecognizer(tap2)
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(tapView3))
        outerLumidatesView.addGestureRecognizer(tap3)
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(tapView4))
        outerSettingsView.addGestureRecognizer(tap4)
        let tap5 = UITapGestureRecognizer(target: self, action: #selector(tapView5))
        outerInvitesView.addGestureRecognizer(tap5)
        CommonFunction.commonFunctions.viewArrayRadius(view: [outerEventsView,outerMaybeView,outerLumidatesView,outerSettingsView,outerInvitesView,innerInvitesView], radius: outerLumidatesView.frame.width/2)
        CommonFunction.commonFunctions.viewArrayRadius(view: [innerEventsView,innerMaybeView,innerLumidatesView,innerSettingsView,innerInvitesView], radius: innerEventsView.frame.width/2)
    }
}
