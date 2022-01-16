//
//  ViewController.swift
//  ShoppingCart
//
//  Created by Joyal on 15/01/22.
//

import UIKit

class ProductViewController: UIViewController, ProductView {
    
    var viewModel: ProductViewModel = ProductViewModel()
    @IBOutlet weak var tableview: UITableView?
    @IBOutlet weak var addToCartViewBtn: UIButton?
    
    override func viewDidLoad() {
      super.viewDidLoad()
      viewModel.view = self
      viewModel.cartModel.cartView = self
      tableview?.estimatedRowHeight = 100
      tableview?.rowHeight = UITableView.automaticDimension
      self.title = TitlePage.productView.rawValue
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       _ =  viewModel.cartModel.fetchCart()
    }
    @IBAction func onTapCartView() {
      viewModel.navigateToCartView(self)
    }

    func onTapAddCart(index: Int) {
      viewModel.saveOnCart(index)
    }
}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource, ProductViewPresentor, CartViewModelDelegate  {
    func displayCartCount(number: Int) {
      addToCartViewBtn?.setTitle("\(number)", for: .normal)
    }
    
    func displayView() {
      tableview?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return viewModel.productView?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell =  tableView.dequeueReusableCell(withIdentifier: "ProductViewCell", for: indexPath) as? ProductViewCell else { return UITableViewCell() }
        cell.title?.text = viewModel.productView?[indexPath.row].title
        cell.disc?.text = viewModel.productView?[indexPath.row].description
        let url = viewModel.productView?[indexPath.row].image ?? ""
        cell.iconImage?.af_setImage(withURL: URL(string: url)!)
        cell.selectionStyle = .none
        cell.delegate = self
        cell.btnAddToCart?.tag = indexPath.row
      return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.navigateToDetailView(self, to: .productDetail, index: indexPath.row)
    }
}
