//
//  ItemCartTableViewCell.swift
//  Test
//
//  Created by Dario Chamorro on 03/04/17.
//  Copyright © 2017 Dario Chamorro. All rights reserved.
//

import UIKit

class ItemCartTableViewCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    var index:Int!
    var itemDeleted: ((Int,Item)->Void)?
    var item:Item!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteItemCart(_ sender: Any) {
        itemDeleted?(index,item)
    }
    
}
