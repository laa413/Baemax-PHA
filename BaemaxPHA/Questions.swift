//
//  Questions.swift
//  BaemaxPHA
//
//  Created by Lindsey Abramson on 4/20/16.
//  Copyright © 2016 Lindsey Abramson. All rights reserved.
//

import Foundation
import UIKit

class Questions{
    init(){}
    let main = UIApplication.sharedApplication().delegate as! AppDelegate
    
    func determineQandA(emotion:String, rating: Int) -> (text:String, answerOptions:[String]){
        var tempText:String = ""
        var tempAnswerOptions:[String] = ["Select Answer","",""]
        switch emotion{
        case "sickness":
            if (rating >= 1 && rating <= 5){
                tempText = "\(main.sickList.getItemAt(0))"
            }else if (rating >= 6 && rating <= 10){
                tempText = "\(main.sickList.getItemAt(1))"
            }
            tempAnswerOptions = ["Select Answer","Yes", "No"]
            break
        case "sadness":
            if (rating >= 1 && rating <= 5){
                tempText = "\(main.sadList.getItemAt(0))"
                tempAnswerOptions = ["Select Answer","Video", "Quote"]
            }else if (rating >= 6 && rating <= 10){
                tempText = "\(main.sadList.getItemAt(1))"
                tempAnswerOptions = ["Select Answer","Yes", "No"]
            }
            break
        case "stress":
            if (rating >= 1 && rating <= 5){
                tempText = "\(main.stressList.getItemAt(0))"
                tempAnswerOptions = ["Select Answer","Image/Video", "Quote/Joke"]
            }else if (rating >= 6 && rating <= 10){
                tempText = "\(main.stressList.getItemAt(1))"
                tempAnswerOptions = ["Select Answer","Yes", "No"]
            }
            break
        case "boredom":
            if (rating >= 1 && rating <= 5){
                tempText = "\(main.boredList.getItemAt(0))"
            }else if (rating >= 6 && rating <= 10){
                tempText = "\(main.boredList.getItemAt(0))"
            }
            tempAnswerOptions = ["Select Answer","Joke", "Video/Images"]
            break
        case "sleepiness":
            if (rating >= 1 && rating <= 5){
                tempText = "\(main.sleepyList.getItemAt(0))"
            }else if (rating >= 6 && rating <= 10){
                tempText = "\(main.sadList.getItemAt(1))"
            }
            tempAnswerOptions = ["Select Answer","Yes", "No"]
            break
        case "happiness":
            if (rating >= 1 && rating <= 5){
                tempText = "\(main.happyList.getItemAt(0))"
            }else if (rating >= 6 && rating <= 10){
                tempText = "\(main.happyList.getItemAt(0))"
                
            }
            tempAnswerOptions = ["Select Answer","Image/Video", "Movie Quote"]
            break
        default:
            break
        }
        return (tempText, tempAnswerOptions)
    }
}
