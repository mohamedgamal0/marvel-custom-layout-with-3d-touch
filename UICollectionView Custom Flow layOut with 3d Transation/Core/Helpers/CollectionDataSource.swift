//
//  CollectionDataSource.swift
//  UICollectionView Custom Flow layOut with 3d Transation
//
//  Created by mohamed gamal on 6/18/20.
//  Copyright © 2020 mohamed gamal. All rights reserved.
//

import UIKit

typealias ConfigureCell = (_ cell: UICollectionViewCell, _ indexPath: IndexPath, _ item: Any?) -> ()
typealias DidSelectItem = (_ indexPath: IndexPath) -> ()

struct CollectionSize {
  var size = CGSize.zero
  var edgeInsets = UIEdgeInsets.zero
  var lineSpacing = CGFloat()
  var interItemSpacing = CGFloat()
  
  init(_ size: CGSize, _ edgeInset: UIEdgeInsets, _ lineSpacing: CGFloat, _ itemSpacing: CGFloat) {
    self.size = size
    self.edgeInsets = edgeInset
    self.lineSpacing = lineSpacing
    self.interItemSpacing = itemSpacing
  }
}

enum ScreenSize: Int {
  case WIDTH
  case HEIGHT
  
  var value: CGFloat {
    switch self {
    case .WIDTH: return UIScreen.main.bounds.width
    case .HEIGHT: return UIScreen.main.bounds.height
    }
  }
  
  func cellHeightWidth(by itemSpacing: CGFloat, noOfItems: Int, sideSpacing: CGFloat) -> CGFloat {
    let valueToBeSubtracted = (sideSpacing * 2) + (itemSpacing * CGFloat(noOfItems - 1))
    let totalWidthOrHeight = self.value - valueToBeSubtracted
    let cellWidthHeight = totalWidthOrHeight / CGFloat(noOfItems)
    return cellWidthHeight
  }
}

class CollectionDataSource: NSObject {
  //MARK:- Variables
  var items: [Any]?
  var cellIdentifier: String?
  var configureCell: ConfigureCell?
  var didSelectItem: DidSelectItem?
  var collectionSize: CollectionSize?
  
  //MARK:- Initializer
  init(items: [Any]?, identifier: String, collectionSize: CollectionSize?) {
    self.items = items
    self.cellIdentifier = identifier
    self.collectionSize = collectionSize
  }
}
