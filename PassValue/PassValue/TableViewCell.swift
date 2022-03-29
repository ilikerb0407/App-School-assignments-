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
        // Initialization code
        deleteBtnOutlet.addTarget(self, action: #selector(setter: deleteClosure), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var deleteBtnOutlet: UIButton!
    
    weak var viewController : ViewController?
    
    @IBAction func deleteCell(_ sender: Any) {
        viewController?.deleteCell(self)
    }
    
    // MARK: 4-1. Closure delete Cell
    @objc var deleteClosure : ( ()-> Void )? {
        didSet{
            if deleteClosure == nil {
                deleteBtnOutlet.isHidden = true
            } else {
                deleteBtnOutlet.isHidden = false
            }
        }
    }
    @objc func deleteCellClosure(_ sender: Any){
        deleteClosure!()
    }
}
