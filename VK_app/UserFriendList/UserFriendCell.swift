//
//  UserFriendCell.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 28/12/2018.
//  Copyright © 2018 Nikolay.Trofimov. All rights reserved.
//

import UIKit

class UserFriendCell: UITableViewCell {
  
  @IBOutlet weak var userFriendImage: UIImageView! {
    didSet {
      userFriendImage.backgroundColor = UIColor.clear
      userFriendImage.layer.shadowColor = UIColor.black.cgColor
      userFriendImage.layer.shadowOffset = CGSize.zero
      userFriendImage.layer.shadowRadius = 8
      userFriendImage.layer.shadowOpacity = 0.5
      userFriendImage.layer.masksToBounds = false
      
      let borderView = UIView()
      borderView.frame = userFriendImage.bounds
      borderView.layer.cornerRadius = 22
      borderView.layer.borderColor = UIColor.black.cgColor
      borderView.layer.borderWidth = 0.1
      borderView.layer.masksToBounds = true
      userFriendImage.addSubview(borderView)
      
      let photoView = UIImageView()
      photoView.image = userFriendImage.image
      photoView.frame = borderView.bounds
      borderView.addSubview(photoView)
    }
  }
  
  @IBOutlet weak var userFriendLabel: UILabel! {
    didSet {
      userFriendLabel.textColor = UIColor.black
    }
  }
  
  
  // очистка перед переиспользованием
  override func prepareForReuse() {
    super.prepareForReuse()
    userFriendImage.image = nil
    userFriendLabel.text = nil
  }
  
  
  //  override func layoutSubviews() {
  //    super.layoutSubviews()
  //
  //  }
  
  
  // заполнение аватарки и имени
  func configure(name: String, avatar: UIImage) {
    userFriendLabel.text = name
    userFriendImage.image = avatar
  }
  
}
