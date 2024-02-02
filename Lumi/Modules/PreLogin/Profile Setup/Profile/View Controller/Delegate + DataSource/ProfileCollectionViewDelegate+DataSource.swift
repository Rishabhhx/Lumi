//
//  Profile CollectionView Delegate + DataSource.swift
//  Lumi
//
//  Created by Rishabh Sharma on 10/05/22.
//

import Foundation
import UIKit

// MARK: - CollectionView Delegate and DataSource
extension LMProfileVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return statusList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = statusCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? LMStatusBarCC else { return UICollectionViewCell() }
        cell.myimage.image = UIImage(named: statusList[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 22
    }
}
