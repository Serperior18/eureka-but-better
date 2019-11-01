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
   var fnafAlarm = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let sound = Bundle.main.path(forResource: "five-nights-at-freddys-6-am", ofType: "mp3")
        do {
            
            fnafAlarm = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            
        }
        catch {
            print(error)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func soundButton(_ sender: Any) {
        fnafAlarm.play()
    }
}


