//
//  ProductDetailViewModel.swift
//  ShoppingCart
//
//  Created by Joyal on 15/01/22.
//

import Foundation
import UIKit
import CoreData

protocol CartViewModelDelegate {
  func displayCartCount(number: Int)
}

class CartViewModel: NSObject {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var cartView: CartViewModelDelegate?

    var cartItems: [ProductInfo]? {
        didSet {
          delegate?.displayView()
        }
    }
    var delegate: ProductViewPresentor?
    
    func setupView(view: ProductViewPresentor) {
        delegate = view
        self.cartItems = fetchCart()
    }
    
    func addToCart(item: ShoppingModel) {
        let context  = appDelegate.persistentContainer.viewContext
        let itemCart = ProductInfo(context: context)
        itemCart.category = item.category
        itemCart.itemTitle = item.title
        itemCart.itemDescription = item.description
        itemCart.id = NSDecimalNumber(integerLiteral: item.id ?? 0)
        itemCart.url = item.image
        do {
          try context.save()
          print("save done")
         let item = fetchCart()
         print(item)
        }
        catch let error as NSError {
           print(error)
        }
    }
    
    func deleteToCart(identifer: ProductInfo) {
        let context  = appDelegate.persistentContainer.viewContext
//        let itemCartRequest = ProductInfo.fetchRequest()
//        itemCartRequest.propertiesToFetch = [identifer.uriRepresentation().absoluteString]
        do {
            context.delete(identifer)
            try context.save()
            _ = fetchCart()
        }
        catch let error as NSError {
           print(error)
        }
    }
    
    
   func fetchCart() -> [ProductInfo]? {
        let context  = appDelegate.persistentContainer.viewContext
        let itemCartRequest = ProductInfo.fetchRequest()
        do {
            let result = try context.fetch(itemCartRequest)
            DispatchQueue.main.async { [self] in
            cartItems = result
            cartView?.displayCartCount(number: result.count)
            }
            return result
            
        }
        catch {
            print("Fail")
        }
        return nil
    }
    
}
