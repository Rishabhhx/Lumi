//
//  Location MapDelegate.swift
//  Lumi
//
//  Created by Rishabh Sharma on 15/05/22.
//

import Foundation
import UIKit
import MapKit

// MARK: - MapView Delegate
extension LMUserLocationVC : MKMapViewDelegate, UISearchBarDelegate, CLLocationManagerDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        view.image = ImageAssest.icMapPin.imageAssest
    }
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        view.image = ImageAssest.icMapPin.imageAssest
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil }
        var annotationView = map.dequeueReusableAnnotationView(withIdentifier: StringConstant.custom.rawValue)
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: StringConstant.custom.rawValue)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        annotationView?.image = ImageAssest.icMapPin.imageAssest
        return annotationView
    }

    // MARK: - To get the current location from device
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        guard let location: CLLocation = manager.location else { return }
           debugPrint("\(locValue.latitude) \(locValue.longitude)")

        fetchCityAndCountry(from: location) { city, country, error in
                guard let city = city, let country = country, error == nil else { return }
            self.locationLable.text = "\(city), \(country)"
            debugPrint(city + ", " + country)
            }

        defaultLat = locValue.latitude
        defaultLong = locValue.longitude
        let annotation = MKPointAnnotation()
        annotation.title = self.locationLable.text
        annotation.coordinate = CLLocationCoordinate2DMake(defaultLat ?? 0.0, defaultLong ?? 0.0)
        self.myMapView.addAnnotation(annotation)
        let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(defaultLat ?? 0.0, defaultLong ?? 0.0)
        let span = MKCoordinateSpan.init(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        self.myMapView.setRegion(region, animated: true)
//        userProfileObj.userLocationCoridantes.append(defaultLat ?? 0.0)
//        userProfileObj.userLocationCoridantes.append(defaultLong ?? 0.0)
        userProfileObj.userLocationCoridantes[0] = defaultLat!
        userProfileObj.userLocationCoridantes[1] = defaultLong!
        print(userProfileObj.userLocationCoridantes)
       }

    // MARK: - SearchBar Function for getting location
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.isUserInteractionEnabled = true
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchBar.text
        locationLable.text = searchBar.text
        let activeSearch = MKLocalSearch(request: searchRequest )
        activeSearch.start { (response , _) in
            if response == nil {
                debugPrint(StringConstant.error.rawValue)
            } else {
                guard let latitude = response?.boundingRegion.center.latitude else {return}
                guard let longitude = response?.boundingRegion.center.longitude else {return}
                if userProfileObj.userLocationCoridantes.count == 2 {
                    userProfileObj.userLocationCoridantes[0] = latitude
                    userProfileObj.userLocationCoridantes[1] = longitude
                } else {
                    userProfileObj.userLocationCoridantes.append(latitude)
                    userProfileObj.userLocationCoridantes.append(longitude)
                }
                let annotation = MKPointAnnotation()
                annotation.title = searchBar.text
                annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
                self.myMapView.addAnnotation(annotation)
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
                let span = MKCoordinateSpan.init(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: coordinate, span: span)
                self.myMapView.setRegion(region, animated: true)
            }
        }
    }
}
