//
//  LMUserLocationVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 17/04/22.
//

import UIKit
import MapKit
import MotionToastView
import CoreLocation

class LMUserLocationVC: LMBaseVC {

    // MARK: - Outlets
    @IBOutlet weak private(set) var searchView: UIView!
    @IBOutlet private(set) weak var myMapView: MKMapView!
    @IBOutlet weak private(set) var locationLable: UILabel!

    // MARK: - Properties
    let searchController = UISearchController(searchResultsController: nil)
    let map = MKMapView()
    let locationManager = CLLocationManager()
    var defaultLat : Double?
    var defaultLong : Double?

    // MARK: - IBOutlets Actions
    @IBAction private func searchButton(_ sender: Any) {
        searchController.searchBar.delegate = self
        present(searchController, animated: true , completion: nil)
    }

    // MARK: - Entering location and moving to next controller
    @IBAction private func nextButton(_ sender: Any) {
        debugPrint(userProfileObj.userLocationCoridantes)
        guard let location = locationLable.text else {return}
        if location.isEmpty {
            MotionToast(message: StringConstant.Profile.locationEmpty, toastType: .error, duration: .long, toastStyle: .style_vibrant, toastGravity: .top, toastCornerRadius: 22, pulseEffect: true)
        } else {
            userProfileObj.userLocationName = locationLable.text
            nextPage?()
            searchController.searchBar.isHidden = true
        }
    }
}

// MARK: - Private Functions
extension LMUserLocationVC {

    // MARK: - To get the city and country name
    func fetchCityAndCountry(from location: CLLocation, completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> Void) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            completion(placemarks?.first?.locality,
                       placemarks?.first?.country,
                       error)
        }
    }

    func addCustomPin() {
        let pin = MKPointAnnotation()
        map.addAnnotation(pin)
    }
}

// MARK: - Life Cycle Methods
extension LMUserLocationVC {

    override func initialSetup() {
        userProfileObj.userLocationCoridantes.append(0.0)
        userProfileObj.userLocationCoridantes.append(1.0)
        map.delegate = self
        myMapView.delegate = self
        addCustomPin()
        searchView.layer.borderWidth = 0.5
        searchView.layer.borderColor = ColorAssest.lightWhite.colorAssest.cgColor
        searchView.layer.cornerRadius = 5
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
}
