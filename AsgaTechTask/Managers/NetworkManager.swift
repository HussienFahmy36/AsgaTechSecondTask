//
//  NetworkManager.swift
//  AsgaTechTask
//
//  Created by mac on 9/29/17.
//  Copyright © 2017 AsgaTech. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import MBProgressHUD

class NetworkManager: NSObject {

    public static let sharedInstance = NetworkManager()
    private override init() {
        
    }
    func makeHTTPRequestWithHeaders(headersValue: [String: String], parametersValue: [String: Any], url: String, completion: @escaping (_ result: [String: AnyObject]?, _ message: String?) -> Void)
    {
        var urlRequest = URLRequest.init(url: URL(string: url)!)
        urlRequest.httpMethod = HTTPMethod.post.rawValue
        do {
            let data = try JSONSerialization.data(withJSONObject: parametersValue, options: .prettyPrinted)
            urlRequest.httpBody = data
            urlRequest.addValue(Constants.GetProductByCatIdRequest.headers.AuthorizationNumber, forHTTPHeaderField: Constants.GetProductByCatIdRequest.headers.Authorization)
            urlRequest.addValue(Constants.GetProductByCatIdRequest.headers.contentTypeValue, forHTTPHeaderField: Constants.GetProductByCatIdRequest.headers.contentType)
        
            
        }
        catch let errorMessage {
                    completion(nil, "parsing error")

        }

        Alamofire.request(urlRequest).responseJSON(completionHandler: { (responseJson) in
            switch responseJson.result {
            case .success(_):
                
                
                do {
                    let json = try? JSONSerialization.jsonObject(with: responseJson.data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: Any]
                    
                    switch json?[Constants.GetProductByCatIdResponse.statusCode] as! Int {
                    case 200:
                        completion(json as! [String : AnyObject], nil)
                        break
                    default:
                        break
                        
                    }
                    
                }
                catch let error {
                    completion(nil, "parsing error")
                }

                break
            case .failure(_):
                        completion(nil, "failed with error")

                break
            }
        })

//        Alamofire.request(url, method: .post, parameters: parametersValue, encoding: URLEncoding.default, headers: headersValue).responseJSON { (responseData) in
        
//            switch responseData.result {
//            case .success(_):
//                print(responseData)
//                break
//            case .failure(_):
//                break
//            }
//            
//            if responseData.response != nil {
//                //connection succeded
//
//                
//
//            }
//            else {
//                //connection error
//                completion(nil, responseData.error?.localizedDescription)
//            }
        
            
//        Alamofire.request(url, method: HTTPMethod.post, parameters: parametersValue, encoding: URLEncoding.default, headers: headers)
//        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers)
     
        
    }
    
}
