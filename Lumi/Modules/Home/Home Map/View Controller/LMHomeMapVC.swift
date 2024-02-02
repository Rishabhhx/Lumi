//
//  LMMenuVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 05/05/22.
//

import UIKit
import MapKit
import CoreMIDI

var showMyEvents : (() -> Void)?
var selectedCell : (() -> Int)?
var showAnnotations : (() -> Void)?

class LMHomeMapVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var whenLabel: UILabel!
    @IBOutlet weak private(set) var whereLabel: UILabel!
    @IBOutlet weak private(set) var listView: UIView!
    @IBOutlet weak private(set) var homeMap: MKMapView!
    @IBOutlet weak private(set) var eventsCollectonView: UICollectionView!
    @IBOutlet weak private(set) var collectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private(set) var listViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak private(set) var collectionViewBottomeconstraint: NSLayoutConstraint!
    @IBOutlet weak private(set) var noOfEventsView: UIView!
    @IBOutlet weak private(set) var noOfEventsLabel: UILabel!
    @IBOutlet weak private(set) var myEventsView: UIView!
    @IBOutlet weak private(set) var whenWhereView: UIView!
    @IBOutlet weak private(set) var whenWhereViewTopConstraint: NSLayoutConstraint!

    // MARK: - Variables
    let map = MKMapView()
    var currentVisibleCell : Int?
    var homeMapViewModelObj : LMHomeMapVM!
    var isComingFromXYz: Bool = false

    // MARK: - Outtet Actions
    @IBAction private func listButton(_ sender: Any) {
        listView.isHidden = true
        if let layout = eventsCollectonView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.collectionViewHeightConstraint.constant = self.homeMap.frame.height - 130
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

// MARK: - Private Functions
extension LMHomeMapVC {

    @objc func tapView() {
        if let layout = eventsCollectonView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.collectionViewHeightConstraint.constant = self.homeMap.frame.height/3
            self.view.layoutIfNeeded()
        }, completion: nil)
        listView.isHidden = false
        homeMap.isHidden = false
    }

    private func addCustomPin() {
        let pin = MKPointAnnotation()
        map.addAnnotation(pin)
    }
}

// MARK: - Life Cycle Methods
extension LMHomeMapVC {

    override func initialSetup() {
        homeMapViewModelObj = LMHomeMapVM()
        homeMapViewModelObj.eventDetailsCall()
        debugPrint(alleventsObj.count)
        map.delegate = self
        noOfEventsView.layer.cornerRadius = 24/2
        CommonFunction.commonFunctions.setupColllectionview(collectionView: eventsCollectonView, nibName: StringConstant.ViewController.lmEventsCardsCC)
        if let totalEve = EventsBook.shared.myEventsTotal {
            noOfEventsLabel.text = String(totalEve)
        }
        showMyEvents = {
            [weak self] in
            guard let `self` = self else { return }
            self.myEventsView.isHidden = false
            self.view.layoutIfNeeded()
        }
        showAnnotations = {
            [weak self] in
            guard let `self` = self else { return }
            //                let myLocAnnotation = MKPointAnnotation()
            //                myLocAnnotation.title = StringConstant.Home.yourLocation
            for noOfPoints in 0..<alleventsObj.count {
                let evenLocAnnotation = MKPointAnnotation()
                evenLocAnnotation.title = String(alleventsObj[noOfPoints].price)
                evenLocAnnotation.coordinate = CLLocationCoordinate2DMake(alleventsObj[noOfPoints].location.coordinates[0], alleventsObj[noOfPoints].location.coordinates[1])
                self.homeMap.addAnnotation(evenLocAnnotation)
            }
            //                myLocAnnotation.coordinate = CLLocationCoordinate2DMake(28.606353, 77.361946)
            //                self.homeMap.addAnnotation(myLocAnnotation)
            let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(28.606353, 77.361946)
            //                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(userProfileObj.userLocationCoridantes[0], userProfileObj.userLocationCoridantes[1])
            let span = MKCoordinateSpan.init(latitudeDelta: 0.1, longitudeDelta: 0.1)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            self.homeMap.setRegion(region, animated: true)
            self.addCustomPin()
            self.eventsCollectonView.reloadData()
        }
        eventsCollectonView.register(LMCollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: LMCollectionHeader.identifier)
        myEventsView.isHidden = true
        eventsCollectonView.delegate = self
        eventsCollectonView.dataSource = self
        homeMap.delegate = self
        listView.layer.cornerRadius = 5
    }
}
