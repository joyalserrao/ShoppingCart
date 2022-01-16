//
//  ProductViewModel.swift
//  ShoppingCart
//
//  Created by Joyal on 15/01/22.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case badURL
}


protocol ProductViewPresentor {
    func displayView()
}
class ProductViewModel {
    
    private var baseURL: String = "https://fakestoreapi.com/products"
    var view: ProductViewPresentor?
    var productView: [ShoppingModel]?
    lazy var cartModel: CartViewModel = CartViewModel()
    
    init() {
      getProductView { result in
      switch result {
      case .success(let model):
        self.productView = model
        self.view?.displayView()
          _ =  self.cartModel.fetchCart()
      case .failure(_):
         break
       }
      }
    }
    
    func getProductView(_ completionHandler: @escaping (Result<[ShoppingModel]?, NetworkError>) -> Void) {
      guard let url = URL(string: baseURL) else { return }
        let dataTask = URLSession.shared.dataTask(with: url) {
            data,response,error in
            guard let data = data else {
                completionHandler(.failure(.badURL))
                return
            }
            do {
                let result = try JSONDecoder().decode([ShoppingModel].self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(result))
                }
            } catch let error {
                debugPrint(error.localizedDescription)
            }
        }
        dataTask.resume()
    }

 
    func navigateToDetailView(_ view: UIViewController, to: RouterViews, index: Int)  {
        guard let vc = view.storyboard?.instantiateViewController(withIdentifier: to.identifer) as? ProductDetailViewController else { return  }
        vc.item = productView?[index]
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func saveOnCart(_ index: Int) {
        guard let item = productView?[index] else { return }
        cartModel.addToCart(item: item)        
    }
}



extension ProductViewModel {
    func navigateToCartView(_ view: UIViewController)  {
        guard let vc = view.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController else { return  }
        view.navigationController?.pushViewController(vc, animated: true)
    }
}
