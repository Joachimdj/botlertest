//
//  ItemViewController.swift
//  firebaseTest
//
//  Created by Joachim Dittman on 04/02/2016.
//  Copyright © 2016 Joachim Dittman. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON

class ItemViewController: UITableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //Load in Items
        let ref2 = Firebase (url: "https://botler.firebaseio.com/items")
       
        // Attach a closure to read the data at our posts reference
        print(categorieArray[categorieID].id)
        ref2.queryOrderedByChild("Categorie").queryEqualToValue(categorieArray[categorieID].id)
        .observeEventType(.Value, withBlock: { snapshot in
            print("Items:\(snapshot.value.count)")
            itemArray.removeAll()
            
            let json = JSON(snapshot.value)
            for item in json
            {
            print(item)
                 
                let id:String = item.0
                let name:String = item.1["name"].stringValue
                let price:Double = item.1["price"].doubleValue
                let cat:String = item.1["cat"].stringValue
                let desc:String = item.1["desc"].stringValue
                let kitchenClose:Int = item.1["kitchenClose"].intValue
                let status:Int = item.1["status"].intValue
                
                itemArray.append(Item(id: id, name: name, price: price, cat: cat, desc: desc, kitchenClose: kitchenClose, status: status))
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
        return itemArray.count
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath)

      cell.textLabel?.text = itemArray[indexPath.row].name
      cell.detailTextLabel?.text =  "\(itemArray[indexPath.row].price) DKK"
        

        return cell
    }
 
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        itemID = indexPath.row
    }
  
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
  
}
