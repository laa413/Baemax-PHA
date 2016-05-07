//
//  SettingsVC.swift
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
// Filename: SettingsStatsVC.swift
// Description: source code for the view controller named SetingsVC
// Last modified on: 4/19/2016
// Not implemented yet

import UIKit

class SettingsStatsVC: UIViewController {
    
    //variables for the setings available and the link to the UI
    @IBOutlet weak var SickPercent:UILabel!
    @IBOutlet weak var SadPercent:UILabel!
    @IBOutlet weak var StressPercent:UILabel!
    @IBOutlet weak var BoredPercent:UILabel!
    @IBOutlet weak var SleepyPercent:UILabel!
    @IBOutlet weak var HappyPercent:UILabel!
    
    //variables for the progress bars for each respective emotion
    @IBOutlet weak var SickProgBar: UIProgressView!
    @IBOutlet weak var SadProgBar: UIProgressView!
    @IBOutlet weak var StressProgBar: UIProgressView!
    @IBOutlet weak var BoredProgBar: UIProgressView!
    @IBOutlet weak var SleepyProgBar: UIProgressView!
    @IBOutlet weak var HappyProgBar: UIProgressView!
    
    //variables for the image views for the averages, the switch for the include name option, and the data view options for the segmented control
    @IBOutlet weak var pastDWMAvg: UIImageView!
    @IBOutlet weak var overallAvg: UIImageView!
    @IBOutlet weak var IncludeName: UISwitch!
    @IBOutlet weak var DataViewOptions: UISegmentedControl!
    
    //saves values of what the user has entered for futore use
    let defaults = NSUserDefaults.standardUserDefaults()
    let main = UIApplication.sharedApplication().delegate as! AppDelegate
    
    //keeps track of the counts of each of the emotions
    var sickCount:Float = 0
    var sadCount:Float = 0
    var stressCount:Float = 0
    var boredCount:Float = 0
    var sleepyCount:Float = 0
    var happyCount:Float = 0
    
    //arrays of objects of each of the emotions previously entered
    var sortedArrayString: [[String]] = []
    var sortedArrayObject:[Emotion] = []
    
    //is called when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        //saves the current list of emotions previoulsy entered as the array
        sortedArrayString = defaults.objectForKey("savedReports")! as? [[String]] ?? [[String]]()

