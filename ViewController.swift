//
//  ViewController.swift
//  todoList
//
//  Created by Shannen Bravo-Brown on 5/24/18.
//  Copyright © 2018 Shannen Bravo-Brown. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {
    
    let tasklist = [Task]()
    var testArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.tableFooterView = UIView()
    }
    
    func setupNavBar(){
        
        view.backgroundColor = .red
        navigationController?.navigationBar.tintColor  = .white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = .green
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationItem.title = "Things To Do"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "new task", style: .plain, target: self, action: #selector(handleSave))
        
    }
    @objc func handleSave() {
        let alertController = UIAlertController(title: "Add Task", message: "Add new task below", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        let saveAction = UIAlertAction(title: "save", style: .default) { (action) in
            guard let textField = alertController.textFields?.first, let itemToAdd = textField.text else {return}
            self.testArray.append(itemToAdd)
            self.tableView.reloadData()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        alertController.addTextField(configurationHandler: nil)
        present(alertController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let task = testArray[indexPath.row]
        cell.textLabel?.text = task
        return cell
    }
    



}

