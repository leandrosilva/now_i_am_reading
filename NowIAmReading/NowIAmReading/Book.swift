//
//  Book.swift
//  NowIAmReading
//
//  Created by Leandro Silva on 7/29/15.
//  Copyright (c) 2015 The Daddy. All rights reserved.
//

import UIKit

class Book: NSObject {
   
    var picture:String
    var title:String
    var author:String
    var sharedBy:String
    var sharingText:String
    var rating:Int
    
    init(picture:String, title:String, author:String, sharedBy:String, sharingText:String, rating:Int) {
        self.picture = picture
        self.title = title
        self.author = author
        self.sharedBy = sharedBy
        self.sharingText = sharingText
        self.rating = rating
    }
}
