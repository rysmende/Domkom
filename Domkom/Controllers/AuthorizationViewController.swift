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
        UserDefaults.standard.removeObject(forKey: "token")
    }
    
    @IBAction func sendCode(_ sender: Any) {
        var doExist = false
        
        if phoneField.text?.count != 9 {
            phoneAlert.text = "Номер телефона должен состоять из 9 цифр"
            phoneAlert.isHidden = false
            return
        }
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
        if !doExist {
            print("not found")
            return
        }
    PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if error != nil {
                print(error!)
                self.phoneAlert.text = "Unexpected Error"
                self.phoneAlert.isHidden = false
                return
            }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "AuthentificationVC") as! AuthentificationViewController
        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.verificationID = verificationID!
        secondViewController.phoneNumber = phoneNumber
        self.present(secondViewController, animated: true, completion: nil)
        }
       
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
