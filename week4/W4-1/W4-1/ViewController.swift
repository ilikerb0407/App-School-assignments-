//
//  ViewController.swift
//  W4-1
//
//  Created by 莊凱富 on 2022/1/26.
//

import UIKit

class tenRowViewController: UITableViewController {

    struct Row {
        let title: String
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dfRow", for: indexPath)
        let rowNumber : Int = indexPath.row
        let row = Row (title: "This is section 0, row \(rowNumber)")
        cell.textLabel?.text = row.title
        return cell
    }
}

