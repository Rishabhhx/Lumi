//
//  Extension.swift
//  Lumi
//
//  Created by Rishabh Sharma on 15/04/22.
//

import Foundation
import UIKit
import MotionToastView

class CommonFunction {
    static let commonFunctions = CommonFunction()

    // MARK: - Function for showing alert
    func aleart(aleartMessage : String , _ vc : UIViewController) {
        let message : String = " "
        let alertController:UIAlertController = UIAlertController(title: aleartMessage, message: message, preferredStyle: UIAlertController.Style.alert)
        let alertAction:UIAlertAction = UIAlertAction(title: StringConstant.ok.rawValue, style: UIAlertAction.Style.destructive, handler:nil)
        alertController.addAction(alertAction)
        vc.present(alertController, animated: true, completion: nil)
    }

    // MARK: - Function for setting button shadow
    func buttonShadow(buttonName : UIButton) {
        buttonName.layer.cornerRadius = 22.5
        buttonName.layer.shadowColor = ColorAssest.shadow.colorAssest.cgColor
        buttonName.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        buttonName.layer.shadowOpacity = 0.5
        buttonName.layer.shadowRadius = 6.0
        buttonName.layer.masksToBounds = false
    }

    // MARK: - Functions for setting button attributes
    func intrestButton(buttonName : UIButton) {
        buttonName.backgroundColor = ColorAssest.notSelected.colorAssest
        buttonName.layer.cornerRadius = 22.5
    }
    func buttonSelectedColorSet(_ buttonName : UIButton , userSelection : String) -> String {
        buttonName.backgroundColor = ColorAssest.selected.colorAssest
        buttonName.setTitleColor(.white, for: .normal)
        return userSelection
    }
    func buttonNotSelectedColorSet(_ buttonName : UIButton) {
        buttonName.backgroundColor = ColorAssest.notSelected.colorAssest
        buttonName.setTitleColor(ColorAssest.cloudBlue.colorAssest, for: .normal)
        buttonName.layer.cornerRadius = 22.5
    }
    func buttonNotSelectedColorSet1(_ buttonName : UIButton) {
        buttonName.backgroundColor = ColorAssest.bookSelected.colorAssest
        buttonName.setTitleColor(ColorAssest.cloudBlue.colorAssest, for: .normal)
        buttonName.layer.cornerRadius = 22.5
    }

    func viewBorderColor(viewName : UIView, borderColor : CGColor = ColorAssest.white.colorAssest.cgColor , borderWidth : CGFloat = 0, radius : CGFloat = 0) {
        viewName.layer.borderWidth = borderWidth
        viewName.layer.borderColor = borderColor
        viewName.layer.cornerRadius = radius

    }

    func buttonColorCorner(buttonName : UIButton, color : UIColor , radius : CGFloat) {
        buttonName.backgroundColor = color
        buttonName.setTitleColor(ColorAssest.cloudBlue.colorAssest, for: .normal)
        buttonName.layer.cornerRadius = radius
    }

    func viewRadius(view : UIView , radius : CGFloat) {
        view.layer.cornerRadius = radius
    }

    func viewArrayRadius(view : [UIView] , radius : CGFloat) {
        for viewArr in view {
            viewArr.layer.cornerRadius = radius
        }
    }

    // MARK: - Convert Date in Age
    func calcAge(birthday: String) -> Int {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let birthdayDate = dateFormater.date(from: birthday)
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components(.year, from: birthdayDate!, to: now, options: [])
        let age = calcAge.year
        return age!
    }

    // MARK: - Setup Tableview

    func setupTableviewCell(tableView: UITableView, nibName: String) {
            let cellNib = UINib(nibName: nibName, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: nibName)
        }

    // MARK: - Setup colllectionview
    func setupColllectionview(collectionView: UICollectionView, nibName: String) {
        let cellNib = UINib(nibName: nibName, bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: nibName)
    }

    // MARK: - Convert Date in general form
    func dateGeneral(tdate : String) -> String {
        let dateAsString = tdate
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US_POSIX")
        df.timeZone = TimeZone(identifier: "IST")
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = df.date(from: dateAsString)
        df.dateFormat = "d MMM yyyy h:mm a"
        let time12 = df.string(from: date ?? Date())
        return "\(time12)"
    }
    func dateGeneral2(tdate : String) -> String {
        let dateAsString = tdate
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US_POSIX")
        df.timeZone = TimeZone(identifier: "IST")
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = df.date(from: dateAsString)
        df.dateFormat = "d MMMM"
        let time12 = df.string(from: date ?? Date())
        return "\(time12)"
    }
    // MARK: - Get day of week
    func getDayOfWeek(_ today:String) -> String? {
        let formatter  = DateFormatter()
        formatter.locale = Locale(identifier: StringConstant.Profile.locale)
        formatter.timeZone = TimeZone(identifier: StringConstant.Profile.timeZone)
        formatter.dateFormat = StringConstant.Profile.dateFormateWithTime
        guard let todayDate = formatter.date(from: today) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        let days = [
                    "Sunday",
                    "Monday",
                    "Tuesday",
                    "Wednesday",
                    "Thursday",
                    "Friday",
                    "Saturday"
                ]
        return days[weekDay - 1]
    }
}
