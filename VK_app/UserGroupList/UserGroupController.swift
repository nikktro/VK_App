//
//  UserGroupController.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 28/12/2018.
//  Copyright © 2018 Nikolay.Trofimov. All rights reserved.
//

import UIKit

class UserGroupController: UITableViewController, UISearchBarDelegate {
  
  @IBOutlet weak var groupSearchBar: UISearchBar!
  
  private var groupList = [Group]()
  private var groupSearchList = [Group]() // массив для поиска
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    groupSearchBar.delegate = self
    tableView.keyboardDismissMode = .onDrag
  }
  
  
  override func viewDidAppear(_ animated: Bool) {
    
    // Запрос к API Group
    let vkService = VKService()
    vkService.apiUserGroupList() { [weak self] groupListJSON, error in
      
      if let error = error {
        // TODO: правильно через extenssion выдавать пользователю alert
        print(error.localizedDescription)
        return
      } else if let groups = groupListJSON, let self = self {
        self.groupList = groups
        
        // обновление интерфейса переводим в главный поток
        DispatchQueue.main.async {
          self.groupSearchList = self.groupList
          self.tableView.reloadData()
        }
      }
    }
  }
  
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return groupSearchList.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "UserGroup", for: indexPath) as! UserGroupCell
    cell.configure(with: groupSearchList[indexPath.row])
    return cell
  }
}

extension UserGroupController {
  
  // SearchBar
  func searchBar(_ groupSearchBar: UISearchBar, textDidChange searchText: String) {
    
    // очищаем фильтр, если запрос пустой
    guard !searchText.isEmpty else {
      groupSearchList = groupList
      tableView.reloadData()
      return
    }
    
    // фильтр по lowercase
    groupSearchList = groupList.filter({ group -> Bool in
      return group.name.lowercased().contains(searchText.lowercased())
    })
    tableView.reloadData()
    
  }
  
}
