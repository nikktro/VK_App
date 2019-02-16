//
//  Friend.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 13/02/2019.
//  Copyright © 2019 Nikolay.Trofimov. All rights reserved.
//

import Foundation
import SwiftyJSON

class Friend: CustomStringConvertible, Comparable {
  var description: String {
    return "\(first_name) \(last_name)"
  }

  let id: Int
  let first_name: String
  let last_name: String
  let photo_50: String
  let photo_200_orig: String

  init(json: JSON) {
    self.id = json["id"].intValue
    self.first_name = json["first_name"].stringValue
    self.last_name = json["last_name"].stringValue
    self.photo_50 = json["photo_50"].stringValue
    self.photo_200_orig = json["photo_200_orig"].stringValue
  }
  
  // сортировка друзей по фамилии
  static func ==(lhs: Friend, rhs: Friend) -> Bool {
    return lhs.last_name == rhs.last_name
  }
  
  static func <(lhs: Friend, rhs: Friend) -> Bool {
    return lhs.last_name < rhs.last_name
  }

}





//{
//  "response": {
//    "count": 93,
//    "items": [
//    {
//    "id": 42499,
//    "first_name": "Сандра",
//    "last_name": "Осипова",
//    "is_closed": false,
//    "can_access_closed": true,
//    "photo_50": "https://pp.userapi.com/c633529/v633529499/23884/SV2WbSTspzk.jpg?ava=1",
//    "online": 0
//    },
//    {
//    "id": 56728,
//    "first_name": "Владимир",
//    "last_name": "Панжин",
//    "is_closed": false,
//    "can_access_closed": true,
//    "photo_50": "https://pp.userapi.com/c852128/v852128892/3ba08/hMP8tRyCLY8.jpg?ava=1",
//    "online": 0
//    },
//{
