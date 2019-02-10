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
  
  var friendList = [
    Friend(id: 1, name: "Анастасия", surname: "Коваль", image: UIImage(named: "userAnastasia")),
    Friend(id: 2, name: "Андрей", surname: "Киселев", image: UIImage(named: "userAndrey")),
    Friend(id: 3, name: "Евгений", surname: "Романенко", image: UIImage(named: "userEvgene")),
    Friend(id: 4, name: "Илья", surname: "Кукушкин", image: UIImage(named: "userIlya")),
    Friend(id: 5, name: "Карина", surname: "Станиславовна", image: UIImage(named: "userKarina")),
    Friend(id: 6, name: "Сергей", surname: "Литаровский", image: UIImage(named: "userSergey")),
    Friend(id: 7, name: "Anastasiya", surname: "Shafir", image: UIImage(named: "userAnastasias")),
    Friend(id: 8, name: "Василиса", surname: "Петрушина", image: UIImage(named: "userVasilisa")),
    Friend(id: 9, name: "Anton", surname: "Darensky", image: UIImage(named: "userAnton")),
    Friend(id: 10, name: "Виолетта", surname: "Лолуа", image: UIImage(named: "userVioletta")),
    Friend(id: 11, name: "Анатолий", surname: "Зубов", image: UIImage(named: "userAnatoly")),
    Friend(id: 12, name: "Ксения", surname: "Журавлева", image: UIImage(named: "userKsenia")),
    Friend(id: 13, name: "Давид", surname: "Выгодчиков", image: UIImage(named: "userDavid")),
    Friend(id: 14, name: "Алексей", surname: "Петренко", image: UIImage(named: "userAlexey")),
    Friend(id: 15, name: "Максим", surname: "Левшин", image: UIImage(named: "userMaxim")),
    Friend(id: 16, name: "Дмитрий", surname: "Нестеренко", image: UIImage(named: "userDmitry"))
  ]
  
  
  var userDictionary = [String: [String]]() // Буква и список пользователей
  var searchFriendList = [Friend]() // Массив для поиска
  var userSectionTitles = [String]() // Буква пользователя
  
  override func viewDidLoad() {
    super.viewDidLoad()
    searchBar.delegate = self
    searchFriendList = friendList
    userDictionaryAndHeader()
    tableView.keyboardDismissMode = .onDrag // скрываем клавиатуру при скролле
    
    // Query User FriendList
    // запрос дополнительно подгружает фото photo_200_orig
    apiUserFriendList()
  }
  
  
  // MARK: - Table view data source
  
  // создание секций
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return userSectionTitles.count
  }
  
  
  // создание строк
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    
    let userKey = userSectionTitles[section]
    if let userValues = userDictionary[userKey] {
      return userValues.count
    }
    
    return 0
    
  }
  
  
  // заполнение ячеек
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // получаем ячейку из пула
    let cell = tableView.dequeueReusableCell(withIdentifier: "UserFriends", for: indexPath) as! UserFriendCell
    
    // устанавливаем друга в надпись
    let userKey = userSectionTitles[indexPath.section]
    if let userValues = userDictionary[userKey] {
      //cell.userFriendLabel.text = userValues[indexPath.row] // now use function configure instead
      
      // ищем аватарку по имени
      for item in searchFriendList {
        if (item.surname + " " + item.name) == userValues[indexPath.row] {
          //cell.userFriendImage.image = item.image // now use function configure instead
          cell.configure(name: userValues[indexPath.row], avatar: item.image!)
        }
      }
    }
    return cell
  }
  
  
  // Переход к пользователю
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "FriendInfo" {
      // segue destination source - куда/откуда передаем данные
      let friendImageController = segue.destination as! FriendImageController
      let userFriendController = segue.source as! UserFriendController
      
      // определяем выбранного пользователя, отправляем Структуру Friend в коллекцию через массив
      // получаем indexPath.section, indexPath.row, находим имя друга, отправляем его струтуру
      guard let indexPath = userFriendController.tableView.indexPathForSelectedRow else { return }
      guard let userValues = userDictionary[userSectionTitles[indexPath.section]] else { return }
      for selectedFriend in searchFriendList {
        if (selectedFriend.surname + " " + selectedFriend.name) == userValues[indexPath.row] {
          friendImageController.selectedFriend = [selectedFriend]
        }
        
      }
      
    }
  }
  
  
  // Буквы быстрого перехода
  override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    if searchFriendList.count == friendList.count { return userSectionTitles } else { return nil }
  }
  
  
  // Буквы заголовка
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if searchFriendList.count == friendList.count { return String(userSectionTitles[section]) } else { return nil }
  }
  
  
  // Генерация Букв Поиска и Списка пользователей
  func userDictionaryAndHeader() {
    userDictionary.removeAll()
    
    for human in searchFriendList {
      let userKey = String(human.surname.prefix(1))
      if var humanValues = userDictionary[userKey] {
        humanValues.append(human.surname + " " + human.name)
        userDictionary[userKey] = humanValues
      } else {
        userDictionary[userKey] = [human.surname + " " + human.name]
      }
    }
    
    // сортировака букв пользователей
    userSectionTitles = [String](userDictionary.keys)
    userSectionTitles.sort(by: { $0 < $1 })
  }
  
  
  // SearchBar
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
    // очищаем фильтр, если запрос пустой
    guard !searchText.isEmpty else {
      searchFriendList = friendList
      userDictionaryAndHeader()
      tableView.reloadData()
      return
    }
    
    // фильтр по lowercase в имени и фамилии
    searchFriendList = friendList.filter({ user -> Bool in
      //let namesurname = (user.name.lowercased() + user.surname.lowercased())
      return (user.name.lowercased() + user.surname.lowercased()).contains(searchText.lowercased())
    })
    userDictionaryAndHeader()
    tableView.reloadData()
    
  }
  
}
