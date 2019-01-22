//
//  NewsTableViewController.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 22/01/2019.
//  Copyright © 2019 Nikolay.Trofimov. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

  var news = [
    News(titleImage: UIImage(named: "groupLinux"), titleName: "News Title", titleTime: "today at 12:00", contentText: "Some news", contentImage: UIImage(named: "news_01"), commentCount: 12, shareCount: 55, viewCount: 103)
  ]
    
  
    override func viewDidLoad() {
      super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
      let newsData = news[indexPath.row]
      cell.titleImage.image = newsData.titleImage!
      cell.titleName.text = newsData.titleName
      cell.titleTime.text = newsData.titleTime
      cell.contentText.text = newsData.contentText
      cell.contentImage.image = newsData.contentImage!
      cell.commentCount.text = String(newsData.commentCount)
      cell.shareCount.text = String(newsData.shareCount)
      cell.viewCount.text = String(newsData.viewCount)
      
      
      return cell
    }



}
