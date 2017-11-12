//
//  PreviewMessageCell.swift
//  ForgetMeNot
//
//  Created by admin on 2017. 11. 9..
//  Copyright © 2017년 Ray Wenderlich. All rights reserved.
//

import UIKit

class PreviewMessageCell: UITableViewCell {
    
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var previewTitle: UILabel!
    @IBOutlet weak var previewContent: UITextView!
    @IBOutlet weak var previewDate: UILabel!
    @IBOutlet weak var titleImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


