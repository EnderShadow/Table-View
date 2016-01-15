//
//  College.swift
//  Table View
//
//  Created by mwarren on 1/15/16.
//  Copyright © 2016 mwarren. All rights reserved.
//

import UIKit

class College
{
    var name: String
    var location: String
    var numStudents: String
    var image: UIImageView?
    
    init(name: String, location: String, numStudents: String, image: UIImageView?)
    {
        self.name = name;
        self.location = location
        self.numStudents = numStudents
        self.image = image
    }
    
    convenience init(name: String, location: String, numStudents: String)
    {
        self.init(name: name, location: location, numStudents: numStudents, image: nil)
    }
}