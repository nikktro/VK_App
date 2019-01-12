//
//  UserGroupController.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 28/12/2018.
//  Copyright © 2018 Nikolay.Trofimov. All rights reserved.
//

import UIKit


class UserGroupController: UITableViewController {
  
  var groupList = [
    Group(name: "Linux", image: UIImage(named: "groupLinux")),
    Group(name: "Swift", image: UIImage(named: "groupSwift"))
  ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupList.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      // получаем ячейку из пула
      let cell = tableView.dequeueReusableCell(withIdentifier: "UserGroup", for: indexPath) as! UserGroupCell
      // получаем группу
      let group = groupList[indexPath.row]
      // устанавливаем группу в надпись ячейки и аватарку
      cell.userGroupLabel.text = group.name
      cell.userGroupImage.image = group.image
      
      return cell
    }
  
  
  @IBAction func addGroup(segue: UIStoryboardSegue) {
    
    // проверяем идентификатор, чтобы убедиться, что это нужный переход
    guard segue.identifier == "addGroup" else { return }
    
    // получаем ссылку на контроллер, с которого осуществляется переход
    let availGroupController = segue.source as! AvailGroupController
    
    // получаем индекс выделенной ячейки
    if let indexPath = availGroupController.tableView.indexPathForSelectedRow {
      // получаем группу по индексу
      let group = availGroupController.groupList[indexPath.row]
      print(group)
      
      // добавляем группу в список пользовательских групп
      // Фильтр на добавление уже существующей группы
      guard !groupList.contains(where: { (item) -> Bool in
        return item.name == group.name && item.image == group.image
      }) else {
        return
      }
      // Если группа в списке отсутсвует - добавляем ее в массив groupList
      groupList.append(group)
      // обновляем таблицу
      tableView.reloadData()
    }
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    // если была нажата кнопка удалить
    if editingStyle == .delete {
      // удаляем группу из массива
      groupList.remove(at: indexPath.row)
      // удаляем строку из таблицы
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
  }
  
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
