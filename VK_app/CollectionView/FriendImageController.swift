//
//  FriendImageController.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 28/12/2018.
//  Copyright © 2018 Nikolay.Trofimov. All rights reserved.
//

import UIKit
import Kingfisher

private let reuseIdentifier = "userPhoto"

class FriendImageController: UICollectionViewController {
  
  var selectedFriendId: Int = 0
  var friendPhoto: [FriendPhoto] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // VKService Friend Photo
    let vkService = VKService()

    vkService.apiUserFriendPhoto(for: selectedFriendId) { [weak self] friendPhotoJSON, error in
      if let error = error {
        // TODO: правильно через extenssion выдавать пользователю alert
        print(error.localizedDescription)
        return
      } else if let value = friendPhotoJSON, let self = self {
        self.friendPhoto = value

        // сортировка и обновление интерфейса в главном потоке
        DispatchQueue.main.async {
          self.collectionView.reloadData()
        }
      }
    }
    
  }
  
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    // Будет отображаться одна секция
    return 1
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // Количество Item определяет размер массива
    return friendPhoto.count
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    // создаем экземпляр cell для отображения в Collection Reusable View с id "userPhoto", приводим к FriendImageCell
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FriendImageCell
    cell.configure(with: friendPhoto[indexPath.row].url)
    return cell
  }
  
}
