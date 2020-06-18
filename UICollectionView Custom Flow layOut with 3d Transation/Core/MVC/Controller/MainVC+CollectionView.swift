//
//  MainVC+CollectionView.swift
//  UICollectionView Custom Flow layOut with 3d Transation
//
//  Created by mohamed gamal on 6/18/20.
//  Copyright © 2020 mohamed gamal. All rights reserved.
//

import UIKit

//MARK:- UICollectionView DataSource
extension CollectionDataSource: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier ?? "", for: indexPath)
    configureCell?(cell, indexPath, items?[indexPath.row])
    return cell
  }
}

//MARK:- UICollectionViewDelegate
extension CollectionDataSource: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    didSelectItem?(indexPath)
  }
}
