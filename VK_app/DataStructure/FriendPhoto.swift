//
//  FriendPhoto.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 16/02/2019.
//  Copyright © 2019 Nikolay.Trofimov. All rights reserved.
//

import Foundation


import SwiftyJSON

class FriendPhoto: CustomStringConvertible {
  var description: String {
    return "\(url)"
  }
  
  let id: Int
  let type: String
  let url: String
  let width: Int
  let height: Int
  
  init(json: JSON) {
    self.id = json["id"].intValue
    self.type = json["sizes"]["type"].stringValue
    self.url = json["sizes"][2]["url"].stringValue
    self.width = json["sizes"]["width"].intValue
    self.height = json["sizes"]["height"].intValue
  }
  
}
