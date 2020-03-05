//
//  ServerManager.swift
//  Poputka
//
//  Created by Sanira Madzhikova on 4/3/18.
//  Copyright © 2018 Neobis. All rights reserved.
//

import UIKit
import Alamofire

class ServerManager: HTTPRequestManager  {
    
    class var shared: ServerManager {
        struct Static {
            static let instance = ServerManager()
        }
        return Static.instance
    }
}

extension ServerManager {
    
    func postPhone(phone: String, _ completion: @escaping (User)-> Void, _ error: @escaping (String)-> Void) {
        let parameters: [String: Any] = [
            "phone": phone,
        ]
        let header = ["Content-Type": "application/json"]
        self.post(url: "https://domkom-app.herokuapp.com/auth/send/", parameters: parameters, header: header, completion: { (data) in
            do {
                guard let data = data else {return}
                let user = try JSONDecoder().decode(User.self, from: data)
                DispatchQueue.main.async {
                    completion(user)
                }
            } catch let err {
                error(err.localizedDescription)
            }
        }, error: error)
    }
    
    func postUserInfo(token: String, userInfo: UserInfo, _ completion: @escaping (String)-> Void, _ error: @escaping (String)-> Void) {
        let dicArray = userInfo.automobile.map {
            $0.dictionaryRepresentation
        }
        let parameters: [String: Any] = [
            "full_name": userInfo.full_name,
            "address": userInfo.address,
            "flat": userInfo.flat,
            "floor": userInfo.floor,
            "people": userInfo.people,
            "owner_type": userInfo.owner_type,
            "automobile": dicArray
        ]
        let header: [String: String] = [
            "Content-Type": "application/json",
            "Authorization": "Token \(token)"
        ]
        self.post(url: "https://domkom-app.herokuapp.com/reg/users/", parameters: parameters, header: header, completion: { (data) in
            guard let data = data else {return}
            DispatchQueue.main.async {
                completion("\(data)")
            }
        }, error: error)
    }
}


