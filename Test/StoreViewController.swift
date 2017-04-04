//
//  StoreViewController.swift
//  Test
//
//  Created by Dario Chamorro on 03/04/17.
//  Copyright © 2017 Dario Chamorro. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var table:UITableView!
    @IBOutlet weak var shoppingCart: UIButton!
    @IBOutlet weak var totalPrice: UILabel!
    
    var items:[Item]!
    var shoppingItems:[Int:Item]!
    var total:Int!
    var buys:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = []
        shoppingItems = [Int:Item]()
        total = 0
        buys = 0
        loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
    
        items = [
            Item(name: "Item 1", price: 100, amount: 5),
            Item(name: "Item 2", price: 200, amount: 2),
            Item(name: "Item 3", price: 120, amount: 10),
            Item(name: "Item 4", price: 310, amount: 20),
            Item(name: "Item 5", price: 80, amount: 20),
            Item(name: "Item 6", price: 20, amount: 1),
            Item(name: "Item 7", price: 100, amount: 12),
            Item(name: "Item 8", price: 320, amount: 30),
            Item(name: "Item 9", price: 80, amount: 7),
            Item(name: "Item 10", price: 100, amount: 10)
        ]
        
        table.reloadData()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let modal = segue.destination as! ShoppingCartViewController
        modal.items = shoppingItems
        modal.buyCanceled = buyCanceled
    
    }
    
    // MARK: - Table DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as! ItemTableViewCell
        
        let item = items[indexPath.row]
        
        cell.name.text = item.name
        cell.price.text = "$ \(item.price!) each"
        cell.amount.text = "\(item.amount!) available"
        cell.index = indexPath.row
        cell.buyed = buyedItem
        
        return cell
    }
    
    func buyedItem(index:Int){
        
        let item:Item = items[index]
        let amount:Int = item.amount
        
        if amount > 1 {
            item.amount = amount - 1
        }else {
            items.remove(at: index)
        }
        
        buys = buys + 1
        shoppingCart.setTitle("\(buys!)", for:.normal)
        
        total = total + item.price
        totalPrice.text = "$ \(total!)"
        
        var shoppingItem = shoppingItems[index]
        if shoppingItem == nil {
            shoppingItem = Item(name:item.name, price: item.price, amount: 0)
        }
        shoppingItem!.amount = shoppingItem!.amount + 1
        shoppingItem!.price = shoppingItem!.amount * shoppingItem!.price
        
        shoppingItems[index] = shoppingItem
        table.reloadData()        
    }
    
    func buyCanceled(index:Int, itemCancel:Item){
        
        let item = items[index]
        
        if item.name == itemCancel.name {
            item.amount = item.amount + itemCancel.amount
        }else {
            items.insert(itemCancel, at: index)
        }
        
        shoppingItems.removeValue(forKey: index)
        
        total = total - itemCancel.price
        totalPrice.text = "$ \(total!)"
        
        buys = buys - itemCancel.amount
        shoppingCart.setTitle("\(buys!)", for:.normal)
        
        table.reloadData()
        
    }
    

}
