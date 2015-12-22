//
//  MyFirstClassTableViewCell.swift
//  rssReader
//
//  Created by iStudent on 10/8/15.
//  Copyright © 2015 iStudent. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var headNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var Indicator: UIActivityIndicatorView!
    var indexOfCell = Int()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        headNameLabel.text = ""
        descriptionLabel.text = ""
        dateLabel.text = ""
        photoImageView.image = nil
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
