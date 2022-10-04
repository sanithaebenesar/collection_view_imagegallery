//
//  ViewController.swift
//  collectionviewImagegallery
//
//  Created by CH 002 on 29/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var foodcollectionview: UICollectionView!
    var imagegallery = ["image1","image2","image3","image4","image5","image6","image1","image2","image3","image4","image5","image6","image1","image2","image3","image4","image5","image6","image1","image2","image3","image4","image5","image6","image1","image2","image3","image4","image5","image6","image1","image2","image3","image4","image5","image6","image1","image2","image3","image4","image5","image6","image1","image2","image3","image4","image5","image6"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodcollectionview.dataSource = self
        foodcollectionview.delegate = self
    }


}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagegallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCollectionViewCell", for: indexPath) as! foodCollectionViewCell
        cell.foodimage.image = UIImage(named: imagegallery[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = foodcollectionview.bounds.width
        
        if UIDevice.current.orientation.isLandscape {
            return CGSize(width:( width/8 - 2), height: (width/8 - 2))
        }
        
        return CGSize(width:( width/4 - 2), height: (width/4 - 2))
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 2, bottom: 0, right: 2)
    }
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        foodcollectionview.reloadData()
        
    }
    
}
