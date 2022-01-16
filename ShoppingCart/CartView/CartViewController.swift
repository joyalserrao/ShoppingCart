//
//  CartViewController.swift
//  ShoppingCart
//
//  Created by Joyal on 15/01/22.
//

import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView?
    var viewModel = CartViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setupView(view: self)
        self.title = TitlePage.productCart.rawValue

        // Do any additional setup after loading the view.
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource, ProductViewPresentor {
    func displayCartCount(number: Int) {
        
    }
    
    func displayView() {
      self.tableview?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return viewModel.cartItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as? CartTableViewCell else {  return UITableViewCell() }
      cell.title?.text = viewModel.cartItems?[indexPath.row].itemTitle ?? ""
      let url = viewModel.cartItems?[indexPath.row].url ?? ""
      cell.iconImage?.af_setImage(withURL: URL(string: url)!)
      return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
         return true
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
          if let id = viewModel.cartItems?[indexPath.row] {
            viewModel.deleteToCart(identifer: id)
          }
      }
    }
}
