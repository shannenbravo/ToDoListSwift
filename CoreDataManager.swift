//
//  CoreDataManager.swift
//  todoList
//
//  Created by Shannen Bravo-Brown on 5/24/18.
//  Copyright © 2018 Shannen Bravo-Brown. All rights reserved.
//

import CoreData
struct CoreDataManager {
    static let shared = CoreDataManager()
    let persistantContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "todoList")
        container.loadPersistentStores(completionHandler: { (storeDescription, err) in
            if let err = err{
                print("loading Store Error: \(err)")
            }
        })
        return container
    }()
   
}


