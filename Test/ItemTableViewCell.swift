//
//  ItemTableViewCell.swift
//  Test
//
//  Created by Dario Chamorro on 03/04/17.
//  Copyright © 2017 Dario Chamorro. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    var index:Int!
    var buyed:((Int)->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
       
    @IBAction func buyItem(_ sender: Any) {
        buyed?(index)
    }
    

}
