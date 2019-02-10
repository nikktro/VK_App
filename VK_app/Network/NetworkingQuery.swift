//
//  NetworkingQuery.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 10/02/2019.
//  Copyright © 2019 Nikolay.Trofimov. All rights reserved.
//

import Foundation

let apiScheme = "https"
let apiHost = "api.vk.com"
let apiVersion = "5.92"



public func apiQueryURLSession(path: String) -> String {
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
  guard let url = urlComponents.url else { return "" }
  var request = URLRequest(url: url)
  request.httpMethod = "GET"
  
  // Задача сессии
  let task = session.dataTask(with: request) { (data, response, error) in
    let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    
    return print(json ?? "")
    
  }
  
  // Запуск сессии
  task.resume()
  
  return ""
}
