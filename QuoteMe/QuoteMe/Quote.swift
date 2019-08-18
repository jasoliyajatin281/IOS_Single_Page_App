//
//  Quote.swift
//  QuoteMe
//
//  Created by Student on 2019-06-02.
//  Copyright © 2019 Priyanka. All rights reserved.
//

import Foundation

class Quote{
    
    let quote : String
    let inspireBy : String
    let imageName : String
    
    init() {
        self.imageName = ""
        self.inspireBy = ""
        self.quote = ""
    }
    
    init(Quote:String, InspireBy:String, ImageName:String) {
        self.quote = Quote
        self.inspireBy = InspireBy
        self.imageName = ImageName
    }
}
