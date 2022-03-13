//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Kai Fu Jhuang on 2022/3/12.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var DemoTableView: UITableView!
    
    @IBOutlet weak var editOrNot: UIButton!
    
    @IBAction func finishedit(_ sender: UIButton) {
        if editOrNot.titleLabel?.text == "Edit" {
            DemoTableView.isEditing = true
            editOrNot.setTitle("Finish", for: .normal)
        } else if editOrNot.titleLabel?.text == "Finish" {
            DemoTableView.isEditing = false
            editOrNot.setTitle("Edit", for: .normal)
        }
        
        print ("hello")
    }
    
    
    
    var phone = ["apple","sony","samesung"]
    
    // section numbers
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    // how many rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        phone.count
    }
    
    // define cells in rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Demo", for: indexPath) as! DemoTableViewCell
        cell.demoLabel.text = phone[indexPath.row]
        return cell
    }
    
    // 每個row 的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 60
        }else {
            return 60
        }
    }
    
    // Create Header
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "header \(section)"
        // default  B
    }
    
    // viewforheader > titleforheader
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        view.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        return view
    }
    
    // Create Footer
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "footer \(section)"
    }
    
    //  header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    // footer height
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    
    // editing cells
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            phone.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // stop the editing method
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        switch indexPath.row {
        case 1 :
            return false
        default :
            return true
        }
    }
    
    
    @objc func editAction(_ sender: UIButton) {
        if editOrNot.titleLabel?.text == "Edit" {
            DemoTableView.isEditing = true
            editOrNot.setTitle("Finish", for: .normal)
        } else if editOrNot.titleLabel?.text == "Finish" {
            DemoTableView.isEditing = false
            editOrNot.setTitle("Edit", for: .normal)
        }
    }

    

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        DemoTableView.delegate = self
        DemoTableView.dataSource = self
        
        editOrNot.titleLabel?.text = "Edit"
        
    }
    
    


}

