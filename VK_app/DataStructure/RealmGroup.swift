//
//  RealmGroup.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 17/02/2019.
//  Copyright © 2019 Nikolay.Trofimov. All rights reserved.
//

import Foundation
import RealmSwift

class RealmGroup: Object {
  @objc dynamic var id: Int = 0
  @objc dynamic var name: String = ""
  @objc dynamic var photo: String = ""
  
  convenience init(_ id: Int, _ name: String, _ photo: String) {
    self.init()
    self.id = id
    self.name = name
    self.photo = photo
  }
}
