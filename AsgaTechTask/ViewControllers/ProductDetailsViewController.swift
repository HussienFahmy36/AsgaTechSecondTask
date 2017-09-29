//
//  ProductDetailsViewController.swift
//  AsgaTechTask
//
//  Created by mac on 9/29/17.
//  Copyright © 2017 AsgaTech. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var productAvailableColors: UICollectionView!
    @IBOutlet weak var productDescription: UITextView!
    @IBOutlet weak var productMaterial: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var productQuantityInStock: UILabel!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    var product: Product!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewWithProduct()

        
        
    }
    //MARK: - methods
    func configureViewWithProduct(){
        self.productDescription.scrollRangeToVisible(NSMakeRange(0, 0))
        productImage.sd_setImage(with: URL(string: product.imageURL), completed: nil)
        productTitle.text = product.name
        productMaterial.text = product.material
        productQuantityInStock.text = "\(product.quantityInStock!)"
        productDescription.text = product.descriptionProduct
        if product.colors != nil {
            productAvailableColors.delegate = self
            productAvailableColors.dataSource = self
            productAvailableColors.reloadData()
        }
        
    }

    //MARK: - collectionview delegate and dc

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.colors.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductColorCell", for: indexPath) as! ProductColorCell
        cell.productColor.text = product.colors[indexPath.row]
        return cell
    }
   }
