//
//  File.swift
//  UICollectionView Custom Flow layOut with 3d Transation
//
//  Created by mohamed gamal on 6/18/20.
//  Copyright © 2020 mohamed gamal. All rights reserved.
//

import Foundation

import UIKit

class ImageCell: UICollectionViewCell {
  
  @IBOutlet weak var imgView: UIImageView!
  
  var item: ImageClass? {
    didSet {
      imgView.image = item?.image ?? UIImage()
    }
  }
}
