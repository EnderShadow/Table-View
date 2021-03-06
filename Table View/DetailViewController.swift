//
//  DetailViewController.swift
//  Table View
//
//  Created by mwarren on 1/19/16.
//  Copyright © 2016 mwarren. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var collegeNameField: UITextField!
    @IBOutlet weak var collegeLocationField: UITextField!
    @IBOutlet weak var collegePopulationField: UITextField!
    @IBOutlet weak var collegeWebsiteField: UITextField!
    @IBOutlet weak var collegeImageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    var college : College!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imagePicker.delegate = self
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
    
    @IBAction func onImageTapped(sender: UITapGestureRecognizer)
    {
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            self.collegeImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "mapView"
        {
            let mvc = segue.destinationViewController as! MapViewComtroller
            mvc.searchLoc = college.name + ", " + college.location
        }
    }
}