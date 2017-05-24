//
//  Feedback.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/24/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class Feedback: NSObject {

    var authorImageName: String?
    var authorName: String?
    var feedback: String?
    
    init(dictionary: [String: String]) {
        self.authorName = dictionary["authorName"]
        self.authorImageName = dictionary["authorImageName"]
        self.feedback = dictionary["feedback"]
    }
    
    class func parseFeedbacks(array: [[String: String]]) -> [Feedback] {
        var feedbacks = [Feedback]()
        for item in array {
            let feedback = Feedback.init(dictionary: item)
            feedbacks.append(feedback)
        }
        return feedbacks
    }
}
