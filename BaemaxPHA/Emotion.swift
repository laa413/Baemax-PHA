//
//  Emotion.swift
//  BaemaxPHA
//
//  Created by Lindsey Abramson on 4/20/16.
//  Copyright © 2016 Lindsey Abramson. All rights reserved.
//

import Foundation
struct Emotion {
    var name:Emoji!
    var rating:Int!
    var date: NSDate!
}

enum Emoji{
    case Sad, Sick, Stress, Bored, Sleepy, Happy
}