//
//  RealmFriendPhoto.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 17/02/2019.
//  Copyright © 2019 Nikolay.Trofimov. All rights reserved.
//

import Foundation
import RealmSwift

class RealmFriendPhoto: Object {
  @objc dynamic var id: Int = 0
  @objc dynamic var type: String = ""
  @objc dynamic var url: String = ""
  @objc dynamic var width: Int = 0
  @objc dynamic var heigth: Int = 0
  
  convenience init(_ id: Int, _ type: String, _ url: String, _ width: Int, _ heigth: Int) {
    self.init()
    self.id = id
    self.type = type
    self.url = url
    self.width = width
    self.heigth = heigth
  }
}
