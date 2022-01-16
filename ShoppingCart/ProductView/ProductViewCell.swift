//
//  ProductViewCell.swift
//  ShoppingCart
//
//  Created by Joyal on 15/01/22.
//

import UIKit
import AlamofireImage

protocol ProductView: AnyObject {
    func onTapAddCart(index: Int)
}

class ProductViewCell: UITableViewCell {
    @IBOutlet weak var iconImage: UIImageView?
    @IBOutlet weak var title: UILabel?
    @IBOutlet weak var disc: UILabel?
    @IBOutlet weak var btnAddToCart: UIButton?

    weak var delegate: ProductView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func onTapAddAction(sender: UIButton) {
      delegate?.onTapAddCart(index: sender.tag)
    }
    

}
