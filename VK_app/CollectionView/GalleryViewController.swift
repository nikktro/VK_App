//
//  GalleryViewController.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 31/01/2019.
//  Copyright © 2019 Nikolay.Trofimov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "userGallery"

let galleryFoto = [
  Friend(id: 1, name: "Анастасия", surname: "Коваль", image: UIImage(named: "userAnastasia")),
  Friend(id: 3, name: "Евгений", surname: "Романенко", image: UIImage(named: "userEvgene")),
  Friend(id: 5, name: "Карина", surname: "Станиславовна", image: UIImage(named: "userKarina")),
  Friend(id: 7, name: "Anastasiya", surname: "Shafir", image: UIImage(named: "userAnastasias")),
  Friend(id: 11, name: "Анатолий", surname: "Зубов", image: UIImage(named: "userAnatoly")),
  Friend(id: 13, name: "Давид", surname: "Выгодчиков", image: UIImage(named: "userDavid")),
  Friend(id: 15, name: "Максим", surname: "Левшин", image: UIImage(named: "userMaxim")),
]


class GalleryViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let screenSize = UIScreen.main.bounds.size
    let cellWidth = floor(screenSize.width)
    let cellHeigth = floor(screenSize.height / 2)
    let layout = collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
    layout.itemSize = CGSize(width: cellWidth, height: cellHeigth)
  }
  
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of items
    return galleryFoto.count
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GalleryViewCell
    
    // Configure the cell
    let foto = galleryFoto[indexPath.row]
    cell.galleryImage.image = foto.image
    
    return cell
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    cell.alpha = 0
    cell.transform = CGAffineTransform(scaleX: 0.0, y: 0.4)
    UIView.animate(withDuration: 0.3) {
      cell.alpha = 1
      cell.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }
  }
  
  

}
