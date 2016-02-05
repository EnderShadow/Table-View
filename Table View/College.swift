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
    var website: String
    var image: UIImage?
    
    init(name: String, location: String, numStudents: String, website: String, image: String?)
    {
        self.name = name;
        self.location = location
        self.numStudents = numStudents
        self.website = website
        self.image = image != nil ? UIImage(named: image!) : nil
    }
    
    convenience init(name: String, location: String, numStudents: String, website: String)
    {
        self.init(name: name, location: location, numStudents: numStudents, website: website, image: nil)
    }
}