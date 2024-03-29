//
//  ViewController.swift
//  eureka but better
//
//  Created by student01 on 10/19/19.
//  Copyright © 2019 student01. All rights reserved.
//

import UIKit
import SafariServices
import AVFoundation

class ViewController: UIViewController, SFSafariViewControllerDelegate {
    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var fnafAlarm = AVAudioPlayer()
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var nextSubjectLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var subjectButton: UIButton!
    
    var timerwhat = 5 // <- how many seconds
    var timerwhat2 = 0 // <- how many minutes
    var timer: Timer?
    var timeElapsed = 0
    var runFunction = false
    var subject: [Subject]!
    var numOfSubjects = 0
    var subjectNum = 0
    var nextSubjectCounter = 0
    var importantSubjects: [Subject] = []
    
    func reloadData() {
        if let loadedSubjects = Subject.loadFromFile() {
            subject = loadedSubjects
            
        } else {
            print("no Subjects")
        }
        //load subjects
      
            importantSubjects = subject.sorted{
                $0.grade < $1.grade}
        numOfSubjects = importantSubjects.count - 1
    }
    
    
    @objc func updateCounter() {
        if !runFunction { return }
        
        if timerwhat == 0 && timerwhat2 == 0 {
            fnafAlarm.play()
            subjectButton.isEnabled = true
            startButton.isEnabled = true
            subjectNum += 1
            nextSubjectCounter += 1
            // check the number
            print(subjectNum)
            print(numOfSubjects)
            performSegue(withIdentifier: "studyDone", sender: nil)
            if subjectNum > numOfSubjects {
                subjectLabel.text = "No more"
                descriptionLabel.text = "subjects"
                restartButton.isHidden = false
                restartButton.isEnabled = true
                runFunction = false
                startButton.isEnabled = false
                
            } else {
                
    
                if  numOfSubjects == subjectNum{
                    nextSubjectLabel.text = "Your next subject is: Nothing."
                } else {
                    nextSubjectCounter = subjectNum + 1
                    nextSubjectLabel.text = "Your next subject is:  \(importantSubjects[nextSubjectCounter].mainSubject)."
                }
                
                runFunction = false
            }
        } else {
            timerwhat -= 1
            if timerwhat < 0 {
                timerwhat2 -= 1
                timerwhat = 59
                secondsLabel.text = twoDigit[timerwhat]
            }
            secondsLabel.text = twoDigit[timerwhat]
            minutesLabel.text = twoDigit[timerwhat2]
        }
    }
    
    var twoDigit = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        restartButton.isEnabled = false
        restartButton.isHidden = true
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        print("💁‍♂️ Your plist is at: \(documentsPath)")
       //Timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        let sound = Bundle.main.path(forResource: "five-nights-at-freddys-6-am", ofType: "mp3")
        do {
                
            fnafAlarm = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            
        }
        catch {
            print(error)
        }
        //Get subjects
        if let loadedSubjects = Subject.loadFromFile() {
            subject = loadedSubjects
            
            print(numOfSubjects)
        } else {
            print("no Subjects")
        }
        numOfSubjects = subjectNum - 1
        //Check if you have subjects
        if  subjectNum > numOfSubjects {
            
        } else {
            importantSubjects = subject.sorted{
                $0.grade < $1.grade}
            
        subjectLabel.text = importantSubjects[subjectNum].mainSubject
        descriptionLabel.text = importantSubjects[subjectNum].description
    }
        
        
        if  numOfSubjects < subjectNum || numOfSubjects == subjectNum {
            nextSubjectLabel.text = "Your next subject is: Nothing."
        } else {
            nextSubjectCounter = subjectNum + 1
            nextSubjectLabel.text = "Your next subject is:  \(importantSubjects[nextSubjectCounter].mainSubject)."
        }
        
    }
    
    
    @IBAction func restartButtonPressed(_ sender: Any) {
        
        reloadData()
        if subjectNum > numOfSubjects || subjectNum == numOfSubjects {
            subjectNum = 0
        }
        if numOfSubjects != -1 {
        
        
            restartButton.isEnabled = false
            restartButton.isHidden = true
            startButton.isEnabled = true
            subjectLabel.text = importantSubjects[subjectNum].mainSubject
            descriptionLabel.text = importantSubjects[subjectNum].description
            if  numOfSubjects == subjectNum{
                nextSubjectLabel.text = "Your next subject is: Nothing."
            } else {
                nextSubjectCounter = subjectNum + 1
                nextSubjectLabel.text = "Your next subject is:  \(importantSubjects[nextSubjectCounter].mainSubject)."
            }
        } else {
            subjectLabel.text = " Please Add"
            descriptionLabel.text = "A Subject"
        }
        
    }
    @IBAction func startButton(_ sender: Any) {
        reloadData()
        //load subjects
        if numOfSubjects == -1 {
            print("nothing inside")
            subjectLabel.text = "No subjects"
            descriptionLabel.text = "to study"
        } else {
            subjectLabel.text = importantSubjects[subjectNum].mainSubject
            descriptionLabel.text = importantSubjects[subjectNum].description
            if  numOfSubjects == subjectNum{
                nextSubjectLabel.text = "Your next subject is: Nothing."
            } else {
                nextSubjectCounter = subjectNum + 1
                nextSubjectLabel.text = "Your next subject is:  \(importantSubjects[nextSubjectCounter].mainSubject)."
            }
            if subjectNum > numOfSubjects {
                restartButton.isHidden = false
                restartButton.isEnabled = true
            }
        runFunction = true
        startButton.isEnabled = false
        subjectButton.isEnabled = false
        timerwhat = 5 //Seconds
        timerwhat2 = 0 // minutes
        
    }
    
    }
    
}                                                

