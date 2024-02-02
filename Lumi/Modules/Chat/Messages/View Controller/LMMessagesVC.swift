//
//  LMMessagesVCViewController.swift
//  Lumi
//
//  Created by Rishabh Sharma on 21/06/22.
//

import UIKit
import MessageKit

class LMMessagesVC: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {

    // MARK: - Properties
    let currentUser = Sender(senderId: StringConstant.Menu.selfUser, displayName: userProfileObj.userName ?? "" )
    let otherUser = Sender(senderId: StringConstant.Menu.others, displayName: "Shreya Saini")
    var messsages = [MessageType]()

    struct Sender: SenderType {
        var senderId: String
        var displayName: String
    }

    struct Message: MessageType {
        var sender: SenderType
        var messageId: String
        var sentDate: Date
        var kind: MessageKind
    }
}

// MARK: - Life Cycle Methods
extension LMMessagesVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        addViewOnTop()
        self.view.backgroundColor = ColorAssest.eventBar.colorAssest
        let subview = UIView()
        view.addSubview(subview)
        messagesCollectionView.contentInset.top = 80
        messsages.append(Message(sender: currentUser, messageId: "1", sentDate: Date().addingTimeInterval(-86400), kind: .text("Heyy🙂")))
        messsages.append(Message(sender: otherUser, messageId: "2", sentDate: Date().addingTimeInterval(-86400), kind: .text("Hii")))
        messsages.append(Message(sender: currentUser, messageId: "3", sentDate: Date().addingTimeInterval(-86400), kind: .text("Are you ready for the event?")))
        messsages.append(Message(sender: otherUser, messageId: "4", sentDate: Date().addingTimeInterval(-86400), kind: .text("Yes i am bringing my friends with me also!")))
        messsages.append(Message(sender: currentUser, messageId: "5", sentDate: Date().addingTimeInterval(-86400), kind: .text("At what time will you reach there?")))
        messsages.append(Message(sender: otherUser, messageId: "6", sentDate: Date().addingTimeInterval(-86400), kind: .text("Around 10:00 PM")))
        messsages.append(Message(sender: currentUser, messageId: "7", sentDate: Date().addingTimeInterval(-86400), kind: .text("Great I will see you there")))
        messsages.append(Message(sender: otherUser, messageId: "8", sentDate: Date().addingTimeInterval(-86400), kind: .text("☺️")))
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
}

// MARK: - Private Functions
extension LMMessagesVC {

    func currentSender() -> SenderType {
        return currentUser
    }

    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? ColorAssest.otpBorder.colorAssest : ColorAssest.answerButton3.colorAssest
        }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messsages[indexPath.section]
    }

    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messsages.count
    }

    func addViewOnTop() {
        let selectableView = UIView(frame: CGRect(x: 0, y: 60, width: self.view.bounds.width, height: 40))
        selectableView.backgroundColor = .white
        let randomViewLabel = UILabel(frame: CGRect(x: self.view.bounds.width/2.7, y: selectableView.frame.height/2, width: 100, height: 16))
        randomViewLabel.text = "Shreya Saini"
        selectableView.addSubview(randomViewLabel)
        view.addSubview(selectableView)
    }
}
