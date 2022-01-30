//
//  ViewController.swift
//  W4-1-2
//
//  Created by 莊凱富 on 2022/1/31.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    

    let myData = ["This is section 0, row 1","This is section 0, row 2","This is section 0, row 3","This is section 0, row 4","This is section 0, row 5","This is section 0, row 6","This is section 0, row 7","This is section 0, row 8","This is section 0, row 9"]
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "dfCellTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier:  "dfCellTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dfCellTableViewCell", for : indexPath) as! dfCellTableViewCell
        cell.mylabel.text = myData[indexPath.row]
        return cell
        
    }
}
