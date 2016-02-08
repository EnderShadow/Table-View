//
//  ViewController.swift
//  tableView
//
//  Created by Mathien on 1/12/16.
//  Copyright © 2016 Mathien. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    
    var colleges = [
        College(name: "Carnegie Mellon", location: "Pittsburgh, Pennsylvania", numStudents: "13285", website: "https://www.cmu.edu/", image: "carnegie_mellon"),
        College(name: "University of Illinois", location: "Urbana-Champagne, Illinois", numStudents: "44087", website: "http://www.illinois.edu/", image: "uoi-uc"),
        College(name: "Depauw", location: "Greencastle, Indiana", numStudents: "2310", website: "http://www.depauw.edu/", image: "depauw")
    ]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    @IBAction func addButtonTapped(sender: AnyObject)
    {
        let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        
        myAlert.addTextFieldWithConfigurationHandler { (name) -> Void in
            name.placeholder = "College Name"
        }
        myAlert.addTextFieldWithConfigurationHandler { (location) -> Void in
            location.placeholder = "College Location"
        }
        myAlert.addTextFieldWithConfigurationHandler { (numStudents) -> Void in
            numStudents.placeholder = "Number of Students"
        }
        myAlert.addTextFieldWithConfigurationHandler { (website) -> Void in
            website.placeholder = "Website Url"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            self.colleges.append(College(name: myAlert.textFields![0].text!, location: myAlert.textFields![1].text!, numStudents: myAlert.textFields![2].text!, website: myAlert.textFields![3].text!))
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        myTableView.editing = !myTableView.editing
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let dvc = segue.destinationViewController as! DetailViewController
        dvc.college = colleges[myTableView.indexPathForSelectedRow!.row]
    }
    
    override func viewWillAppear(animated: Bool)
    {
        myTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        cell.textLabel!.text = colleges[indexPath.row].name
        cell.detailTextLabel?.text = colleges[indexPath.row].location
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
}