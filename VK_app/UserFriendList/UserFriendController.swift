//
//  UserFriendController.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 28/12/2018.
//  Copyright © 2018 Nikolay.Trofimov. All rights reserved.
//

import UIKit


class UserFriendController: UITableViewController, UISearchBarDelegate {
  
  @IBOutlet weak var searchBar: UISearchBar!
  
  var friendList = [Friend]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // VKService User FriendList
    let vkService = VKService()
    
    vkService.apiUserFriendList() { [weak self] friendListJSON, error in
      if let error = error {
        // TODO: правильно через extenssion выдавать пользователю alert
        print(error.localizedDescription)
        return
      } else if let friends = friendListJSON, let self = self {
        self.friendList = friends
        
        // сортировка и обновление интерфейса в главном потоке
        DispatchQueue.main.async {
          self.friendList = self.friendList.sorted()
          self.tableView.reloadData()
        }
      }
    }
    
  }
  
  
  // numberOfRowsInSection
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return friendList.count
  }
  
  
  // dequeueReusableCell
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "UserFriends", for: indexPath) as! UserFriendCell
    cell.configure(with: friendList[indexPath.row])
    return cell
  }
  
}
  
extension UserFriendController {
  // Segue переход к фотографиям пользователя
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "FriendInfo" {
      
      // segue destination source - куда/откуда передаем данные
      let friendImageController = segue.destination as! FriendImageController
      let userFriendController = segue.source as! UserFriendController
      
      // определяем выбранного пользователя
      guard let indexPath = userFriendController.tableView.indexPathForSelectedRow else { return }
      // отправляем Friend Id в коллекцию friendImageController
      friendImageController.selectedFriendId = friendList[indexPath.row].id
      
    }
  }
}
