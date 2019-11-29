//
//  questions.swift
//  quiz
//
//  Created by itss on 26/11/19.
//  Copyright © 2019 itss. All rights reserved.
//

import Foundation

enum OptionChioce {
    case one
    case two
    case three
    case four
}

struct question {
    var questionStatement : String
    var firstChoice : String
    var secoundChoice : String
    var thridChoice : String
    var forthChoice : String
    var correctChoice : OptionChioce
    var answeredCorrectly : Bool
}
