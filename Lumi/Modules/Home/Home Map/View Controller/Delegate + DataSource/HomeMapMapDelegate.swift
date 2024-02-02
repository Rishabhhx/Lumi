//
//  HomeMap MapDelegate.swift
//  Lumi
//
//  Created by Rishabh Sharma on 11/05/22.
//

import Foundation
import UIKit
import MapKit

// MARK: - MapView Delegate
extension LMHomeMapVC : MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        view.image = ImageAssest.icPricePinActive.imageAssest
        let annotation = view.annotation
        var tempVar1: Int?
        for tempVar2 in 0..<mapView.annotations.count {
            if mapView.annotations[tempVar2].coordinate.longitude == annotation?.coordinate.longitude && mapView.annotations[tempVar2].coordinate.latitude == annotation?.coordinate.latitude {
                tempVar1 = tempVar2
            }
        }
        whenLabel.text = CommonFunction.commonFunctions.dateGeneral(tdate: alleventsObj[tempVar1!].eventDate)
        whereLabel.text = alleventsObj[tempVar1!].eventLocation
        print(index)
        let myIndexPath = IndexPath(row: tempVar1!, section: 0)
                        eventsCollectonView.scrollToItem(at: myIndexPath, at: .centeredHorizontally, animated: true)
                        eventsCollectonView.reloadData()
    }

    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        view.image = ImageAssest.icPricePinInactive.imageAssest
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil }
        var annotationView = map.dequeueReusableAnnotationView(withIdentifier: StringConstant.custom.rawValue)
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: StringConstant.custom.rawValue)
            annotationView?.canShowCallout = true
            annotationView?.image = ImageAssest.icPricePinInactive.imageAssest
        } else {
            annotationView?.annotation = annotation
        }
        switch annotation.title {
        case StringConstant.Home.event : annotationView?.image = ImageAssest.icPricePinInactive.imageAssest
        case StringConstant.Home.yourLocation : annotationView?.image = ImageAssest.icMapPin.imageAssest
        default : break
        }
        return annotationView
    }
}
