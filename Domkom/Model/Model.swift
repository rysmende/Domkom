//
//  Model.swift
//  Domkom
//
//  Created by Adakhanau on 03.03.2020.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import Foundation


struct User: Codable {
    var user_id: Int
    var token: String
}

struct Root: Decodable {
    let newsCells: [NewsCellStruct]
}

struct NewsCellStruct: Decodable {
    var id: Int
    var title:String
    var image:String
    var text: String
    var date:String
}

struct RequestCellStruct {
    var num: Int
    var type: String
    var icon: String
}
