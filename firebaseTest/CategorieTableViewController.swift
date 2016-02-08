//
//  CategorieTableViewController.swift
//  firebaseTest
//
//  Created by Joachim Dittman on 04/02/2016.
//  Copyright © 2016 Joachim Dittman. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON

class CategorieTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Load in Items
        let refcat = Firebase (url: "https://botler.firebaseio.com/Categories")
            .observeEventType(.Value, withBlock: { snapshot in
                print("Items:\(snapshot.value.count)")
                itemArray.removeAll()
                
                let json = JSON(snapshot.value)
                for item in json
                {
                    print(item)
                    
                    let id:String = item.1["objectId"].stringValue
                    let name:String = item.1["name"].stringValue
                    
                    categorieArray.append(Categorie(id: id, name: name))
                }
                //  }
                
                print(itemArray.count)
                self.tableView.reloadData()
                }, withCancelBlock: { error in
                    print(error.description)
            })
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categorieArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("categorieCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = categorieArray[indexPath.row].name
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        categorieID = indexPath.row
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
}
