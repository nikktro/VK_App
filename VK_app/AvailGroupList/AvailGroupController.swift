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
  
  var groupList = [
    Group(name: "C#", image: UIImage(named: "groupCsharp")),
    Group(name: "HTML", image: UIImage(named: "groupHtml")),
    Group(name: "Java", image: UIImage(named: "groupJava")),
    Group(name: "Linux", image: UIImage(named: "groupLinux")),
    Group(name: "Python", image: UIImage(named: "groupPython")),
    Group(name: "Swift", image: UIImage(named: "groupSwift"))
  ]
  
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
    // получаем группу
    let group = groupSearchList[indexPath.row]
    // устанавливаем группу в надпись ячейки и аватарку
    cell.userGroupLabel.text = group.name
    cell.userGroupImage.image = group.image
    
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
    print(groupSearchList)
    tableView.reloadData()
    
  }
  
}
