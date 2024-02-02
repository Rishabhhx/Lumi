//
//  MatchSelectedCollectionView.swift
//  Lumi
//
//  Created by Rishabh Sharma on 23/05/22.
//

import UIKit

// MARK: - CollectionView Delegate and Datasource
extension LMLumidateSelectedVC : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == profileCollectionview {
            return allLumiUserDetailsObj?.profilePicture.count ?? 0
        } else {
            return 4
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == profileCollectionview {
            guard let cell = profileCollectionview.dequeueReusableCell(withReuseIdentifier: StringConstant.ViewController.lmMatchesImagesCC, for: indexPath) as? LMMatchesImagesCC else { return UICollectionViewCell() }
            cell.profileImage.downloadImageFrom(link: allLumiUserDetailsObj?.profilePicture[indexPath.row] ?? StringConstant.WelcomeScreen.emptyString, contentMode: .scaleAspectFill)
            pageControl.numberOfPages = allLumiUserDetailsObj?.profilePicture.count ?? 1
            pageControl.currentPage = 0
            return cell
        } else {
            guard let cell = bioCollectionView.dequeueReusableCell(withReuseIdentifier: StringConstant.ViewController.lmUserBioCC, for: indexPath) as? LMUserBioCC else { return UICollectionViewCell() }
            cell.questionLabel.text = questionArr[indexPath.row]
            cell.answerLabel.text = allLumiUserDetailsObj?.bio[indexPath.row]
            switch indexPath.row {
            case 0 :
                cell.answerLabel.textColor = ColorAssest.answerButton.colorAssest
                cell.answerLabel.layer.backgroundColor = ColorAssest.answerButton.colorAssest.withAlphaComponent(0.2).cgColor
            case 1 :
                cell.answerLabel.textColor = ColorAssest.answerButton2.colorAssest
                cell.answerLabel.layer.backgroundColor = ColorAssest.answerButton2.colorAssest.withAlphaComponent(0.2).cgColor
            case 2 :
                cell.answerLabel.textColor = ColorAssest.answerButton3.colorAssest
                cell.answerLabel.layer.backgroundColor = ColorAssest.answerButton3.colorAssest.withAlphaComponent(0.2).cgColor
            case 3 :
                cell.answerLabel.textColor = ColorAssest.answerButton4.colorAssest
                cell.answerLabel.layer.backgroundColor = ColorAssest.answerButton4.colorAssest.withAlphaComponent(0.2).cgColor
            default :
                cell.answerLabel.textColor = ColorAssest.answerButton4.colorAssest
                cell.answerLabel.layer.backgroundColor = ColorAssest.answerButton4.colorAssest.withAlphaComponent(0.2).cgColor
            }
            return cell
        }
    }
}

// MARK: Collectionview Flow Layout
extension LMLumidateSelectedVC : UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == profileCollectionview {
           return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        } else {
            return CGSize(width: collectionView.frame.width - 50 , height: collectionView.frame.height)
        }
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == profileCollectionview {
            self.pageControl.currentPage = indexPath.row
        } else { }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == profileCollectionview {
            return 6
        } else {
            return 15
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
            pageControl.reloadInputViews()
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
