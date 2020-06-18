//
//  DetailVC.swift
//  UICollectionView Custom Flow layOut with 3d Transation
//
//  Created by mohamed gamal on 6/18/20.
//  Copyright © 2020 mohamed gamal. All rights reserved.
//

import UIKit


class DetailVC: UIViewController {
  //MARK:- IBOutlets
  @IBOutlet weak var imgView: UIImageView!
  @IBOutlet weak var lblName: UILabel!
  @IBOutlet weak var lblDesc: UILabel!
  
  //MARK:- Variables
  var imgData: ImageClass?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imgView.image = imgData?.image ?? UIImage()
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  @IBAction func btnCloseAction(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
}
