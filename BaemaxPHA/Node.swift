//
//  Node.swift
//  BaemaxPHA
//
//  Created by Lindsey Abramson on 4/18/16.
//  Copyright © 2016 Lindsey Abramson. All rights reserved.
//

// Name: Lindsey Abramson
// Course: CSC 415
// Semester: Spring 2016
// Instructor: Dr. Pulimood
// Project name: BaemaxPHA
// Description: Application to help people deal with emotions by providing solutions
// Filename: Node.swift
/* Description: This is the node structure of the linked list.  This code was taken from what was provided at this link: https://www.erginbilgin.com.tr/implementing-doubly-linked-list-using-swift-2-0/ */
// Last modified on: 5/6/2016

import Foundation

class Node<T:NSObject> {
    var value: T? = nil
    var next: Node<T>? = nil
    var prev: Node<T>? = nil
    
    init() {
    }
    
    init(value: T) {
        self.value = value
    }
}