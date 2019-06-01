//
//  Page.swift
//  Test Collection View
//
//  Created by Mohsen Abdollahi on 6/1/19.
//  Copyright © 2019 Mohsen Abdollahi. All rights reserved.
//

import Foundation

class Page {
    let imageName : String
    let headerText: String
    let bodyText: String
    
    init(imageName: String , headerText: String, bodyText: String) {
            self.imageName = imageName
            self.headerText = headerText
            self.bodyText = bodyText
    }
}
