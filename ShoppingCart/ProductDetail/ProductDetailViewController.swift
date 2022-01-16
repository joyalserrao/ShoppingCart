//
//  ProductDetailViewController.swift
//  ShoppingCart
//
//  Created by Joyal on 15/01/22.
//

import UIKit

class ProductDetailViewController: UIViewController, CartViewModelDelegate {
    
    @IBOutlet weak var lblTitle: UILabel?
    @IBOutlet weak var lblPrice: UILabel?
    @IBOutlet weak var lblDescription: UILabel?
    @IBOutlet weak var lblCategory: UILabel?
    @IBOutlet weak var rating: UILabel?
    @IBOutlet weak var image: UIImageView?
    @IBOutlet weak var addTocartBtn: UIButton?

    lazy var cartModel: CartViewModel = CartViewModel()
    var item: ShoppingModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let item = item else { return }
        viewInit(item: item)
        cartModel.cartView = self
        _ = cartModel.fetchCart()
        self.title = TitlePage.productDetail.rawValue
    }
    
    
    func viewInit(item: ShoppingModel?) {
        self.image?.af_setImage(withURL: URL(string: item?.image ?? "")!)
        self.lblPrice?.text = "$ \(item?.price ?? 0.0)"
        self.lblDescription?.text = item?.description
        self.lblTitle?.text = item?.title
        self.lblCategory?.text = item?.category
    }
    
    func displayCartCount(number: Int) {
      self.addTocartBtn?.setTitle("\(number)", for: .normal)
    }
    
    @IBAction func addToCart() {
        guard let item = item else { return }
        cartModel.addToCart(item: item)
    }
    
    @IBAction func onTaToCart() {
      guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController else { return  }
     self.navigationController?.pushViewController(vc, animated: true)
    }
}
