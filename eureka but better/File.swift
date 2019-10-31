//
//  File.swift
//  eureka but better
//
//  Created by Keith Sebastian Legaspi Tongson on 31/10/19.
//  Copyright © 2019 student01. All rights reserved.
//

import Foundation

struct Subjects: Codable {
    var mainSubject: String
    var description: String
    var grade: String
    
    init(mainSubject: String, description: String, grade: String){
        self.mainSubject = mainSubject
        self.description = description
        self.grade = grade
    }
}
