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

    @NSManaged public var id: Int64
    @NSManaged public var uuid: UUID?
    @NSManaged public var title: String?
    @NSManaged public var itemDescription: String?
    @NSManaged public var category: String?
    @NSManaged public var itemTitle: String?

}
