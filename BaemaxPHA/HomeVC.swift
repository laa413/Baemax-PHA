//
//  ViewController.swift
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
// Filename: ViewController.swift
// Description: source code for the view controller named HomeVC
// Last modified on: 4/19/2016

import UIKit

class HomeVC: UIViewController {
    //lets the class access variables that have been declared in the AppDelegate
    let main = UIApplication.sharedApplication().delegate as! AppDelegate
    
    //The variable for the UILabel for the Baemax quote on this view
    
    @IBOutlet weak var BaemaxQuote1: UILabel!
    //The variables for the buttons for the emotions
    
     @IBOutlet weak var SickButton: UIButton!
    
    @IBOutlet weak var SadButton: UIButton!
   
    @IBOutlet weak var StressedButton: UIButton!
    
    @IBOutlet weak var BoredButton: UIButton!
   
    @IBOutlet weak var SleepyButton: UIButton!
    @IBOutlet weak var HappyButton: UIButton!
   
    var currentEmoji: Emotion = Emotion(name: Emoji.Happy, rating: 0, date: NSDate())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //system defaults for use with saving user's info
    let defaults = NSUserDefaults.standardUserDefaults()
    
    //if it is the first time for the user opening the app, then there will be an alert asking for the name
    func askName()
    {
        let alertController = UIAlertController(title: "Baemax doesn't know your name", message: "Please tell him your name", preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "OK", style: .Default) { (_) in
            let nameTextField = alertController.textFields![0] as UITextField
            
            print("\(nameTextField.text)")
            self.defaults.setObject(nameTextField.text, forKey: "userName")
            self.BaemaxQuote1.text = "Hello \(self.defaults.stringForKey("userName")!)! My name is Baemax, your personal healthcare assistant."
            for i in 1...10{
                if i == 10{
                    self.BaemaxQuote1.text = "Hello \(self.defaults.stringForKey("userName")!)! How are you feeling today?"
                    self
                }
            }
        }
        okAction.enabled = false
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Destructive) { (_) in }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Your Name Here"
            
            NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue: NSOperationQueue.mainQueue()) { (notification) in
                okAction.enabled = textField.text != ""
            }
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true) {}
    }
    
    //loads the quote differently if the user name is known and if the user's name is not known
    override func viewDidAppear(animated: Bool) {
        if ((defaults.stringForKey("userName") == nil))
        {
            BaemaxQuote1.text = "Hello! My name is Baemax, your personal healthcare assistant."
            askName()
        }
        else {
            BaemaxQuote1.text = "Hello \(defaults.stringForKey("userName")!)! How are you feeling today?"
            //BaemaxQuote1.text = "hello"
        }
    }

    
    //performs the actions when the sick option is selected
    
    @IBAction func sickButton(sender: AnyObject) {
        currentEmoji.name = Emoji.Sick
        currentEmoji.rating = 0
        main.report.append(currentEmoji)
        defaults.setValue("sickness", forKey: "emotion")
        print(main.report)
    }
    
    @IBAction func sadButton(sender: AnyObject) {
        currentEmoji.name = Emoji.Sad
        currentEmoji.rating = 0
        main.report.append(currentEmoji)
        defaults.setValue("sadness", forKey: "emotion")
    }
    
    @IBAction func stressButton(sender: AnyObject) {
        currentEmoji.name = Emoji.Stress
        currentEmoji.rating = 0
        main.report.append(currentEmoji)
        defaults.setValue("stress", forKey: "emotion")
    }
    
    @IBAction func boredButton(sender: AnyObject) {
        currentEmoji.name = Emoji.Bored
        currentEmoji.rating = 0
        main.report.append(currentEmoji)
        defaults.setValue("boredom", forKey: "emotion")
    }
    
    @IBAction func sleepyButton(sender: AnyObject) {
        currentEmoji.name = Emoji.Sleepy
        currentEmoji.rating = 0
        main.report.append(currentEmoji)
        defaults.setValue("sleepiness", forKey: "emotion")
    }
    
    @IBAction func happyButton(sender: AnyObject) {
        currentEmoji.name = Emoji.Happy
        currentEmoji.rating = 0
        main.report.append(currentEmoji)
        defaults.setValue("happiness", forKey: "emotion")
    }
}