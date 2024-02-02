//
//  UIImageExtensuin.swift
//  Lumi
//
//  Created by Rishabh Sharma on 27/05/22.
//

import UIKit
extension UIImageView {
    func downloadImageFrom(link:String, contentMode: UIView.ContentMode) {
        guard let resourceURL = URL(string: link) else {
            return
        }
        let request = URLRequest(url: resourceURL)
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, _) in
            if let data = data {
                DispatchQueue.main.sync {
                    self.contentMode =  contentMode
                    self.image = UIImage(data: data)
                }
            }
        }
        dataTask.resume()
    }
    func downloadImageFromFirebase(link:String, contentMode: UIView.ContentMode) {
        guard let urlString = URL(string: link) else {
            return
        }
        let task = URLSession.shared.dataTask(with: urlString, completionHandler: { data,_ ,error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.contentMode =  contentMode
                self.image = UIImage(data: data)
            }
        })
        task.resume()
        reloadCollectionView?()
    }
}
