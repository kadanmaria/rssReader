//
//  MyFirstClassTableViewCell.swift
//  rssReader
//
//  Created by iStudent on 10/8/15.
//  Copyright © 2015 iStudent. All rights reserved.
//

import UIKit

class MyFirstClassTableViewCell: UITableViewCell {

    @IBOutlet weak var headNameLabel: UILabel!
    @IBOutlet weak var someNumberLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
