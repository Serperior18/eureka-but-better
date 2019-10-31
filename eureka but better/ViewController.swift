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
   var bombAudio = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let sound = Bundle.main.path(forResource: "BOMB_SIREN-BOMB_SIREN-247265934", ofType: "mp3")
        do {
            
            bombAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            
        }
        catch {
            print(error)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func soundButton(_ sender: Any) {
        bombAudio.play()
    }
}


