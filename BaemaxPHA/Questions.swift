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
    
    //sets the appropriate values in the quote and the picker view for each corresponding combination of emotions and ratings
    func determineQandA(emotion:Emoji, rating: Int) -> (text:String, answerOptions:[String]){
        var tempText:String = ""
        var tempAnswerOptions:[String] = ["Select Answer","",""]
        switch emotion{
        case Emoji.Sick:
            if (rating >= 1 && rating <= 5){
                tempText = "\(main.sickList.getItemAt(0))"
            }else if (rating >= 6 && rating <= 10){
                tempText = "\(main.sickList.getItemAt(1))"
            }
            tempAnswerOptions = ["Select Answer","Yes", "No"]
            break
        case Emoji.Sad:
            if (rating >= 1 && rating <= 5){
                tempText = "\(main.sadList.getItemAt(0))"
                tempAnswerOptions = ["Select Answer","Video", "Quote"]
            }else if (rating >= 6 && rating <= 10){
                tempText = "\(main.sadList.getItemAt(1))"
                tempAnswerOptions = ["Select Answer","Yes", "No"]
            }
            break
        case Emoji.Stress:
            if (rating >= 1 && rating <= 5){
                tempText = "\(main.stressList.getItemAt(0))"
                tempAnswerOptions = ["Select Answer","Image/Video", "Quote/Joke"]
            }else if (rating >= 6 && rating <= 10){
                tempText = "\(main.stressList.getItemAt(1))"
                tempAnswerOptions = ["Select Answer","Yes", "No"]
            }
            break
        case Emoji.Bored:
            if (rating >= 1 && rating <= 5){
                tempText = "\(main.boredList.getItemAt(0))"
            }else if (rating >= 6 && rating <= 10){
                tempText = "\(main.boredList.getItemAt(0))"
            }
            tempAnswerOptions = ["Select Answer","Joke", "Video/Images"]
            break
        case Emoji.Sleepy:
            if (rating >= 1 && rating <= 5){
                tempText = "\(main.sleepyList.getItemAt(0))"
            }else if (rating >= 6 && rating <= 10){
                tempText = "\(main.sadList.getItemAt(1))"
            }
            tempAnswerOptions = ["Select Answer","Yes", "No"]
            break
        case Emoji.Happy:
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
