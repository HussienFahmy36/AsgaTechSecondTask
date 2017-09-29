//
//  ProductHeadlineCell.swift
//  AsgaTechTask
//
//  Created by mac on 9/29/17.
//  Copyright © 2017 AsgaTech. All rights reserved.
//

import UIKit
import SDWebImage

class ProductHeadlineCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productMaterial: UILabel!
    @IBOutlet weak var quantityInStock: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func cofigureCellWithProduct(product: Product) {
        
        productImage.sd_setImage(with: URL(string: product.imageURL), completed: nil)
        productTitle.text = product.name
        productMaterial.text = product.material
        quantityInStock.text = "\(product.quantity!)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
