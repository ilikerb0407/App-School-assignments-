//
//  ViewController.swift
//  PassValue
//
//  Created by Kai Fu Jhuang on 2022/3/29.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, deleteCellWithDelegate, BackToMainVCDelegate {
    
    func updateText(_ text: String) {
        cellNumber.append(text)
    }
    
    
    // delegate 傳值
    func sendText(_ text: String, index: Int) {
        cellNumber[index] = text
    }
    
    
    // MARK: 1. 內容為 UITableView, 四邊貼齊 SafeArea。
    
    // MARK: 2. 會有一個 UITableViewCell，左側有一個 UILabel, 右側有一個 UIButton，constraint 沒有特別定義，可以自由發揮。
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellNumber.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    //MARK: 3. App 開啟時，預設會有 4 個 Cell, Cell 的文字分別是 2, 3, 4, 5。
    var cellNumber = ["2","3","4","5"]
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
    
        cell.deleteBtnOutlet.setTitle("Delete", for: .normal)
        cell.deleteBtnOutlet.tintColor = .red
        
        
        // MARK: 4-1. Closure
        // 4-1 step 3 // 不用帶參數, 再進來的時候就已經知道是第幾個cell了
        cell.deleteClosure = {
            self.cellNumber.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        
        // MARK: 4-2. Target-Action (Target 請設定在擁有 UITableView 的 View Controller 上)
//        cell.deleteBtnOutlet.addTarget(self, action: #selector(deleteCellWithTargetAction), for: .touchUpInside)
//
        // MARK: 4-3. Delegate Pattern
//        cell?.delegate = self
        
        cell.label.text = cellNumber[indexPath.row]
        cell.deleteBtnOutlet.tag = indexPath.row
        
        
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: 4. 按下 Cell 裡的右側按鈕，會將 Cell 刪除，這個功能請分別以下列三種方法實現：
    
    // MARK: 4-1. Closure
    
    // MARK: 4-2. Target-Action (Target 請設定在擁有 UITableView 的 View Controller 上)
//    func deleteCellWithTargetAction(_ button: UIButton) {
//        cellNumber.remove(at: button.tag)
//        tableView.reloadData()
//    }
    // MARK: 4-3. Delegate Pattern
    func deleteCell(_ cell: TableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        cellNumber.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }

    
    
    // MARK: 5. Navigation Bar 上有一個 **+** 按鈕，點擊會推出第二頁。
    @IBAction func addButton(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController")
        as? NextViewController
        else { return }
        
//         ClosurePassData
        nextVC.passToCell = { text in
            self.cellNumber.append(text)
            self.tableView.reloadData()
        }
        
        // delegate
//        nextVC.delegate = self
        show(nextVC, sender: nil)
        
    }
    
    
    // MARK: 6. 點擊 UITableViewCell 會推出第二頁，並把 Cell 內的文字傳到第二頁。
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController")
        as? NextViewController
        else { return }
        
        nextVC.defaultText = cellNumber[indexPath.row]
        
//         Closure step 3
        nextVC.passToCell = { text in
            self.cellNumber[indexPath.row] = text
            tableView.reloadData()
        }
//        
//        nextVC.delegate = self
        show(nextVC, sender: nil)
    }
}

