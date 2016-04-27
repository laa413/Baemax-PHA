//
//  ResultVC.swift
//  BaemaxPHA
//
//  Created by Lindsey Abramson on 4/17/16.
//  Copyright © 2016 Lindsey Abramson. All rights reserved.
//

// Name: Lindsey Abramson
// Course: CSC 415
// Semester: Spring 2016
// Instructor: Dr. Pulimood
// Project name: BaemaxPHA
// Description: Application to help people deal with emotions by providing solutions
// Filename: ResultVC.swift
// Description: source code for the view controller named ResultVC
// Last modified on: 4/19/2016

import UIKit

class ResultVC: UIViewController {
    //lets the class access variables that have been declared in the AppDelegate
    let main = UIApplication.sharedApplication().delegate as! AppDelegate
    let defaults = NSUserDefaults.standardUserDefaults()
    //varables for the quote and the text view shown in the UI
    @IBOutlet weak var BaemaxQuote4: UILabel!
    @IBOutlet weak var ResultText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //sets the text of the text view to the value that was determined in the previous view
        ResultText.text = "\(defaults.stringForKey("answer")!)"
        defaults.setValue("No answer was selecte please go back and select an answer", forKey:"answer")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}