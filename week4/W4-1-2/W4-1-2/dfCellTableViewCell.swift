//
//  dfCellTableViewCell.swift
//  W4-1-2
//
//  Created by 莊凱富 on 2022/1/31.
//

import UIKit

class dfCellTableViewCell: UITableViewCell {
    
    @IBOutlet var mylabel : UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
