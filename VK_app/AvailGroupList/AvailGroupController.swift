//
//  AvailGroupController.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 28/12/2018.
//  Copyright © 2018 Nikolay.Trofimov. All rights reserved.
//

import UIKit


class AvailGroupController: UITableViewController, UISearchBarDelegate {
  
  @IBOutlet weak var groupSearchBar: UISearchBar!
  
  // TODO: Определиться со структурой массивов доступных групп и списка для поиска
  var groupList = [Group]()
  
  var groupSearchList = [Group]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    groupSearchBar.delegate = self
    groupSearchList = groupList
    tableView.keyboardDismissMode = .onDrag // скрываем клавиатуру при скролле
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return groupSearchList.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    // получаем ячейку из пула
    let cell = tableView.dequeueReusableCell(withIdentifier: "AvailGroup", for: indexPath) as! AvailGroupCell
    // устанавливаем группу в надпись ячейки и аватарку
    cell.configure(with: groupList[indexPath.row])
    
    return cell
  }
  
  
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
    // TODO: запрос групп API при поиске

    tableView.reloadData()
    
  }
  
}
