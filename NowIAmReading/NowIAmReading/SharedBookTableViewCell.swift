//
//  SharedBookTableViewCell.swift
//  NowIAmReading
//
//  Created by Leandro Silva on 7/29/15.
//  Copyright (c) 2015 The Daddy. All rights reserved.
//

import UIKit

class SharedBookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookPicture: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookSharedBy: UILabel!
    @IBOutlet weak var bookRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
