//
//  Friend.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 13/02/2019.
//  Copyright © 2019 Nikolay.Trofimov. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

//class Friend: CustomStringConvertible, Comparable {
//  var description: String {
//    return "\(first_name) \(last_name)"
//  }
//
//  let id: Int
//  let first_name: String
//  let last_name: String
//  let photo: String
//
//  init(json: JSON) {
//    self.id = json["id"].intValue
//    self.first_name = json["first_name"].stringValue
//    self.last_name = json["last_name"].stringValue
//    self.photo = json["photo_100"].stringValue
//  }
//
//  // сортировка друзей по фамилии
//  static func ==(lhs: Friend, rhs: Friend) -> Bool {
//    return lhs.last_name == rhs.last_name
//  }
//
//  static func <(lhs: Friend, rhs: Friend) -> Bool {
//    return lhs.last_name < rhs.last_name
//  }
//
//}

@objcMembers
class Friend: Object {
  dynamic var id: Int = 0
  dynamic var first_name: String = ""
  dynamic var last_name: String = ""
  dynamic var photo: String = ""
  
  convenience init(json: JSON) {
    self.init()
    self.id = json["id"].intValue
    self.first_name = json["first_name"].stringValue
    self.last_name = json["last_name"].stringValue
    self.photo = json["photo_100"].stringValue
  }
  
  override static func primaryKey() -> String? {
    return "id"
  }
  
}
