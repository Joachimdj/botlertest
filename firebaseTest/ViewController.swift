//
//  ViewController.swift
//  firebaseTest
//
//  Created by Joachim Dittman on 03/02/2016.
//  Copyright © 2016 Joachim Dittman. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

     
    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      /*
        //Load in Categories
        let ref = Firebase (url: "https://botler.firebaseio.com/Categories")
        // Attach a closure to read the data at our posts reference
        ref.observeEventType(.Value, withBlock: { snapshot in
            print("Categories:\(snapshot.value.count)")
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        
        //Load in Orders
        let refOr = Firebase (url: "https://botler.firebaseio.com/Orders")
        // Attach a closure to read the data at our posts reference
        refOr.observeEventType(.Value, withBlock: { snapshot in
            print("Orders:\(snapshot.value.count)")
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        //Load in Stores
        let refSt = Firebase (url: "https://botler.firebaseio.com/Stores")
        // Attach a closure to read the data at our posts reference
        refSt.observeEventType(.Value, withBlock: { snapshot in
            print("Stores:\(snapshot.value.count)")
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        //Load in Users
        let ref0 = Firebase (url: "https://botler.firebaseio.com/Users")
        // Attach a closure to read the data at our posts reference
        ref0.observeEventType(.Value, withBlock: { snapshot in
            print("Users:\(snapshot.value.count)")
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        //Load in Waiters
        let ref1 = Firebase (url: "https://botler.firebaseio.com/Waiters")
        // Attach a closure to read the data at our posts reference
        ref1.observeEventType(.Value, withBlock: { snapshot in
            print("Waiters:\(snapshot.value.count)")
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        //Load in Items
        let ref2 = Firebase (url: "https://botler.firebaseio.com/Items")
        // Attach a closure to read the data at our posts reference
        ref2.observeEventType(.Value, withBlock: { snapshot in
            print("Items:\(snapshot.value.count)")
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        //Load in openingHours
        let ref3 = Firebase (url: "https://botler.firebaseio.com/openingHours")
        // Attach a closure to read the data at our posts reference
        ref3.observeEventType(.Value, withBlock: { snapshot in
            print("OpeningHours:\(snapshot.value.count)")
            }, withCancelBlock: { error in
                print(error.description)
        })
*/
        
       self.nameField.text = itemArray[itemID].name
        
    }

    @IBAction func updateValue(sender: AnyObject) {
         let ref2 = Firebase (url: "https://botler.firebaseio.com/items/")
        
        let hopperRef = ref2.childByAppendingPath(itemArray[itemID].id)
        let name = self.nameField.text!
        let nickname = ["name": name]
        
        hopperRef.updateChildValues(nickname)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func deleteItem(sender: AnyObject) {
        let ref2 = Firebase (url: "https://botler.firebaseio.com/items/")
        
        let hopperRef = ref2.childByAppendingPath(itemArray[itemID].id)
   
        let nickname = ["status": 3]
        
        hopperRef.updateChildValues(nickname)
        
    }


}

