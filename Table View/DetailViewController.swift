//
//  DetailViewController.swift
//  Table View
//
//  Created by mwarren on 1/19/16.
//  Copyright © 2016 mwarren. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var collegeNameField: UITextField!
    @IBOutlet weak var collegeLocationField: UITextField!
    @IBOutlet weak var collegePopulationField: UITextField!
    @IBOutlet weak var collegeImageView: UIImageView!
    
    var college : College!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collegeNameField.text = college.name
        collegeLocationField.text = college.location
        collegePopulationField.text = college.numStudents
        collegeImageView.image = college.image
    }
    
    @IBAction func onSave(sender: UIButton)
    {
        college.name = collegeNameField.text!
        college.location = collegeLocationField.text!
        college.numStudents = collegePopulationField.text!
        college.image = collegeImageView.image
    }
}