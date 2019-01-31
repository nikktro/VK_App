//
//  GalleryViewCell.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 31/01/2019.
//  Copyright © 2019 Nikolay.Trofimov. All rights reserved.
//

import UIKit




class GalleryViewCell: UICollectionViewCell {
  
  @IBOutlet weak var galleryImage: UIImageView!
  
  override func awakeFromNib() {
    
        // отключил анимацию чтобы работал segue
        // обработка нажатий на фотографию
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapOnPhoto))
        tap.numberOfTapsRequired = 1
        galleryImage.isUserInteractionEnabled = true
        galleryImage.addGestureRecognizer(tap)
    
    
  }
  
  @objc func tapOnPhoto(_ sender: AnyObject) {
    
    // уменьшение
    let animation1 = CASpringAnimation(keyPath: "transform.scale")
    animation1.fromValue = 1
    animation1.toValue = 0.9
    animation1.beginTime = CACurrentMediaTime()
    animation1.stiffness = 100
    animation1.mass = 1
    animation1.duration = 0.5
    galleryImage.layer.add(animation1, forKey: nil)
    
    // увеличение
    let animation2 = CASpringAnimation(keyPath: "transform.scale")
    animation2.fromValue = 0.9
    animation2.toValue = 1
    animation2.beginTime = CACurrentMediaTime() + 0.5
    animation2.stiffness = 200
    animation2.mass = 1
    animation2.duration = 1
    galleryImage.layer.add(animation2, forKey: nil)
    
  }
  
  
}
