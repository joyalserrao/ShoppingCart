//
//  UIimageView+Extention.swift
//  ShoppingCart
//
//  Created by Joyal on 15/01/22.
//
import UIKit
import Foundation
// NOt used
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
