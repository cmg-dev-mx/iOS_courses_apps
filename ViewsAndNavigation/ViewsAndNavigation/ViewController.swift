//
//  ViewController.swift
//  ViewsAndNavigation
//
//  Created by Cesar Morales Garduño on 2/27/24.
//

import UIKit
import WebKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myFakeView: UIView!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "My View Controller"
        
        myWebView.load(URLRequest(url: URL(string: "https://google.com")!))
        myMap.centerCoordinate = CLLocationCoordinate2D(latitude: 42.6074875, longitude: -8.3132621)
    }

    @IBAction func myButtonAction(_ sender: Any) {
//        myView.isHidden = true
        myFakeView.isHidden = true
    }
}
