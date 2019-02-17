//
//  RealmFriend.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 16/02/2019.
//  Copyright © 2019 Nikolay.Trofimov. All rights reserved.
//

import Foundation
import RealmSwift

class RealmFriend: Object {
  @objc dynamic var id: Int = 0
  @objc dynamic var first_name: String = ""
  @objc dynamic var last_name: String = ""
  @objc dynamic var photo_50: String = ""
  
  convenience init(_ id: Int, _ first_name: String, _ last_name: String, _ photo_50: String) {
    self.init()
    self.id = id
    self.first_name = first_name
    self.last_name = last_name
    self.photo_50 = photo_50
  }
}
