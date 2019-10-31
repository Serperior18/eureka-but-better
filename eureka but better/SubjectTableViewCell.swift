//
//  SubjectTableViewCell.swift
//  eureka but better
//
//  Created by Keith Sebastian Legaspi Tongson on 31/10/19.
//  Copyright © 2019 student01. All rights reserved.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {
    @IBOutlet weak var subject: UILabel!

    @IBOutlet weak var keithDESCRIPTION: UILabel!
    @IBOutlet weak var keithGrade: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
