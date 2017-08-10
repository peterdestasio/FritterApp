//
//  FriendTableViewCell.swift
//  FritterApp
//
//  Created by Pierluigi De Stasio on 2017-08-08.
//  Copyright © 2017 Peter. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    @IBOutlet weak var labelName: UILabel!
 
    @IBOutlet weak var labelSur: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    


}
