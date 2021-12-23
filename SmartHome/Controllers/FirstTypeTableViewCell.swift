//
//  FirstTypeTableViewCell.swift
//  SmartHome
//
//  Created by Eugene on 23.12.2021.
//

import UIKit

class FirstTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCamera: UIImageView!
    @IBOutlet weak var iconCamera: UIImageView!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
