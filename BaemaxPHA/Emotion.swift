//
//  Emotion.swift
//  BaemaxPHA
//
//  Created by Lindsey Abramson on 5/6/16.
//  Copyright © 2016 Lindsey Abramson. All rights reserved.
//

// Name: Lindsey Abramson
// Course: CSC 415
// Semester: Spring 2016
// Instructor: Dr. Pulimood
// Project name: BaemaxPHA
// Description: Application to help people deal with emotions by providing solutions
// Filename: Emotion.swift
// Description: source code for the emotion struct and emoji enum
// Last modified on: 5/6/2016

import Foundation
struct Emotion: CustomStringConvertible {
    var name:Emoji!
    var rating:Int!
    var date: NSDate!
    var compare: Int!
    
    //initializes a new object with the inputed values
    init(newName:Emoji, newRating:Int, newDate:NSDate, newCompare: Int)
    {
        name = newName
        rating = newRating
        date = newDate
        compare = newCompare
    }
    
    //takes a string array and converts it to a object
    init(inputArray:[String])
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss.SSSSxxx"
        date = dateFormatter.dateFromString(inputArray[2])
        rating = Int(inputArray[1])!
        compare = Int(inputArray[3])!
        
        switch inputArray[0] {
        case "Sick":
            name = .Sick
        case "Sad":
            name = .Sad
        case "Stress":
            name = .Stress
        case "Bored":
            name = .Bored
        case "Sleepy":
            name = .Sleepy
        case "Happy":
            name = .Happy
        default: break
            //nothing
        }
    }
    
    //converts the object to a string array with all the corresponding values
    func toArray() -> [String] {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ww"

        return [name.rawValue, "\(rating)", dateFormatter.stringFromDate(date), "\(compare)"]
    }
    
    // Implement to support 'CustomStringConvertible'. Basically toString()
    var description: String {
        
        return "Type: \(name)  Rating: \(rating)  Time: \(date)  CompareValue:\(compare)"
    }
    
}

//enums with string values for the emotion types
enum Emoji: String {
    case Sad, Sick, Stress, Bored, Sleepy, Happy
}