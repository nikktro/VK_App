//
//  FriendImageCell.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 28/12/2018.
//  Copyright © 2018 Nikolay.Trofimov. All rights reserved.
//

import UIKit

class FriendImageCell: UICollectionViewCell {
  
  @IBOutlet weak var friendImage: UIImageView!
  
  override func awakeFromNib() {
    
    // обработка нажатий на фотографию
    let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapOnPhoto))
    tap.numberOfTapsRequired = 1
    friendImage.isUserInteractionEnabled = true
    friendImage.addGestureRecognizer(tap)
  }
  
  @objc func tapOnPhoto(_ sender: AnyObject) {
    //print("tap")
    // уменьшение
    let animation1 = CASpringAnimation(keyPath: "transform.scale")
    animation1.fromValue = 1
    animation1.toValue = 0.9
    animation1.beginTime = CACurrentMediaTime()
    animation1.stiffness = 100
    animation1.mass = 1
    animation1.duration = 0.5
    friendImage.layer.add(animation1, forKey: nil)
    
    // увеличение
    let animation2 = CASpringAnimation(keyPath: "transform.scale")
    animation2.fromValue = 0.9
    animation2.toValue = 1
    animation2.beginTime = CACurrentMediaTime() + 0.5
    animation2.stiffness = 200
    animation2.mass = 1
    animation2.duration = 1
    //animation2.fillMode = CAMediaTimingFillMode.forwards
    friendImage.layer.add(animation2, forKey: nil)
    
  }

}
