//
//  ProductManager.swift
//  AsgaTechTask
//
//  Created by mac on 9/29/17.
//  Copyright © 2017 AsgaTech. All rights reserved.
//

import UIKit

class ProductManager: NSObject {
    public static let sharedInstance = ProductManager()
    private override init() {
        
    }
    func getProductsByCategory(categoryID: Int, completion: @escaping (_ result: [Product]?, _ message: String?) -> Void)
    {
        NetworkManager.sharedInstance.makeHTTPRequestWithHeaders(headersValue: [Constants.GetProductByCatIdRequest.headers.Authorization: Constants.GetProductByCatIdRequest.headers.AuthorizationNumber, Constants.GetProductByCatIdRequest.headers.contentType: Constants.GetProductByCatIdRequest.headers.contentTypeValue ], parametersValue: [Constants.GetProductByCatIdRequest.body.categoryID: categoryID], url: Constants.APIUrl + Constants.GetProductByCatId) { (response, error) in
           
            if response != nil {
                let data = response?[Constants.GetProductByCatIdResponse.data] as! [[String: Any]]
                var products = [Product]()
                for dataItem in data {
                    products.append(Product(json: dataItem as [String : AnyObject]))
                }
                completion(products, nil)
    
            }
            else{
                completion(nil,error)
            }
            
        }
        
    }
    

}
