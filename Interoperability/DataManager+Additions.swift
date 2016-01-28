//
//  DataManager+Additions.swift
//  Interoperability
//
//  Created by Oliver Lai on 1/27/16.
//  Copyright © 2016 DigitalCrafts. All rights reserved.
//

import Foundation

extension DataManager{
    func populate(){
        DataManager.sharedManager().createNewItemWithName("Milk", description: "Gallon of whole milk", category: "Dairy", price: 2.99)
        DataManager.sharedManager().createNewItemWithName("Bread", description: "Loaf of the whole bread", category: "Carbs", price: 3.99)
        DataManager.sharedManager().createNewItemWithName("Juice", description: "Liter of the whole juice", category: "Sugar", price: 3.99)
    }
}