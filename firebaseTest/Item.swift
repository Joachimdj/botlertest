//
//  Item.swift
//  firebaseTest
//
//  Created by Joachim Dittman on 04/02/2016.
//  Copyright © 2016 Joachim Dittman. All rights reserved.
//


import UIKit


class Item {
    let id : String
    let name : String
    let price : Double
    let cat : String
    let desc : String
    let kitchenClose: Int
    let status: Int
    
    
    init(id: String,name: String, let price : Double, let cat : String, desc : String, kitchenClose:Int,status:Int) {
        self.id = id
        self.name = name
        self.price = price
        self.cat = cat
        self.desc = desc
        self.kitchenClose = kitchenClose
        self.status = status
    }
    
    
}