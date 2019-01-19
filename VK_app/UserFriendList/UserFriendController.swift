//
//  UserFriendController.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 28/12/2018.
//  Copyright © 2018 Nikolay.Trofimov. All rights reserved.
//

import UIKit


class UserFriendController: UITableViewController {

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
  var userSectionTitles = [String]() // Буква пользователя
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      // Генерация Букв и Списка пользователей
      for human in friendList {
        let userKey = String(human.surname.prefix(1))
        if var humanValues = userDictionary[userKey] {
          humanValues.append(human.name + " " + human.surname)
          userDictionary[userKey] = humanValues
        } else {
          userDictionary[userKey] = [human.name + " " + human.surname]
        }
      }
      // сортировака букв пользователей
      userSectionTitles = [String](userDictionary.keys)
      userSectionTitles.sort(by: { $0 < $1 })


    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return userSectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
    
      let userKey = userSectionTitles[section]
      if let userValues = userDictionary[userKey] {
        return userValues.count
      }
      
      return 0
      
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      // получаем ячейку из пула
      let cell = tableView.dequeueReusableCell(withIdentifier: "UserFriends", for: indexPath) as! UserFriendCell
    
      // устанавливаем друга в надпись
      let userKey = userSectionTitles[indexPath.section]
      if let userValues = userDictionary[userKey] {
        cell.userFriendLabel.text = userValues[indexPath.row]
        
        // ищем аватарку по имени
        for item in friendList {
          if (item.name + " " + item.surname) == userValues[indexPath.row] {
            cell.userFriendImage.image = item.image
          }
        }
      }
      return cell
    }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "FriendInfo" {
      // segue destination source - куда/откуда передаем данные
      let friendImageController = segue.destination as! FriendImageController
      let userFriendController = segue.source as! UserFriendController
      
      // определяем выбранного пользователя, отправляем Структуру Friend в коллекцию через массив
      if let indexPath = userFriendController.tableView.indexPathForSelectedRow {
        let selectedFriend = userFriendController.friendList[indexPath.row]
        friendImageController.selectedFriend = [selectedFriend]
      }
      
    }
  }
  
  // Буквы быстрого перехода
  override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    return userSectionTitles
  }
  
  // Буквы заголовка
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return String(userSectionTitles[section])
  }

}
