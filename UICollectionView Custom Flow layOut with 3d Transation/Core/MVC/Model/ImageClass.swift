//
//  File.swift
//  UICollectionView Custom Flow layOut with 3d Transation
//
//  Created by mohamed gamal on 6/18/20.
//  Copyright © 2020 mohamed gamal. All rights reserved.
//

import UIKit

class ImageClass {
  var image: UIImage?
  
  init(image: UIImage?) {
    self.image = image
  }
  
  class func getImagesArray() -> [ImageClass] {
    let imagesArray = [ImageClass(image: UIImage.init(named: "w01")),
                       ImageClass(image: UIImage.init(named: "w02")),
                       ImageClass(image: UIImage.init(named: "w03")),
                       ImageClass(image: UIImage.init(named: "w04")),
                       ImageClass(image: UIImage.init(named: "w05")),
                       ImageClass(image: UIImage.init(named: "w06")),
                       ImageClass(image: UIImage.init(named: "w07")),
                       ImageClass(image: UIImage.init(named: "w08")),
                       ImageClass(image: UIImage.init(named: "w09")),
                       ImageClass(image: UIImage.init(named: "w10")),
                       ImageClass(image: UIImage.init(named: "w11")),
                       ImageClass(image: UIImage.init(named: "w12")),
                       ImageClass(image: UIImage.init(named: "w13")),
                       ImageClass(image: UIImage.init(named: "w14")),
                       ImageClass(image: UIImage.init(named: "w15"))]
    return imagesArray + imagesArray
  }
}
