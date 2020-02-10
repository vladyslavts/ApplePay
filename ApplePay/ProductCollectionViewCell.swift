//
//  ProductCollectionViewCell.swift
//  ApplePay
//
//  Created by Vladyslav Tsykhmistro on 10.02.2020.
//  Copyright © 2020 Vladyslav Tsykhmistro. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var price: UILabel!
    var onBuy: (() -> ())?
    
    var product: Product! {
        didSet {
            productImageView.image = UIImage(named: product.imageName)
            productTitle.text = product.title
            price.text = "$" + product.price
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func buy(_ sender: ConfigurableButton) {
    }
    
}
