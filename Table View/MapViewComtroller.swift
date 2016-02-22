//
//  MapViewComtroller.swift
//  Table View
//
//  Created by mwarren on 2/18/16.
//  Copyright © 2016 mwarren. All rights reserved.
//

import UIKit
import MapKit

class MapViewComtroller: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var textField: UITextField!
    var searchLoc: String!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        textField.delegate = self
        geocodeLocation(searchLoc, showActionSheet: false)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        onSearchTapped()
        return true
    }
    
    @IBAction func onSearchTapped()
    {
        textField.resignFirstResponder()
        geocodeLocation(textField.text!, showActionSheet: true)
    }
    
    func geocodeLocation(location: String, showActionSheet: Bool)
    {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (placemarks, error) -> Void in
            if error != nil
            {
                print("ERROR")
            }
            else if !showActionSheet
            {
                self.displayMap(placemarks!.first!)
            }
            else
            {
                let uiac = UIAlertController(title: "Choose a Location", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
                for loc in placemarks!
                {
                    uiac.addAction(UIAlertAction(title: loc.name, style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                        self.displayMap(loc)
                    }))
                }
                self.presentViewController(uiac, animated: true, completion: nil)
            }
        }
    }
    
    func displayMap(placemark: CLPlacemark)
    {
        textField.text = placemark.name
        
        let span = MKCoordinateSpanMake(0.5, 0.5)
        let region = MKCoordinateRegionMake(placemark.location!.coordinate, span)
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = placemark.location!.coordinate
        pin.title = placemark.name
        
        mapView.addAnnotation(pin)
    }
}