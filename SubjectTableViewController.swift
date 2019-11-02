//
//  SubjectTableViewController.swift
//  eureka but better
//
//  Created by Keith Sebastian Legaspi Tongson on 31/10/19.
//  Copyright © 2019 student01. All rights reserved.
//

import UIKit

class SubjectTableViewController: UITableViewController {

    var subject: [Subject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let loadedSubjects = Subject.loadFromFile() {
            subject = loadedSubjects
        } else {
            subject = Subject.loadSampleData()
        }
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    
    @IBAction func unwindToSubjectsTable(segue: UIStoryboardSegue) {
        if segue.identifier == "unwindSave" {
            if let sourceVC = segue.source as? AddTableViewController {
                
                subject.append(sourceVC.subject)
                Subject.saveToFile(subject: [sourceVC.subject])
                tableView.reloadData()
            }
        }
        
    }
    
    
    // MARK: - Table view data source

    @IBAction func editButtonPressed(_ sender: Any) {
        if tableView.isEditing {
            tableView.setEditing(false, animated: true)
        } else {
            tableView.setEditing(true, animated: true)
        }
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subject.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
        
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            subject.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            Subject.saveToFile(subject: subject)
        } else if editingStyle == .insert {
            
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "keith", for: indexPath)

        if let cell = cell as? SubjectTableViewCell {
            let subjects = self.subject[indexPath.row]
            cell.subject.text = subjects.mainSubject
            cell.keithDESCRIPTION.text = subjects.description
            cell.keithGrade.text = subjects.grade
        }
        
        return cell
    }
    
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        print("its pressed")
        dismiss(animated: true, completion: nil)
        Subject.saveToFile(subject: subject)
    }
    
}
