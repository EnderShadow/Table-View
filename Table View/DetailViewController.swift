//
//  DetailViewController.swift
//  Table View
//
//  Created by mwarren on 1/19/16.
//  Copyright © 2016 mwarren. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate
{
    @IBOutlet weak var collegeNameField: UITextField!
    @IBOutlet weak var collegeLocationField: UITextField!
    @IBOutlet weak var collegePopulationField: UITextField!
    @IBOutlet weak var collegeWebsiteField: UITextField!
    @IBOutlet weak var collegeImageView: UIImageView!
    
    var college : College!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collegeNameField.text = college.name
        collegeLocationField.text = college.location
        collegePopulationField.text = college.numStudents
        collegeWebsiteField.text = college.website
        collegeImageView.image = college.image
    }
    
    @IBAction func onSave()
    {
        college.name = collegeNameField.text!
        college.location = collegeLocationField.text!
        college.numStudents = collegePopulationField.text!
        college.website = collegeWebsiteField.text!
        college.image = collegeImageView.image
    }
    
    @IBAction func onWebsiteOpenPressed()
    {
        let svcSafariViewController = SFSafariViewController(URL: NSURL(string: collegeWebsiteField.text!)!)
        svcSafariViewController.delegate = self
        presentViewController(svcSafariViewController, animated: true, completion: nil)
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}