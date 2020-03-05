//
//  AuthorizationViewController.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 2/20/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit
import Alamofire
import Firebase
import FirebaseAuth

class AuthorizationViewController: UIViewController {

    @IBOutlet weak var phoneAlert: UILabel!
    @IBOutlet weak var phoneField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneField.keyboardType = .numberPad
        UserDefaults.standard.removeObject(forKey: "token")
    }
    
    @IBAction func sendCode(_ sender: Any) {
        if !isCorrect() {
            return
        }
        var doExist = false
        let phoneNumber = "+996" + phoneField.text!
        ServerManager.shared.postPhone(phone: "0" + phoneField.text!, { (user) in
            print(user.token)
            UserDefaults.standard.set(user.token, forKey: "token")
            doExist = true
        }, { (error) in
            print(error)
            doExist = false
        })
        Auth.auth().languageCode = "ru";
        
    PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if error != nil {
                print(error!)
                self.phoneAlert.text = "Unexpected Error"
                self.phoneAlert.isHidden = false
                return
            }
        if !doExist {
            print("not found")
            self.phoneAlert.text = "Данный номер не существует, проверьте правильность набора номера"
            self.phoneAlert.isHidden = false
            return
        }
        self.nextVC(identifier: "AuthentificationVC", verificationID: verificationID!, phoneNumber: phoneNumber)
        }
    }

    func nextVC(identifier: String, verificationID: String, phoneNumber: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: identifier) as! AuthentificationViewController
        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.verificationID = verificationID
        secondViewController.phoneNumber = phoneNumber
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    func isCorrect() -> Bool {
        if phoneField.text?.count != 9 {
            phoneAlert.text = "Номер телефона должен состоять из 9 цифр"
            phoneAlert.isHidden = false
            return false
        }
        if phoneField.text!.isInt {
            phoneAlert.text = "Номер телефона должен состоять из цифр"
            phoneAlert.isHidden = false
            return false
        }
        return true
    }

}
