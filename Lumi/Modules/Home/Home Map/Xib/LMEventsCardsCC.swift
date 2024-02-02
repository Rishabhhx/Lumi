//
//  LMEventsCardsCC.swift
//  Lumi
//
//  Created by Rishabh Sharma on 06/05/22.
//

import UIKit
var eventNo : ((_ eventNo : Int) -> Void)?
class LMEventsCardsCC: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak private(set) var eventImage: UIImageView!
    @IBOutlet weak private(set) var fromAgeView: UIView!
    @IBOutlet weak private(set) var ticketNoView: UIView!
    @IBOutlet weak private(set) var ticketAvailableView: UIView!
    @IBOutlet weak private(set) var bookEvent: UIButton!
    @IBOutlet weak private(set) var ticketNoLabel: UILabel!
    @IBOutlet weak private(set) var eventPriceLabel: UILabel!
    @IBOutlet weak private(set) var fromAgeLabel: UILabel!
    @IBOutlet weak private(set) var freeDrinksNo: UILabel!
    @IBOutlet weak private(set) var attendeesNo: UILabel!
    @IBOutlet weak private(set) var eventDayLabel: UILabel!
    @IBOutlet weak private(set) var eventDateLabel: UILabel!
    @IBOutlet weak private(set) var eventMonthLabel: UILabel!
    @IBOutlet weak private(set) var eventAddressLabel: UILabel!
    @IBOutlet weak private(set) var eventNameLabel: UILabel!

    // MARK: - Variables
    var numberMyEvents : Int = 1
    @IBAction private func bookEvent(_ sender: Any) {
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: bookEvent, color: ColorAssest.bookSelected.colorAssest, radius: 17.5)
        bookEvent.setTitle(StringConstant.Home.booked, for: .normal)
        numberMyEvents += 1
        EventsBook.shared.myEventsTotal = numberMyEvents
        showMyEvents?()
        eventNo?(numberMyEvents)
    }
}

// MARK: - Life Cycle Methods
extension LMEventsCardsCC {
    override func awakeFromNib() {
        super.awakeFromNib()
        bookEvent.backgroundColor = ColorAssest.redButton.colorAssest
        bookEvent.layer.cornerRadius = 17.5
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: bookEvent, color: ColorAssest.redButton.colorAssest, radius: 17.5)
        fromAgeView.layer.cornerRadius = 11.2
        ticketNoView.layer.cornerRadius = 11.2
        ticketAvailableView.layer.cornerRadius = 11.2
        CommonFunction.commonFunctions.viewRadius(view: fromAgeView, radius: 11.2)
        CommonFunction.commonFunctions.viewRadius(view: ticketNoView, radius: 11.2)
        CommonFunction.commonFunctions.viewRadius(view: ticketAvailableView, radius: 11.2)
    }
    override func prepareForReuse() {
        CommonFunction.commonFunctions.buttonColorCorner(buttonName: bookEvent, color: ColorAssest.redButton.colorAssest, radius: 17.5)
        bookEvent.setTitle("Book", for: .normal)
    }
}
