//
//  CartTableViewCell.swift
//  ShoppingCart
//
//  Created by Joyal on 16/01/22.
//

import UIKit
import AlamofireImage

class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var iconImage: UIImageView?
    @IBOutlet weak var title: UILabel?
    @IBOutlet weak var disc: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
