//
//  AuthentificationViewController.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 2/20/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthentificationViewController: UIViewController {
    
    @IBOutlet weak var codeField: UITextField!
    var verificationID:String = ""
    var phoneNumber:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
//        verificationID = defaults.string(forKey: "authVerificationID")!
//        phoneNumber = UserDefaults.standard.string(forKey: "phoneNumber")!
    }
    
    @IBAction func signIn(_ sender: Any) {
        if (codeField.text?.count != 6) {
//        message.isHidden = false
        return
        }
        let verificationCode = codeField.text!
        let credential = PhoneAuthProvider.provider().credential(
        withVerificationID: verificationID,
        verificationCode: verificationCode)
        Auth.auth().signIn(with: credential) { (authResult, error) in
          if let error = error {
            return
          }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "RegistrationVC")
        nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
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
