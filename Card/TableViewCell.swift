//
//  TableViewCell.swift
//  Card
//
//  Created by 吉澤優衣 on 2019/08/13.
//  Copyright © 2019 原田悠嗣. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var personImage: UIImageView!
    
    @IBOutlet weak var personNameLabel: UILabel!
    
    @IBOutlet weak var personProfessionLabel: UILabel!
    
    @IBOutlet weak var personHometownLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
