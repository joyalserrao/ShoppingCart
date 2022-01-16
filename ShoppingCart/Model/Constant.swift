//
//  Constant.swift
//  ShoppingCart
//
//  Created by Joyal on 16/01/22.
//

import Foundation

enum TitlePage: String {
  case productView = "Product View"
  case productDetail = "Product Detail"
  case productCart = "Product Cart"
}

enum RouterViews: String {
  case productView
  case productDetail
  case productCart

  var identifer: String {
      switch self {
      case .productView:
          return "ProductViewController"
      case .productDetail:
          return "ProductDetailViewController"
      case .productCart:
          return "CartViewController"
      }
  }
}
