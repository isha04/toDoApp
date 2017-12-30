//
//  tableCells.swift
//  todo
//
//  Created by amarjeet on 29/12/17.
//  Copyright © 2017 amarjeet. All rights reserved.
//

import Foundation
import UIKit

class tableCells: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
