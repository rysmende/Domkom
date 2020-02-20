//
//  AuthorizationViewController.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 2/20/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthorizationViewController: UIViewController {

    @IBOutlet weak var phoneField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
     
    
    @IBAction func sendCode(_ sender: Any) {
        if phoneField.text?.count != 9 {
            return
        }
        let phoneNumber = "+996" + (phoneField.text ?? "")
        Auth.auth().languageCode = "ru";
    PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if error != nil {
                print(error!)
                print("HELLLLLLLLLLLLLLLLOOOOOOOOOOOO!!!!!!!!!!!")
                return
            }
            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
            UserDefaults.standard.set(phoneNumber, forKey: "phoneNumber")
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
