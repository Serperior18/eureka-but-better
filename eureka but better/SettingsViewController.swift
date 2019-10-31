//
//  SettingsViewController.swift
//  eureka but better
//
//  Created by Keith Sebastian Legaspi Tongson on 31/10/19.
//  Copyright © 2019 student01. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
