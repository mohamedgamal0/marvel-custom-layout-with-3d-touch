//
//  MainVC.swift
//  UICollectionView Custom Flow layOut with 3d Transation
//
//  Created by mohamed gamal on 6/18/20.
//  Copyright © 2020 mohamed gamal. All rights reserved.
//

import UIKit

class MainVC: UIViewController, FillingLayoutDelegate {
    //MARK:- IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK:-Variables
    var dataSource: CollectionDataSource?
    var images = ImageClass.getImagesArray()
    var peekedData: ImageClass?
    
    private var numberOfSingleCell = 0
    private var lastSingleCellPosition = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.12, green: 0.13, blue: 0.14, alpha: 1.00)
        collectionViewConfigure()
        if let layout = self.collectionView.collectionViewLayout as? FillingLayout
        {
            layout.delegate = self
        }
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: collectionView)
        }
    }
    
}

//MARK:- VCFuncs
extension MainVC {
    func collectionViewConfigure() {
        let widthHeight = ScreenSize.WIDTH.cellHeightWidth(by: 2, noOfItems: 3, sideSpacing: 2)
        let collectionSIze = CollectionSize.init(CGSize.init(width: widthHeight, height: widthHeight), UIEdgeInsets.init(top: 2, left: 2, bottom: 2, right: 2), 2, 2)
        dataSource = CollectionDataSource.init(items: images, identifier: Identfier.ImageCell.rawValue, collectionSize: collectionSIze)
        
        dataSource?.configureCell = { (cell, indexPath, item) in
            (cell as? ImageCell)?.item = item as? ImageClass
        }
        
        dataSource?.didSelectItem = { (indexPath) in
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let destVC = storyboard.instantiateViewController(withIdentifier: "DetailVC")
            (destVC as? DetailVC)?.imgData = self.images[indexPath.item]
            self.present(destVC, animated: true, completion: nil)
        }
        
        collectionView.delegate = dataSource
        collectionView.dataSource = dataSource
        collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView:UICollectionView,sizeForViewAtIndexPath indexPath:IndexPath) ->Int{
        
        // 4,9,16,21,28
        if (numberOfSingleCell == 0 && indexPath.row == 4) ||
            (numberOfSingleCell % 2 != 0 && indexPath.row == lastSingleCellPosition + 5) ||
            (numberOfSingleCell % 2 == 0 && indexPath.row == lastSingleCellPosition + 7)
        {
            numberOfSingleCell += 1
            lastSingleCellPosition = indexPath.row
            return 2
        }
        
        return 1
    }
    
    func numberOfColumnsInCollectionView(collectionView:UICollectionView) ->Int{
        return 3
    }
}

//MARK:- UIViewcontrollerPreview Delegate
extension MainVC: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let selectedIndexPath = collectionView.indexPathForItem(at: location)
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let destVC = storyboard.instantiateViewController(withIdentifier: "PreviewVC")
        destVC.preferredContentSize = CGSize.init(width: ScreenSize.WIDTH.value, height: ScreenSize.WIDTH.value)
        peekedData = images[selectedIndexPath?.row ?? 0]
        (destVC as? PreviewVC)?.imgData = peekedData
        (destVC as? PreviewVC)?.initiatingVCRefrence = self
        navigationController?.pushViewController(destVC, animated: true)
        return destVC
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let destVC = storyboard.instantiateViewController(withIdentifier: "DetailVC")
        (destVC as? DetailVC)?.imgData = peekedData
        show(destVC, sender: self)
    }
}
