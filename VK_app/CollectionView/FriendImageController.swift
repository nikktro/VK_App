//
//  FriendImageController.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 28/12/2018.
//  Copyright © 2018 Nikolay.Trofimov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "userPhoto"

class FriendImageController: UICollectionViewController {
  
  // получаем массив из UserFriendController через метод prepare for segue
  var selectedFriend: [Friend] = []
  

  
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    // Будет отображаться одна секция
    return 1
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // Количество Item определяет размер массива
    return selectedFriend.count
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    // создаем экземпляр cell для отображения в Collection Reusable View с id "userPhoto", приводим к FriendImageCell
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userPhoto", for: indexPath) as! FriendImageCell
    // достаем структуру из пришедшего массива
    let foto = selectedFriend[indexPath.row]
    // достаем фото из структуры и отображаем ее в IB outlet friendImage во FriendImageCell
    cell.friendImage.image = foto.image
    return cell
  }
  
}
