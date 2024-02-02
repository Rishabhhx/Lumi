//
//  CollectioView Delegate + Datasource.swift
//  Lumi
//
//  Created by Rishabh Sharma on 11/05/22.

import Foundation
import UIKit

// MARK: - Collection View Delegates
extension LMHomeMapVC : UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(alleventsObj.count)
        return alleventsObj.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StringConstant.ViewController.lmEventsCardsCC, for: indexPath) as? LMEventsCardsCC
        cell?.layer.cornerRadius = 5
        cell?.fromAgeLabel.text = "\(alleventsObj[indexPath.row].ageBetween[0]) - \(alleventsObj[indexPath.row].ageBetween[1])"
        cell?.ticketNoLabel.text = String(alleventsObj[indexPath.row].availableTickets )
        cell?.eventPriceLabel.text = "$\(alleventsObj[indexPath.row].price )+"
        cell?.freeDrinksNo.text = String(alleventsObj[indexPath.row].freeDrinks )
        cell?.eventDayLabel.text = eventObj[indexPath.row].eventDay
        cell?.eventAddressLabel.text = alleventsObj[indexPath.row].eventLocation
        cell?.eventNameLabel.text = alleventsObj[indexPath.row].eventName
        cell?.attendeesNo.text = String(alleventsObj[indexPath.row].bookedTickets )
        cell?.eventImage.downloadImageFrom(link: alleventsObj[indexPath.row].eventImages[0] , contentMode: .scaleAspectFill)
        let date = CommonFunction.commonFunctions.dateGeneral(tdate: alleventsObj[indexPath.row].eventDate)
        let result = date.split { $0 == " " }
        cell?.eventDateLabel.text = String(result[0] )
        cell?.eventMonthLabel.text = String(result[1] )
        let weekday = CommonFunction.commonFunctions.getDayOfWeek(alleventsObj[indexPath.row].eventDate)
        cell?.eventDayLabel.text = String(weekday?.prefix(3) ?? "").uppercased()
        cell?.bookEvent.addTarget(self, action: #selector(bookEventAction(_:)), for: .touchUpInside)
        cell?.bookEvent.tag = indexPath.row
        return cell!
    }
    @objc private func bookEventAction(_ sender: UIButton) {
        print(sender.tag)
        if UserDefaults.standard.object(forKey: UserDefaultVar.subscription.rawValue) as? String != "subscribed" {
            let controller = LMSubscriptionVC.instantiate(fromAppStoryboard: .home)
            push(vc: controller)
            eventPriceClouser = {
                [weak self] in
                return alleventsObj[sender.tag].price
            }
            eventIdClouser = {
                [weak self] in
            return alleventsObj[sender.tag].id
            }
        } else {
            let controller = LMPaymentVC.instantiate(fromAppStoryboard: .home)
            push(vc: controller)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = LMEventDetailsVC.instantiate(fromAppStoryboard: .home)
        controller.tempEventName = alleventsObj[indexPath.row].eventName
        controller.tempFromAge = "\(alleventsObj[indexPath.row].ageBetween[0]) - \(alleventsObj[indexPath.row].ageBetween[1])"
        controller.tempPrice = "$\(alleventsObj[indexPath.row].price )+"
        controller.paymentPrice = alleventsObj[indexPath.row].price
        controller.tempfreeDrinks = alleventsObj[indexPath.row].freeDrinks
        controller.tempEventDate = alleventsObj[indexPath.row].eventDate
        controller.tempEventLocation =  alleventsObj[indexPath.row].eventLocation
        controller.tempTicketsAvilable = alleventsObj[indexPath.row].availableTickets
        controller.tempNoOfAttendees = alleventsObj[indexPath.row].bookedTickets
        controller.tempDescription = alleventsObj[indexPath.row].eventDescription
        controller.eventId = alleventsObj[indexPath.row].id
        cellNo = indexPath.row
        controller.tempLat = eventObj[indexPath.row].lat
        controller.tempLong = eventObj[indexPath.row].long
        push(vc: controller)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: eventsCollectonView.frame.width - 40, height: 220)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 10, height: eventsCollectonView.frame.height/2)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: LMCollectionHeader.identifier, for: indexPath) as? LMCollectionHeader else { return UICollectionReusableView() }
        header.configure()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapView))
        header.addGestureRecognizer(tap)
        return header
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if eventsCollectonView.contentOffset.y > homeMap.frame.height/3 {
            UIView.animate(withDuration: 0.5, animations: {
                self.whenWhereViewTopConstraint.constant = 10
                hideTopBar?()
                self.homeMap.isHidden = true
                self.view.layoutIfNeeded()
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                showTopBar?()
                self.homeMap.isHidden = false
                self.whenWhereViewTopConstraint.constant = 80
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
}
