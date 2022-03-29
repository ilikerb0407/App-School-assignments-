//
//  ViewController.swift
//  PassValue
//
//  Created by Kai Fu Jhuang on 2022/3/29.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // MARK: 1. 內容為 UITableView, 四邊貼齊 SafeArea。 (OK)
    
    // MARK: 2. 會有一個 UITableViewCell，左側有一個 UILabel, 右側有一個 UIButton，constraint 沒有特別定義，可以自由發揮。 (OK)
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellNumber.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    //MARK: 3. App 開啟時，預設會有 4 個 Cell, Cell 的文字分別是 2, 3, 4, 5。 (OK)
    var cellNumber = ["2","3","4","5"]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
            
        // MARK: 4-1. Closure
        // MARK: 4-2. Target-Action (Target 請設定在擁有 UITableView 的 View Controller 上)
        cell?.deleteBtnOutlet.addTarget(self, action: #selector(deleteCellWithTargetAction), for: .touchUpInside)
        // MARK: 4-3. Delegate Pattern
        cell?.viewController = self
        
        cell?.label.text = cellNumber[indexPath.item]
        cell?.deleteBtnOutlet.tag = indexPath.row
        
        return cell ??  UITableViewCell()
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
    @objc func deleteCellWithTargetAction(_ button: UIButton) {
        cellNumber.remove(at: button.tag)
        tableView.reloadData()
    }
    // MARK: 4-3. Delegate Pattern
    
    
    
    
    func deleteCell(_ cell: TableViewCell) {
        
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        
        
    }

    
    
    // MARK: 5. Navigation Bar 上有一個 **+** 按鈕，點擊會推出第二頁。
    @IBAction func addButton(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController") else { return }
        
        show(nextVC, sender: nil)
        
        
    }
    
    
    // MARK: 6. 點擊 UITableViewCell 會推出第二頁，並把 Cell 內的文字傳到第二頁。
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    


}

