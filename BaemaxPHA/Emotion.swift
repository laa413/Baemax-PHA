//
//  Emotion.swift
//  BaemaxPHA
//
//  Created by Lindsey Abramson on 4/20/16.
//  Copyright © 2016 Lindsey Abramson. All rights reserved.
//

import Foundation
struct Emotion: CustomStringConvertible {
    var name:Emoji!
    var rating:Int!
    var date: NSDate!
    var compare: Int!
    

    init(newName:Emoji, newRating:Int, newDate:NSDate, newCompare: Int)
    {
        name = newName
        rating = newRating
        date = newDate
        compare = newCompare
    }
    
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
    
    
    func toArray() -> [String] {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        return [name.rawValue, "\(rating)", dateFormatter.stringFromDate(date), "\(compare)"]
        
    }
    
    // Implement to support 'CustomStringConvertible'. Basically toString()
    var description: String {
        
        return "Type: \(name)  Rating: \(rating)  Time: \(date)  CompareValue:\(compare)"
    }
    
}

enum Emoji: String {
    case Sad, Sick, Stress, Bored, Sleepy, Happy
}

//makes obj
//var me = Emotion(newName: .Sick, newRating: 20, newDate: NSDate)

//makes object into array
//var storeMe = me.toArray()

//var array:[[String]] = []


//makes object from array again
//var meAgain = People(inputArray: storeMe)