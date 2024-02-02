//
//  LMBookingDetailsVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 09/06/22.
//

import UIKit
import MapKit

class LMBookingDetailsVC: LMBaseVC {

    // MARK: Outlets
    @IBOutlet weak private(set) var bookingId: UILabel!
    @IBOutlet weak private(set) var eventImage: UIImageView!
    @IBOutlet weak private(set) var qrcodeImage: UIImageView!
    @IBOutlet weak private(set) var eventPrice: UILabel!
    @IBOutlet weak private(set) var eventLocation: UILabel!
    @IBOutlet weak private(set) var eventName: UILabel!
    @IBOutlet weak private(set) var openMap: UIImageView!
    @IBOutlet weak private(set) var eventTotalPrice: UILabel!
    @IBOutlet weak private(set) var eventTax: UILabel!
    @IBOutlet weak private(set) var eventDate: UILabel!
    @IBOutlet weak private(set) var eventDate2: UILabel!
    @IBOutlet weak private(set) var eventLocation2: UILabel!

    // MARK: - Properties
    var selectedUser : Int?

    // MARK: - IBoutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }
}

// MARK: - Private Functions
extension LMBookingDetailsVC {

    @objc func tapView1() {
        let lat1 : CLLocationDegrees = allBookingEventsObj[selectedUser ?? 0].eventID.location.coordinates[0]
        let lng1 : CLLocationDegrees = allBookingEventsObj[selectedUser ?? 0].eventID.location.coordinates[1]
        let latitude:CLLocationDegrees =  lat1
        let longitude:CLLocationDegrees =  lng1
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name =  allBookingEventsObj[selectedUser ?? 0].eventID.eventLocation
        mapItem.openInMaps(launchOptions: options)
    }
}

// MARK: - Life Cycle Methods
extension LMBookingDetailsVC {

    override func initialSetup() {
        eventName.text = allBookingEventsObj[selectedUser ?? 2].eventID.eventName
        eventLocation.text = allBookingEventsObj[selectedUser ?? 2].eventID.eventLocation
        eventLocation2.text = allBookingEventsObj[selectedUser ?? 2].eventID.eventLocation
        eventDate.text = CommonFunction.commonFunctions.dateGeneral(tdate: allBookingEventsObj[selectedUser ?? 2].eventID.eventDate)
        eventDate2.text = CommonFunction.commonFunctions.dateGeneral(tdate: allBookingEventsObj[selectedUser ?? 2].eventID.eventDate)
        eventImage.downloadImageFrom(link: allBookingEventsObj[selectedUser ?? 2].eventID.eventImages[0], contentMode: .scaleAspectFill)
        eventPrice.text = String("$\(allBookingEventsObj[selectedUser ?? 2].eventID.price)")
        eventTax.text = String("$\(allBookingEventsObj[selectedUser ?? 2].paymentID.payTax)")
        eventTotalPrice.text = String("$\(allBookingEventsObj[selectedUser ?? 2].paymentID.grandTotal)")
        bookingId.text = String("\(StringConstant.Menu.bookingID) \(allBookingEventsObj[selectedUser ?? 2].eventBookingCode)")
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(tapView1))
        openMap.addGestureRecognizer(tap1)
        openMap.isUserInteractionEnabled = true
    }
}
