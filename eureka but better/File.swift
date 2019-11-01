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
        
        func loadSampleData() -> [Subjects] {
           
           
            let subjects = [
                Subjects(mainSubject: "math", description: "algebra", grade: "87"),
                Subjects(mainSubject: "english", description: "compo", grade: "56"),
                Subjects(mainSubject: "science", description: "biology", grade: "78"),
                Subjects(mainSubject: "geography", description: "housing", grade: "74"),
            ]
            return subjects
        }
    }
    
    
}
