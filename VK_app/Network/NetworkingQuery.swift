//
//  NetworkingQuery.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 10/02/2019.
//  Copyright © 2019 Nikolay.Trofimov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let apiScheme = "https"
let apiHost = "api.vk.com"
let apiVersion = "5.92"


class NetworkingQuery {

public func apiUserGroupListURLSession() {
  
  let path = "/method/groups.get"
  
  // Конфигурация по умолчанию, собственная сессия
  let configuration = URLSessionConfiguration.default
  let session =  URLSession(configuration: configuration)
  
  var urlComponents = URLComponents()
  urlComponents.scheme = apiScheme
  urlComponents.host = apiHost
  urlComponents.path = path
  urlComponents.queryItems = [
    URLQueryItem(name: "access_token", value: Session.shared.token),
    URLQueryItem(name: "extended", value: "1"),
    URLQueryItem(name: "v", value: apiVersion)
  ]
  
  // Запрос
  guard let url = urlComponents.url else { return }
  var request = URLRequest(url: url)
  request.httpMethod = "GET"
  
  // Задача сессии
  let task = session.dataTask(with: request) { (data, response, error) in
    let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    return print(json ?? "")
  }
  
  // Запуск сессии
  task.resume()
  
}


public func apiUserGroupList(completion: (([Group]?, Error?) -> Void)? = nil ) {
  
  let path = "/method/groups.get"
  
  let params: Parameters = [
    "access_token" : Session.shared.token,
    "extended" : 1,
    "v": apiVersion
  ]
  
  Alamofire.request(apiScheme + "://" + apiHost + path, method: .get, parameters: params).responseJSON { response in
    
    switch response.result {
      
    case .success(let value):
      let json = JSON(value)
      let groupListJSON = json["response"]["items"].arrayValue.map { Group(json: $0) }
      //groupListJSON.forEach { print($0) }
      completion?(groupListJSON, nil)

    case .failure(let error):
      print("Error: \(error.localizedDescription)")
      completion?(nil, error)
      
    }
  }
}

public func apiUserFriendList() {

  let path = "/method/friends.get"

  let params: Parameters = [
    "access_token" : Session.shared.token,
    "fields" : "photo_200_orig",
    "v": apiVersion
  ]

  Alamofire.request(apiScheme + "://" + apiHost + path, method: .get, parameters: params).responseJSON { response in
    
    
    
    
    guard let value = response.value else { return }
    print(value)
    
    
    
    
    
    
  }
}

}
