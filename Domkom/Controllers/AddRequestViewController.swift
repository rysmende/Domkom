//
//  AddRequestViewController.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 2/19/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit

class AddRequestViewController: UIViewController {

    @IBOutlet var requests: [UIButton]!
    var type:String = ""
    @IBOutlet weak var typeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var descField: UITextField!
    
    @IBAction func DisplayRequests(_ sender: UIButton) {
        requests.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
            })
        }
    }
    
    @IBAction func setType(_ sender: UIButton) {
        let type = sender.titleLabel!.text
        switch type {
        case "Ремонт":
            self.type = "RE"
            break
        case "Пропуск":
            self.type = "TE"
            break
        default:
            self.type = "SE"
        }
        typeButton.titleLabel!.text = type
    }
    
    
    @IBAction func sendRequest(_ sender: Any) {
        let request = RequestCellStruct(id:0, service_type:self.type, status:"IN", description:descField.text ?? "")
        ServerManager.shared.postRequest(token: UserDefaults.standard.value(forKey: "token") as! String, request:request, {
            (data) in
            print(data)
        },{
            (error) in
            print(error)
        })
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
