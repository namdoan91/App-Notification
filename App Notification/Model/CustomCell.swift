//
//  CustomCell.swift
//  App Notification
//
//  Created by namit on 11/10/20.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var viewTong: UIView!
  
    @IBOutlet weak var contentText: UILabel!

    @IBOutlet weak var emailText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
//       avatarImage.layer.cornerRadius = avatarImage.frame.height/2

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
