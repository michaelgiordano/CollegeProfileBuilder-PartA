//
//  College.swift
//  App 5 - College Profile Builder
//
//  Created by Michael Giordano on 7/3/17.
//  Copyright © 2017 Michael Giordano. All rights reserved.
//

import UIKit

class College: NSObject
{
    var name = String()
    var location = String()
    var enrollment = Int()
    var image = Data()
    
    convenience init(name: String, location: String, enrollment: Int, image: Data)
    {
        self.init()
        self.name = name
        self.location = location
        self.enrollment = enrollment
        self.image = image
    }
}
