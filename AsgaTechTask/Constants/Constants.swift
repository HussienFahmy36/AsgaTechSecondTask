//
//  Constants.swift
//  AsgaTechTask
//
//  Created by mac on 9/29/17.
//  Copyright © 2017 AsgaTech. All rights reserved.
//

import UIKit

struct Constants {

    static let APIUrl = "http://kasb.azurewebsites.net/Api/"
    static let GetProductByCatId = "GetProductByCatId"
    static let GetProductsDetails = "GetProductsDetails"
 
    //MARK: -  Json key names for response objects
    struct GetProductByCatIdResponse {
        static let statusCode = "StatusCode"
        static let message = "Msg"
        static let data = "data"
        
        struct Product {
            static let ID = "Id"
            static let ImageURL = "Image"
            static let nameEn = "NameEn"
            static let descriptionEn = "DescriptionEn"
            static let nameAr = "Name"
            static let descriptionAr = "Description"
            static let mateiral = "Material"
            static let price = "Price"
            static let priceAfterDiscount = "PriceAfterDiscount"
            static let colors = "Colors"
            static let colorValue = "Name"
            static let quantity = "Quantity"
            static let quantityInStock = "QuantityInStock"
            static let categoryName = "CategoryName"
        }

    }
    
    //MARK: -  Json key names for request objects
    struct GetProductByCatIdRequest {
        struct headers {
            static let Authorization    = "Authorization"
            static let AuthorizationNumber = "eyJJZCI6MSwiRW1haWwiOiJhZG1pbkB5b3Vyc3RvcmUuY29tIiwiVXNlckdlbmRlciI6ZmFsc2UsIlVzZXJOYW1lIjpudWxsLCJJbWFnZSI6bnVsbCwiUGhvbmVOdW1iZXIiOm51bGwsIlBhc3N3b3JkIjoiMTIzNDU2IiwiQ29uZmlybVBhc3N3b3JkIjpudWxsLCJDb3VudHJ5SWQiOm51bGwsIkRvQiI6bnVsbH0="
            
            static let contentType  = "Content-Type"
            static let contentTypeValue = "application/json"
        }
        struct body {
            static let categoryID = "categoryId"
            
        }
    }
    
    
    
    
}
