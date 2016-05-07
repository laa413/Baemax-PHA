//
//  QuestionVC.swift
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
// Filename: QuestionVC.swift
// Description: source code for the view controller named QuestionVC
// PickerView code was taken from http://sourcefreeze.com/ios-uipickerview-example-using-swift/ and edited to match funciotnality of this applicaiotn
// Last modified on: 4/19/2016

import UIKit

class QuestionVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    //lets the class access variables that have been declared in the AppDelegate
    let main = UIApplication.sharedApplication().delegate as! AppDelegate
    //Variables for the quote, picker, next button on this view and its connection to UI
    @IBOutlet weak var BaemaxQuote3: UILabel!
    @IBOutlet weak var AnsPicker: UIPickerView!
    
    var Qs = Questions()
    var pickerDataSource = ["", ""]
    let defaults = NSUserDefaults.standardUserDefaults()
    var result: String!
    var emoji:Emoji.RawValue!
    var num: Int!
    var selectedRow: Int!
    
    //is called when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        self.AnsPicker.dataSource = self;
        self.AnsPicker.delegate = self;
        
        generateQandA()
        
        defaults.synchronize()
        defaults.setObject(main.saved, forKey: "savedReports")
        defaults.synchronize()
        
        emoji = main.saved[main.saved.count-1][0]
        num = Int(main.saved[main.saved.count-1][1])
        let QandA = Qs.determineQandA(Emoji(rawValue: emoji)!, rating: num)
        BaemaxQuote3.text = QandA.text
        pickerDataSource = QandA.answerOptions
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //generates the questions and puts them in the linked list along with the results
    func generateQandA(){
        //the string array where the contents of the plist file are added
        var READIN:[String] = []
        
        //adds the contents of the plist to the array
        READIN = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("QA", ofType: "plist")!) as! [String]
        
        //adds each of the appropriate strings to the appropriate linked list for each emotion
        for (var i=0; i<5; i++){
            main.sickList.addItem(READIN[i])
        }
        
        for (var i=5; i<15; i++){
            main.sadList.addItem(READIN[i])
        }
        
        for (var i=15; i<25; i++){
            main.stressList.addItem(READIN[i])
        }
        
        for (var i=25; i<30; i++){
            main.boredList.addItem(READIN[i])
        }
        
        for (var i=30; i<42; i++){
            main.sleepyList.addItem(READIN[i])
        }
        
        for (var i=42; i<51; i++){
            main.happyList.addItem(READIN[i])
        }
        
    }
    
    //function was given in example code found in link in comment above
    func numberOfComponentsInPickerView(AnsPicker: UIPickerView) -> Int {
        return 1
    }
    
    //function was given in example code found in link in comment above
    func pickerView(AnsPicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    //function was given in example code found in link in comment above
    func pickerView(AnsPicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    //function was given in example code found in link in comment above, but was changed to match the answer that is appropriate for the chosen option in the picker view to the result that will be shown in the next view
    func pickerView(AnsPicker: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        //sick
        if(row == 1 && emoji == Emoji.Sick.rawValue && num >= 1 && num <= 5){
            defaults.setValue("\(String(main.sickList.getItemAt(2)))", forKey: "answer")
            selectedRow = 1
        }else if(row == 2 && emoji == Emoji.Sick.rawValue && num >= 1 && num <= 5){
            defaults.setValue("\(String(main.sickList.getItemAt(3)))", forKey: "answer")
            selectedRow = 2
        }else if(row == 1 && emoji == Emoji.Sick.rawValue && num >= 6 && num <= 10){
            defaults.setValue("\(main.sickList.getItemAt(4))", forKey:"answer")
            selectedRow = 1
        }else if(row == 2 && emoji == Emoji.Sick.rawValue && num >= 6 && num <= 10){
            defaults.setValue("\(main.sickList.getItemAt(2))", forKey:"answer")
            selectedRow = 2
        }else if row == 0 {
            nothingSelected()
        }
        var rando:Int! = Int(arc4random_uniform(3))
        
        //sad
        if(row == 1 && emoji == Emoji.Sad.rawValue && num >= 1 && num <= 5){
            rando = rando + 2
            defaults.setValue("\(String(main.sadList.getItemAt(rando)))", forKey: "answer")
        }else if(row == 2 && emoji == Emoji.Sad.rawValue && num >= 1 && num <= 5){
            rando = rando + 5
            defaults.setValue("\(String(main.sadList.getItemAt(rando)))", forKey: "answer")
        }else if(row == 1 && emoji == Emoji.Sad.rawValue && num >= 6 && num <= 10){
            defaults.setValue("\(String(main.sadList.getItemAt(9)))", forKey:"answer")
        }else if(row == 2 && emoji == Emoji.Sad.rawValue && num >= 6 && num <= 10){
            defaults.setValue("\(String(main.sadList.getItemAt(8)))", forKey:"answer")
        }else if row == 0 {
            nothingSelected()
        }
        
        //stressed
        if(row == 1 && emoji == Emoji.Stress.rawValue && num >= 1 && num <= 5){
            rando = rando + 2
            defaults.setValue("\(String(main.stressList.getItemAt(rando)))", forKey: "answer")
        }else if(row == 2 && emoji == Emoji.Stress.rawValue && num >= 1 && num <= 5){
            rando = rando + 5
            defaults.setValue("\(String(main.stressList.getItemAt(rando)))", forKey: "answer")
        }else if(row == 1 && emoji == Emoji.Stress.rawValue && num >= 6 && num <= 10){
            defaults.setValue("\(String(main.stressList.getItemAt(9)))", forKey:"answer")
        }else if(row == 2 && emoji == Emoji.Stress.rawValue && num >= 6 && num <= 10){
            defaults.setValue("\(String(main.stressList.getItemAt(8)))", forKey:"answer")
        }else if row == 0 {
            nothingSelected()
        }
        
        //bored
        if(row == 1 && emoji == Emoji.Bored.rawValue && num >= 1 && num <= 5){
            rando = Int(arc4random_uniform(2)) + 1
            defaults.setValue("\(String(main.boredList.getItemAt(rando)))", forKey: "answer")
        }else if(row == 2 && emoji == Emoji.Bored.rawValue && num >= 1 && num <= 5){
            rando = Int(arc4random_uniform(2)) + 3
            defaults.setValue("\(String(main.boredList.getItemAt(rando)))", forKey: "answer")
        }else if(row == 1 && emoji == Emoji.Bored.rawValue && num >= 6 && num <= 10){
            rando = Int(arc4random_uniform(2)) + 1
            defaults.setValue("\(String(main.boredList.getItemAt(rando)))", forKey:"answer")
        }else if(row == 2 && emoji == Emoji.Bored.rawValue && num >= 6 && num <= 10){
            rando = Int(arc4random_uniform(2)) + 3
            defaults.setValue("\(String(main.boredList.getItemAt(rando)))", forKey:"answer")
        }else if row == 0 {
            nothingSelected()
        }
        
        //sleepy
        if(row == 1 && emoji == Emoji.Sleepy.rawValue && num >= 1 && num <= 5){
            defaults.setValue("\(String(main.sleepyList.getItemAt(2)))", forKey: "answer")
        }else if(row == 2 && emoji == Emoji.Sleepy.rawValue && num >= 1 && num <= 5){
            rando = Int(arc4random_uniform(6)) + 3
            defaults.setValue("\(String(main.sleepyList.getItemAt(rando)))", forKey: "answer")
        }else if(row == 1 && emoji == Emoji.Sleepy.rawValue && num >= 6 && num <= 10){
            defaults.setValue("\(String(main.sleepyList.getItemAt(11)))", forKey:"answer")
        }else if(row == 2 && emoji == Emoji.Sleepy.rawValue && num >= 6 && num <= 10){
            defaults.setValue("\(String(main.sleepyList.getItemAt(10)))", forKey:"answer")
        }else if row == 0 {
            nothingSelected()
        }
        
        //happy
        if(row == 1 && emoji == Emoji.Happy.rawValue && num >= 1 && num <= 5){
            defaults.setValue("\(String(main.happyList.getItemAt(1)))", forKey: "answer")
        }else if(row == 2 && emoji == Emoji.Happy.rawValue && num >= 1 && num <= 5){
            rando = Int(arc4random_uniform(6)) + 2
            defaults.setValue("\(String(main.happyList.getItemAt(rando)))", forKey: "answer")
        }else if(row == 1 && emoji == Emoji.Happy.rawValue && num >= 6 && num <= 10){
            defaults.setValue("\(String(main.happyList.getItemAt(1)))", forKey:"answer")
        }else if(row == 2 && emoji == Emoji.Happy.rawValue && num >= 6 && num <= 10){
            rando = Int(arc4random_uniform(6)) + 2
            defaults.setValue("\(String(main.happyList.getItemAt(rando)))", forKey:"answer")
        }else if row == 0 {
            nothingSelected()
        }
        rando = 0
    }
    
    //if there is nothing selected, then it lets the user know so that they can enter an answer
    func nothingSelected() {
        
        let alertController = UIAlertController(title: "Answer needed", message:
            "Select one of the given answers", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        defaults.setValue("No answer was selected please go back and select an answer", forKey:"answer")
    }
}