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
        return friendList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      // получаем ячейку из пула
      let cell = tableView.dequeueReusableCell(withIdentifier: "UserFriends", for: indexPath) as! UserFriendCell
      // получаем друга
      let friend = friendList[indexPath.row]
      // устанавливаем друга в надпись и его аватарку
      cell.userFriendLabel.text = friend.name
      cell.userFriendImage.image = friend.image
      
      return cell
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
