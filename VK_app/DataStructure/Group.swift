//
//  GroupStruct.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 13/02/2019.
//  Copyright © 2019 Nikolay.Trofimov. All rights reserved.
//

import Foundation
import SwiftyJSON

class Group: CustomStringConvertible {
  var description: String {
    return "\(id): \(name)"
  }
  
  let id: Int
  let name: String
  let photo: String
  
  init(json: JSON) {
    self.id = json["id"].intValue
    self.name = json["name"].stringValue
    self.photo = json["photo_100"].stringValue
  }

}
