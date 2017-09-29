//
//  Product.swift
//  AsgaTechTask
//
//  Created by mac on 9/29/17.
//  Copyright © 2017 AsgaTech. All rights reserved.
//

import UIKit
class Product: NSObject {
    var id: Int!
    var imageURL: String!
    var name: String!
    var material: String!
    var descriptionProduct: String!
    var quantity: Int!
    var quantityInStock: Int!
    var categoryName: String!
    var colors: [String]!
    init(json: [String: AnyObject]) {
        id = json[Constants.GetProductByCatIdResponse.Product.ID] as! Int
        imageURL = json[Constants.GetProductByCatIdResponse.Product.ImageURL] as! String
        name = json[Constants.GetProductByCatIdResponse.Product.nameEn] as! String
        material = json[Constants.GetProductByCatIdResponse.Product.mateiral] as! String
        descriptionProduct = json[Constants.GetProductByCatIdResponse.Product.descriptionEn] as! String
        quantity = json[Constants.GetProductByCatIdResponse.Product.quantity] as! Int
        quantityInStock = json[Constants.GetProductByCatIdResponse.Product.quantityInStock] as! Int
        categoryName = json[Constants.GetProductByCatIdResponse.Product.categoryName] as! String
        //get available colors names
        colors = [String]()
        let colorsDictionary = json[Constants.GetProductByCatIdResponse.Product.colors] as! [[String: AnyObject]]
        for colorDictionary in colorsDictionary {
            colors.append(colorDictionary[Constants.GetProductByCatIdResponse.Product.colorValue] as! String)
        }

    }
    
}
