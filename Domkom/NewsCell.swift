//
//  NewsCell.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 2/12/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsComs: UILabel!
    
 
    func configure(news: NewsCellStruct) {
        newsTitle.text = news.title
        newsDate.text = news.date
        ServerManager.shared.getImage(url: news.image, { (image) in
            self.newsImage.image = image
        }, { (error) in
            self.newsImage.image = UIImage(named: "LaunchBackground")
        })
        newsComs.text = "Количество комментариев: "
    }
    
}
