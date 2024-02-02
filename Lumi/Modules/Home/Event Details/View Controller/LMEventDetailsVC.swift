//
//  LMEventDetailsVC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 11/05/22.
//

import UIKit
import MapKit
import AVFoundation
import AVKit

var cellNo : Int?
var eventPriceClouser : (() -> Int)?
var eventIdClouser : (() -> String)?
var hideBookClouser : (() -> Void)?
class LMEventDetailsVC: LMBaseVC, MKMapViewDelegate {

    // MARK: - Outlets
    @IBOutlet weak private(set) var mapAddress: UILabel!
    @IBOutlet weak private(set) var shareButton: UIButton!
    @IBOutlet weak private(set) var mapAddressView: UIView!
    @IBOutlet weak private(set) var ticketView: UIView!
    @IBOutlet weak private(set) var eventLocationMap: MKMapView!
    @IBOutlet weak private(set) var noOfTicketView: UIView!
    @IBOutlet weak private(set) var price: UILabel!
    @IBOutlet weak private(set) var tutorialVideoView: UIView!
    @IBOutlet weak private(set) var ticketsAvilable: UILabel!
    @IBOutlet weak private(set) var eventMap: MKMapView!
    @IBOutlet weak private(set) var fromAge: UILabel!
    @IBOutlet weak private(set) var freeDrinks: UILabel!
    @IBOutlet weak private(set) var noOfAttendees: UILabel!
    @IBOutlet weak private(set) var eventDescription: UILabel!
    @IBOutlet weak private(set) var eventLocation: UILabel!
    @IBOutlet weak private(set) var eventDate: UILabel!
    @IBOutlet weak private(set) var eventName: UILabel!
    @IBOutlet weak private(set) var pageControl: UIPageControl!
    @IBOutlet weak private(set) var myView: UIView!
    @IBOutlet weak private(set) var bookNow: UIButton!
    @IBOutlet weak private(set) var playButton: UIButton!

    // MARK: - Properties
    private(set) var pages: [Pages1] = Pages1.allCases
    private(set) var currentIndex: Int = 0
    private(set) var pageController: UIPageViewController?
    var eventId : String?
    var paymentPrice : Int?
    var tempEventName : String?
    var tempEventDate : String?
    var tempEventLocation : String?
    var tempFromAge : String?
    var tempPrice : String?
    var tempTicketsAvilable : Int?
    var tempNoOfAttendees : Int?
    var tempfreeDrinks : Int?
    var tempLat : Double?
    var tempLong : Double?
    var tempMapAddress : String?
    var tempDescription : String?
    var isAvailableToBook: Bool?

    // MARK: - IBOutlets Actions
    @IBAction private func backButton(_ sender: Any) {
        pop()
    }

    @IBAction private func bookNow(_ sender: Any) {
        let controller = LMSubscriptionVC.instantiate(fromAppStoryboard: .home)
        push(vc: controller)
    }

    @IBAction private func shareButton(_ sender: Any) {
        let activityVC =  UIActivityViewController(activityItems: ["\(tempEventName ?? StringConstant.WelcomeScreen.emptyString) \(CommonFunction.commonFunctions.dateGeneral(tdate: tempEventDate ?? ""))", sendImage?()], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    @IBAction private func playButton(_ sender: Any) {
        playButton.isHidden = true
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: StringConstant.Home.lumiTutorial, ofType: StringConstant.Home.mp4) ?? StringConstant.WelcomeScreen.emptyString))
        let layer = AVPlayerLayer(player: player)
        layer.frame = tutorialVideoView.bounds
        layer.videoGravity = .resizeAspectFill
        tutorialVideoView.layer.addSublayer(layer)
        player.volume = 0.07
        player.play()
    }
}

// MARK: - Private Functions
extension LMEventDetailsVC {

    // MARK: - Page controller setup
    private func setupPageController() {
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController?.dataSource = self
        pageController?.delegate = self
        pageController?.view.backgroundColor = .clear
        pageController?.view.frame = CGRect(x: 0,y: 0,width: myView.frame.width,height: myView.frame.height)
        addChild(pageController ?? UIViewController())
        myView.addSubview(pageController?.view ?? UIView())
        let storyBoard : UIStoryboard = UIStoryboard(name: StringConstant.ViewController.home, bundle:nil)
        guard let nextViewController = storyBoard.instantiateViewController(withIdentifier: StringConstant.ViewController.lmEventsPageVC) as? LMEventsPageVC else { return }
        nextViewController.bindData(page: pages[0])
        pageController?.setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        pageController?.didMove(toParent: self)
    }
}

// MARK: - Life Cycle Methods
extension LMEventDetailsVC {

    override func initialSetup() {
        CommonFunction.commonFunctions.viewRadius(view: eventLocationMap, radius: 5.0)
        CommonFunction.commonFunctions.viewRadius(view: mapAddressView, radius: 5.0)
        CommonFunction.commonFunctions.viewRadius(view: noOfTicketView, radius: 11.5)
        CommonFunction.commonFunctions.viewRadius(view: ticketView, radius: 11.5)
        setupPageController()
        if let name = tempEventName {
            eventName.text = name
        }
        if let tdate = tempEventDate {
            eventDate.text = CommonFunction.commonFunctions.dateGeneral(tdate: tdate)
        }
        if let loc = tempEventLocation {
            eventLocation.text = loc
            mapAddress.text = loc
        }
        if let age = tempFromAge {
            fromAge.text = age
        }
        if let tprice = tempPrice {
            price.text = String(tprice)
        }
        if let tickets = tempTicketsAvilable {
            ticketsAvilable.text = String(tickets)
        }
        if let attendees = tempNoOfAttendees {
            noOfAttendees.text = String(attendees)
        }
        if let drinks = tempfreeDrinks {
            freeDrinks.text = String(drinks)
        }
        if let description = tempDescription {
            eventDescription.text = description
        }
        eventPriceClouser = {
            return self.paymentPrice ?? 0
        }
        eventIdClouser = {
            return self.eventId ?? ""
        }
        if let bookingAvailable = self.isAvailableToBook {
            self.bookNow.isHidden = !bookingAvailable
        }
        eventMap.delegate = self
        let annotation = MKPointAnnotation()
        annotation.title = eventName.text
        annotation.coordinate = CLLocationCoordinate2DMake(alleventsObj[cellNo ?? 0].location.coordinates[0], alleventsObj[cellNo ?? 0].location.coordinates[1])
        self.eventMap.addAnnotation(annotation)
        let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(alleventsObj[cellNo ?? 0].location.coordinates[0], alleventsObj[cellNo ?? 0].location.coordinates[1])
        let span = MKCoordinateSpan.init(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        self.eventMap.setRegion(region, animated: true)
    }
}
