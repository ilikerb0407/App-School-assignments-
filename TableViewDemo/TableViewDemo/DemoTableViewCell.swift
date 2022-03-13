//
//  DemoTableViewCell.swift
//  TableViewDemo
//
//  Created by Kai Fu Jhuang on 2022/3/12.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var demoLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
