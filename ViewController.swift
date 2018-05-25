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
    
    var tasklist = [Task]()
    var testArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupNavBar()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.tableFooterView = UIView()
    }
    
    func fetchData() {
        //create context
        let context = CoreDataManager.shared.persistantContainer.viewContext
        //make a fetch request
        let fetchRequest = NSFetchRequest<Task>(entityName: "Task")
        do {
            let task = try context.fetch(fetchRequest)
            
            task.forEach({ (task) in
                print(task.item ?? "")
            })
            self.tasklist = task//set ur ouside array equal to this functions comapies
            self.tableView.reloadData() //reload the data on the table cuz we just fetched new data
            
        }catch let fetchErr {
            print("Failed to fetch companies:", fetchErr)
        }
        
    
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
            //set contex
            let context = CoreDataManager.shared.persistantContainer.viewContext
            //make new todo an inset new onject
            let newTodo = NSEntityDescription.insertNewObject(forEntityName: "Task", into: context)
            //set the value of the newtodo
            newTodo.setValue(itemToAdd, forKey: "item")
            //then try to save
            do{
                try context.save()
            }catch let err{
                print("Failed to save caompany:", err)
            }
            self.tasklist.append(newTodo as! Task)
            self.tableView.reloadData()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        alertController.addTextField(configurationHandler: nil)
        present(alertController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasklist.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let task = tasklist[indexPath.row].item
        cell.textLabel?.text = task
        return cell
    }
    



}

