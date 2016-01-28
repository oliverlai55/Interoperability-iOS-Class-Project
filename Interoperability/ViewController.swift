//
//  ViewController.swift
//  Interoperability
//
//  Created by Oliver Lai on 1/27/16.
//  Copyright © 2016 DigitalCrafts. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        
        reloadTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var tableView: UITableView!

    @IBOutlet var searchTextField: UITextField!
    
    @IBAction func populateButtonTouched(sender: AnyObject) {
        DataManager.sharedManager().populate()
        reloadTable()
    }
    @IBAction func searchButtonTouched(sender: AnyObject) {
    }
    
    var items : [ShoppingItem] = [ShoppingItem]()
    
    func tableView(tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return(items.count)
    }
    
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = self.items[indexPath.row]
        cell.textLabel?.text = "\(item.itemName!) - \(item.itemDescription!)"
        return cell
    }
    
    
    func reloadTable (){
        DataManager.sharedManager().getShoppingListWithCompletionBlock {
        [weak self] (items, error) -> Void in
        if items != nil {
        if let shoppingItems = items as? [ShoppingItem] {
                self?.items = shoppingItems
                self?.tableView.reloadData()
        }
        }
            }
    }
}

