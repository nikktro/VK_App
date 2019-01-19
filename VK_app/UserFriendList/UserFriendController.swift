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
      Friend(name: "Анастасия Коваль", image: UIImage(named: "userAnastasia")),
      Friend(name: "Андрей Киселев", image: UIImage(named: "userAndrey")),
      Friend(name: "Евгений Романенко", image: UIImage(named: "userEvgene")),
      Friend(name: "Илья Кукушкин", image: UIImage(named: "userIlya")),
      Friend(name: "Карина Станиславовна", image: UIImage(named: "userKarina")),
      Friend(name: "Сергей Литаровский", image: UIImage(named: "userSergey")),
      Friend(name: "Anastasiya Shafir", image: UIImage(named: "userAnastasias")),
      Friend(name: "Василиса Петрушина", image: UIImage(named: "userVasilisa")),
      Friend(name: "Anton Darensky", image: UIImage(named: "userAnton")),
      Friend(name: "Виолетта Лолуа", image: UIImage(named: "userVioletta")),
      Friend(name: "Анатолий Зубов", image: UIImage(named: "userAnatoly")),
      Friend(name: "Ксения Журавлева", image: UIImage(named: "userKsenia")),
      Friend(name: "Давид Выгодчиков", image: UIImage(named: "userDavid")),
      Friend(name: "Алексей Петренко", image: UIImage(named: "userAlexey")),
      Friend(name: "Максим Левшин", image: UIImage(named: "userMaxim")),
      Friend(name: "Дмитрий Нестеренко", image: UIImage(named: "userDmitry"))
    ]
  
  
  var userDictionary = [String: [String]]() // Буква и список пользователей
  var userSectionTitles = [String]() // Буква пользователя
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      // Генерация Букв и Списка пользователей
      for human in friendList {
        let userKey = String(human.name.prefix(1))
        if var humanValues = userDictionary[userKey] {
          humanValues.append(human.name)
          userDictionary[userKey] = humanValues
        } else {
          userDictionary[userKey] = [human.name]
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
          if item.name == userValues[indexPath.row] {
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
