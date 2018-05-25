//
//  ViewController.swift
//  todoList
//
//  Created by Shannen Bravo-Brown on 5/24/18.
//  Copyright © 2018 Shannen Bravo-Brown. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let tasklist = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    func setupNavBar(){
        
        view.backgroundColor = .red
        navigationController?.navigationBar.tintColor  = .white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = .green
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationItem.title = "Things To Do"
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = "text"
        return cell
    }
    



}