        IncludeName.addTarget(self, action: #selector(SettingsStatsVC.nameGreeting(_:)), forControlEvents: UIControlEvents.ValueChanged)
        //makes the progress bars thicker so they are more visible on the UI
        SickProgBar.transform = CGAffineTransformScale(SickProgBar.transform, 1, 3)
        SadProgBar.transform = CGAffineTransformScale(SadProgBar.transform, 1, 3)
        StressProgBar.transform = CGAffineTransformScale(StressProgBar.transform, 1, 3)
        BoredProgBar.transform = CGAffineTransformScale(BoredProgBar.transform, 1, 3)
        SleepyProgBar.transform = CGAffineTransformScale(SleepyProgBar.transform, 1, 3)
        HappyProgBar.transform = CGAffineTransformScale(HappyProgBar.transform, 1, 3)
        
        //sets the values of the progress bars to 0 if the saved array in defaults is empty
        if defaults.objectForKey("savedReports")! as? [[String]] ?? [[String]]() == [] {
            defaults.setValue(0.0, forKey:"sickPercent")
            defaults.setValue(0.0, forKey:"sadPercent")
            defaults.setValue(0.0, forKey:"stressPercent")
            defaults.setValue(0.0, forKey:"boredPercent")
            defaults.setValue(0.0, forKey:"sleepyPercent")
            defaults.setValue(0.0, forKey:"happyPercent")
            //print("defaults set to 0")
            defaults.synchronize()
            
            SickPercent.text = "Sick: \(String(format:"%.1f", SickProgBar.progress * 100))%"
            SadPercent.text = "Sad:  \(String(format:"%.1f", SadProgBar.progress * 100))%"
            StressPercent.text = "Stress:  \(String(format:"%.1f", StressProgBar.progress * 100))%"
            BoredPercent.text = "Bored:  \(String(format:"%.1f", BoredProgBar.progress * 100))%"
            SleepyPercent.text = "Sleepy:  \(String(format:"%.1f",SleepyProgBar.progress * 100))%"
            HappyPercent.text = "Happy:  \(String(format:"%.1f",HappyProgBar.progress * 100))%"
        } else {
            calcPercent()
        }
        
        //sets the date as a certain format
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        //makes an object with the values from the string array and puts it in an object array
        for var i = 0; i<sortedArrayString.count; i++ {
        
            let dateString = dateFormatter.dateFromString(sortedArrayString[i][2])
            
            let emotionElement: Emotion = Emotion(newName: Emoji(rawValue: sortedArrayString[i][0])!, newRating: Int(sortedArrayString[i][1])!, newDate: (dateString)!, newCompare: Int(sortedArrayString[i][3])!)
            
            sortedArrayObject.append(emotionElement)
        }
        
        //does a quick sort on the object array
        quicksort_swift(&sortedArrayObject, start: sortedArrayObject.startIndex, end: sortedArrayObject.endIndex)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //calculates the percent of each of the emotions with what has been entered, and calculates which is the most common emotion entered and sets the overallAverage image to match
    func calcPercent(){
        for var i = 0; i<main.saved.count; i++ {
            if main.saved[i][0] == Emoji.Sick.rawValue {
                sickCount += 1
                print(sickCount)
            }else if main.saved[i][0] == Emoji.Sad.rawValue {
                sadCount += 1
                print(sadCount)
            }else if main.saved[i][0] == Emoji.Stress.rawValue {
                stressCount += 1
                print(stressCount)
            }else if main.saved[i][0] == Emoji.Bored.rawValue {
                boredCount += 1
                print(boredCount)
            }else if main.saved[i][0] == Emoji.Sleepy.rawValue {
                sleepyCount += 1
                print(sleepyCount)
            }else {
                happyCount += 1
                print(happyCount)
            }
            
            defaults.setValue(sickCount/Float(main.saved.count), forKey:"sickPercent")
            defaults.setValue(sadCount/Float(main.saved.count), forKey:"sadPercent")
            defaults.setValue(stressCount/Float(main.saved.count), forKey:"stressPercent")
            defaults.setValue(boredCount/Float(main.saved.count), forKey:"boredPercent")
            defaults.setValue(sleepyCount/Float(main.saved.count), forKey:"sleepyPercent")
            defaults.setValue(happyCount/Float(main.saved.count), forKey:"happyPercent")
            defaults.synchronize()
            
            defaults.floatForKey("sickPercent")

            
            if defaults.floatForKey("sickPercent") > defaults.floatForKey("sadPercent") && defaults.floatForKey("sickPercent") > defaults.floatForKey("stressPercent") && defaults.floatForKey("sickPercent") > defaults.floatForKey("boredPercent") && defaults.floatForKey("sickPercent") > defaults.floatForKey("sleepyPercent") && defaults.floatForKey("sickPercent") > defaults.floatForKey("happyPercent") {
               
                overallAvg.image = UIImage(named: "Sick")
                
            }else if defaults.floatForKey("sadPercent") > defaults.floatForKey("sickPercent") && defaults.floatForKey("sickPercent") > defaults.floatForKey("stressPercent") && defaults.floatForKey("sadPercent") > defaults.floatForKey("boredPercent") && defaults.floatForKey("sadPercent") > defaults.floatForKey("sleepyPercent") && defaults.floatForKey("sadPercent") > defaults.floatForKey("happyPercent") {
                
                overallAvg.image = UIImage(named: "Sad")
                
            }else if defaults.floatForKey("stressPercent") > defaults.floatForKey("sickPercent") && defaults.floatForKey("stressPercent") > defaults.floatForKey("sadPercent") && defaults.floatForKey("stressPercent") > defaults.floatForKey("boredPercent") && defaults.floatForKey("stressPercent") > defaults.floatForKey("sleepyPercent") && defaults.floatForKey("stressPercent") > defaults.floatForKey("happyPercent") {
                
                overallAvg.image = UIImage(named: "Stress")
                
            }else if defaults.floatForKey("boredPercent") > defaults.floatForKey("sickPercent") && defaults.floatForKey("boredPercent") > defaults.floatForKey("sadPercent") && defaults.floatForKey("boredPercent") > defaults.floatForKey("stressPercent") && defaults.floatForKey("boredPercent") > defaults.floatForKey("sleepyPercent") && defaults.floatForKey("boredPercent") > defaults.floatForKey("happyPercent") {
                
                overallAvg.image = UIImage(named: "Bored")
                
            }else if defaults.floatForKey("sleepyPercent") > defaults.floatForKey("sickPercent") && defaults.floatForKey("sleepyPercent") > defaults.floatForKey("sadPercent") && defaults.floatForKey("sleepyPercent") > defaults.floatForKey("stressPercent") && defaults.floatForKey("sleepyPercent") > defaults.floatForKey("boredPercent") && defaults.floatForKey("sleepyPercent") > defaults.floatForKey("happyPercent") {
                
                overallAvg.image = UIImage(named: "Tired")
                
            }else if defaults.floatForKey("happyPercent") > defaults.floatForKey("sickPercent") && defaults.floatForKey("happyPercent") > defaults.floatForKey("sadPercent") && defaults.floatForKey("happyPercent") > defaults.floatForKey("stressPercent") && defaults.floatForKey("happyPercent") > defaults.floatForKey("boredPercent") && defaults.floatForKey("happyPercent") > defaults.floatForKey("sleepyPercent") {
                
                overallAvg.image = UIImage(named: "Happy")
                
            }else{
                overallAvg.image = UIImage(named: "Tie")
            }
 
        }
        
        //sets the value in the progress bars to their corresponding saved values
        SickProgBar.progress = defaults.floatForKey("sickPercent")
        SadProgBar.progress = defaults.floatForKey("sadPercent")
        StressProgBar.progress = defaults.floatForKey("stressPercent")
        BoredProgBar.progress = defaults.floatForKey("boredPercent")
        SleepyProgBar.progress = defaults.floatForKey("sleepyPercent")
        HappyProgBar.progress = defaults.floatForKey("happyPercent")
        
        //sets the string to contain the value of the percent of the corresponding emotion
        SickPercent.text = "Sick: \(String(format:"%.1f", SickProgBar.progress * 100))%"
        SadPercent.text = "Sad:  \(String(format:"%.1f", SadProgBar.progress * 100))%"
        StressPercent.text = "Stress:  \(String(format:"%.1f", StressProgBar.progress * 100))%"
        BoredPercent.text = "Bored:  \(String(format:"%.1f", BoredProgBar.progress * 100))%"
        SleepyPercent.text = "Sleepy:  \(String(format:"%.1f",SleepyProgBar.progress * 100))%"
        HappyPercent.text = "Happy:  \(String(format:"%.1f",HappyProgBar.progress * 100))%"
    }
    
    //performs a quick sort on the array of objects of emotions
    func quicksort_swift(inout sortedArrayObject:[Emotion], start:Int, end:Int) { //inout is array that needs to be sorted
        if (end - start < 2){
            return
        }
        let p = sortedArrayObject[start + (end - start)/2]
        var l = start
        var r = end - 1
        while (l <= r){
            if (sortedArrayObject[l].compare < p.compare){
                l += 1
                continue
            }
            if (sortedArrayObject[r].compare > p.compare){
                r -= 1
                continue
            }
            let t = sortedArrayObject[l]
            sortedArrayObject[l] = sortedArrayObject[r]
            sortedArrayObject[r] = t
            l += 1
            r -= 1
        }
        quicksort_swift(&sortedArrayObject, start: start, end: r + 1)
        quicksort_swift(&sortedArrayObject, start: r + 1, end: end)
    }
    
    override func viewWillAppear(animated: Bool) {
        IncludeName.on = main.nameInGreeting
    }
    
    //function for removing the name from the greeting on the home screen if the user wants
    @IBAction func nameGreeting(sender: UISwitch) {
        if sender.on == false {
            main.nameInGreeting = false
            sender.setOn(false, animated:true)
        }
        if sender.on == true {
            main.nameInGreeting = true
            sender.setOn(true, animated:true)
        }
    }
}