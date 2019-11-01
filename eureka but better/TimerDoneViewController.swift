//
//  TimerDoneViewController.swift
//  eureka but better
//
//  Created by Keith Sebastian Legaspi Tongson on 1/11/19.
//  Copyright © 2019 student01. All rights reserved.
//

import UIKit

class TimerDoneViewController: UIViewController {

    @IBOutlet weak var continueButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

      continueButton.layer.cornerRadius = 10
        
    }
    

    @IBAction func continueButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
