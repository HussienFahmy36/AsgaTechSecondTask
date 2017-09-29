//
//  ViewController.swift
//  AsgaTechTask
//
//  Created by mac on 9/29/17.
//  Copyright © 2017 AsgaTech. All rights reserved.
//

import UIKit
import MBProgressHUD
class ProductsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dataSource: [Product]!
    @IBOutlet weak var productsTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        ProductManager.sharedInstance.getProductsByCategory(categoryID: 9, completion: { (products, errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
            
            if products != nil {
                self.dataSource = products
                self.bindDataToTableView()
                
            }
            else{
                self.presentErrorMessage(message: errorMessage!)
            }
        })
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
     
    }
    
    //MARK: methods
    func bindDataToTableView() {
        if (dataSource != nil) {
            productsTableView.dataSource = self
            productsTableView.delegate = self
            self.productsTableView.reloadData()
        }

        
    }
    //MARK: tableview delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductHeadlineCell", for: indexPath) as! ProductHeadlineCell
        cell.cofigureCellWithProduct(product: dataSource[indexPath.row])
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productDetailsVc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
        productDetailsVc.product  = dataSource[indexPath.row]
        self.navigationController?.pushViewController(productDetailsVc, animated: true)
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func presentErrorMessage(message: String) {
        OperationQueue.main.addOperation { 
            let alertControl = UIAlertController.init(title: "Error", message: message, preferredStyle: .alert)
            let actionOk = UIAlertAction.init(title: "Ok", style: .cancel, handler: nil)
            alertControl.addAction(actionOk)
            self.present(alertControl, animated: true, completion: nil)
        }
        
        
    }
    

}

