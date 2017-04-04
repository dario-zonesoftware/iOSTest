//
//  ShoppingCartViewController.swift
//  Test
//
//  Created by Dario Chamorro on 03/04/17.
//  Copyright © 2017 Dario Chamorro. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController, UITableViewDataSource {

    var items:[Int:Item]!
    var indexes:[Int]!
    var buyCanceled:((Int,Item)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)        
        indexes = [Int](items.keys)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func deleteItem(index:Int, item:Item){
        buyCanceled?(index, item)
        dismiss(animated: true, completion: nil)
    }
    
    // Mark: - Table Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return indexes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCartCell") as! ItemCartTableViewCell
        let item = items[indexes[indexPath.row]]!
        
        cell.name.text = item.name
        cell.price.text = "$ \(item.price!)"
        cell.amount.text = "Amount \(item.amount!)"
        cell.item = item
        cell.itemDeleted = deleteItem
        cell.index = indexes[indexPath.row]        
        return cell
    }
}
