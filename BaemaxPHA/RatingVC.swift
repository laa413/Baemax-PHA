//
//  RatingVC.swift
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
// Filename: RatingVC.swift
// Description: source code for the view controller named RatingVC
// Last modified on: 4/19/2016

import UIKit

class RatingVC: UIViewController {
    //lets the class access variables that have been declared in the AppDelegate
    let main = UIApplication.sharedApplication().delegate as! AppDelegate
    let defaults = NSUserDefaults.standardUserDefaults()
    
    //Variables for the quote, slider, and rating on this view and its connection to UI
    @IBOutlet weak var BaemaxQuote2: UILabel!
    @IBOutlet weak var ratingSlider: UISlider!
    @IBOutlet weak var ratingValue: UILabel!
    
    var savedArray:[[String]] = [[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //when the view appears, then the qute text will change to match the button that was selected in the previous screen
    override func viewDidAppear(animated: Bool) {
        BaemaxQuote2.text = "On a scale of 1 - 10 how would you rate your \(defaults.stringForKey("emotion")!)?"
    }
    
    //controlls the change in value of the rating with the slider
    @IBAction func ratingChanged(sender: UISlider) {
        main.saved[main.saved.count-1][1] = String(Int(sender.value))
        ratingValue.text = "\(String(Int(sender.value)))"
    }
}