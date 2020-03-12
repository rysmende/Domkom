//
//  SeparateNewsViewController.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 3/12/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit

class SeparateNewsViewController: UIViewController {

    
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var descNews: UILabel!
    @IBOutlet weak var dateNews: UILabel!
    
    var titleNewsT = ""
    var imageNewsT = ""
    var descNewsT = ""
    var dateNewsT = ""
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        titleNews.text = titleNewsT
               ServerManager.shared.getImage(url: imageNewsT, { (image) in
                   self.imageNews.image = image
               }) { (error) in
                   self.imageNews.image = UIImage(named: "LaunchBackground")
               }
               descNews.text = descNewsT
               dateNews.text = dateNewsT
    }
    
    func configure(news:NewsCellStruct){
        titleNewsT = news.title
        imageNewsT = news.image
        descNewsT = news.text
        dateNewsT = news.date
    }
}
