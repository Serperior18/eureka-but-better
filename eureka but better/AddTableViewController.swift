//
//  AddTableViewController.swift
//  eureka but better
//
//  Created by Keith Sebastian Legaspi Tongson on 31/10/19.
//  Copyright © 2019 student01. All rights reserved.
//

import UIKit

class AddTableViewController: UITableViewController {

    @IBOutlet weak var subjectLabel: UITextField!
    @IBOutlet weak var descriptionLabel: UITextField!
    @IBOutlet weak var gradeLabel: UITextField!
    var subject: Subject!
    var newSubject: Subject!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mainSubject = subjectLabel.text ?? ""
        let description = descriptionLabel.text ?? ""
        let grade = gradeLabel.text ?? ""
        
        if segue.identifier == "unwindSave"{
            newSubject = Subject(mainSubject: mainSubject, description: description, grade: grade)
        }
    }

    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        Subject.saveToFile(subject:[newSubject])
    }
    

   

    

}
