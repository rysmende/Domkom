//
//  RequestCell.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 2/12/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit

class RequestCell: UITableViewCell {

    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var num: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    func configure(request: RequestCellStruct){
        self.icon.image = UIImage(named: request.icon)
        self.num.text = self.num.text! + "\(request.num)"
        self.type.text = self.type.text! + "\(request.type)"
    }
    
}
