//
//  TableViewCell.swift
//  PassValue
//
//  Created by Kai Fu Jhuang on 2022/3/29.
//

import UIKit

protocol deleteCellWithDelegate {
    func deleteCell(_ selectedCell: TableViewCell) 
}

class TableViewCell: UITableViewCell {
    
    var delegate : deleteCellWithDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
 
        // 4-1 step 3
//        deleteBtnOutlet.addTarget(self, action: #selector(deleteCellWithClosure(_:)), for: .touchUpInside)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var deleteBtnOutlet: UIButton!
    
    
    @IBAction func deleteCell(_ sender: Any) {

        // delegatedelete
//        delegate?.deleteCell(self)
        
        // closuredelete
        deleteCellWithClosure(self)
        
    }
    
    
    // MARK: 4-1. Closure
    // 4-1 step 1
     var deleteClosure : ( () -> () )?
    
//    // 4-1 step 2
     func deleteCellWithClosure(_ sender: Any) {
        deleteClosure?()
    }
}
