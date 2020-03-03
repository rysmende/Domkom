//
//  RequestViewController.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 2/27/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var requests : [RequestCellStruct] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestCell") as! RequestCell
        let request = requests[indexPath.row]
        cell.configure(request: request)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        saveData()
        // Do any additional setup after loading the view.
    }
    
    func saveData(){
        let repair = "Ремонт"
        let pass = "Пропуск"
        let refresh = "RefreshIcon"
        let accepted = "AcceptedIcon"
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: repair, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: repair, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: repair, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: repair, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: repair, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: repair, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: repair, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: repair, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: repair, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: repair, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: repair, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: repair, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: repair, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: repair, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: repair, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: refresh))
        requests.append(RequestCellStruct(num: requests.count + 1, type: repair, icon: accepted))
        requests.append(RequestCellStruct(num: requests.count + 1, type: pass, icon: accepted))
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
