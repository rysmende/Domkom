//
//  RegistrationViewController.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 2/20/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var appartmentField: UITextField!
    @IBOutlet weak var floorField: UITextField!
    @IBOutlet weak var peopleField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveInfo(_ sender: Any) {
        if nameField.text != nil && addressField.text != nil && appartmentField.text != nil && floorField.text != nil {
            let full_name = nameField.text!
            let address = addressField.text!
            let owner_type = "Раздва"
            let flat = Int(appartmentField.text!)!
            let floor = Int(floorField.text!)!
            let people = Int(peopleField.text ?? "0")!
            let automobiles = [Automobile(car_brand: "NULL", car_model: "NULL", car_number: "0000")]
            
            let userInfo = UserInfo(full_name: full_name, address: address, owner_type: owner_type, flat: flat, floor: floor, people: people, automobile: automobiles)
            
           ServerManager.shared.postUserInfo(token: UserDefaults.standard.value(forKey: "token") as! String, userInfo: userInfo, { (successMessage) in
               print(successMessage)
            self.nextVC(identifier: "MainVC")
            }) { (error) in
               print(error)
            }
        } else {
            return
       }
        
    }
    
    func nextVC(identifier: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: identifier)
        nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
    }
}
