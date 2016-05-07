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
        defaults.setValue("No answer was selected please go back and select an answer", forKey:"answer")
        
        var savedArray = defaults.objectForKey("savedReports")! as? [[String]] ?? [[String]]()
        defaults.setObject(savedArray, forKey: "savedReports")
        defaults.synchronize()
        
        print("user default: \(defaults.objectForKey("savedReports") as? [[String]] ?? [[String]]())")
        
        //makes obj
        //var me = Emotion(newName: .Sick, newRating: 20, newDate: NSDate())
        
        //makes object into array
        //var storeMe = me.toArray()
        
        //makes object from array again
        //var meAgain = Emotion(inputArray: storeMe)
        
        
        /*for(var i = 0; i < array.count; i += 1){
         //var emotions = Emotion(inputArray: testArray)
         //var sortedarray:[Emotion] = []
         //sortedarray.append(emotions)
         //print(emotions)
         //print(sortedarray)
         
         var variable = array[0][1]
         let dateFormatter = NSDateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss zzz"
         var day = dateFormatter.dateFromString(array[0][2])
         
         //sortedarray.append(Emotion(newName: Emoji(rawValue: array[0][0])!, newRating: Int(variable)!, newDate: day!))
         //sortedarray.append(Emotion(newName: Emoji(rawValue: array[0][0])!, newRating: Int(variable)!, newDate: day!))
         //print(sortedarray)
         }*/
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}