//
//  ProductInfo+CoreDataProperties.swift
//  
//
//  Created by Joyal on 15/01/22.
//
//

import Foundation
import CoreData


extension ProductInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductInfo> {
        return NSFetchRequest<ProductInfo>(entityName: "ProductInfo")
    }

    @NSManaged public var id: NSDecimalNumber
    @NSManaged public var uuid: UUID?
    @NSManaged public var title: String?
    @NSManaged public var itemDescription: String?
    @NSManaged public var category: String?
    @NSManaged public var itemTitle: String?
    
//    func map() -> ShoppingModel {
//        return ShoppingModel(id: self.id,
//                             title: self.itemTitle,
//                             price: nil,
//                             description: self.itemDescription,
//                             category: self.category,
//                             image: self.url)
//    }

}
