//
//  File.swift
//  eureka but better
//
//  Created by Keith Sebastian Legaspi Tongson on 31/10/19.
//  Copyright © 2019 student01. All rights reserved.
//

import Foundation


struct Subject: Codable {
    var mainSubject: String
    var description: String
    var grade: String
    
    init(mainSubject: String, description: String, grade: String){
        self.mainSubject = mainSubject
        self.description = description
        self.grade = grade
        
       
        
    }
    static func loadSampleData() -> [Subject] {
        
        return [
        ]
        
    }
    
    
    static func getArchiveURL() -> URL {
        let plistName = "subjects"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(plistName).appendingPathExtension("plist")
    }
    
    static func saveToFile(subject: [Subject]) {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFriends = try? propertyListEncoder.encode(subject)
        try? encodedFriends?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Subject]? {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedFriendsData = try? Data(contentsOf: archiveURL) else { return nil }
        guard let decodedFriends = try? propertyListDecoder.decode(Array<Subject>.self, from: retrievedFriendsData) else { return nil }
        return decodedFriends
    }

}
