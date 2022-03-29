//
//  TableViewCell.swift
//  PassValue
//
//  Created by Kai Fu Jhuang on 2022/3/29.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 4-1 step 3
        deleteBtnOutlet.addTarget(self, action: #selector(deleteCellWithClosure(_:)), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var deleteBtnOutlet: UIButton!
    
    weak var viewController : ViewController?
    
//    @IBAction func deleteCell(_ sender: Any) {
//        viewController?.deleteCellWithDelegate(self)
//    }
    
    // MARK: 4-1. Closure
    // 4-1 step 1
    @objc var deleteClosure : ( ()-> () )?
    
    // 4-1 step 2
    @objc func deleteCellWithClosure(_ sender: Any){
        deleteClosure!()
    }
}
