//
//  ViewController.swift
//  ApplePay
//
//  Created by Vladyslav Tsykhmistro on 10.02.2020.
//  Copyright © 2020 Vladyslav Tsykhmistro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(ProductCollectionViewCell.self)
        }
    }
    
    fileprivate var products: [Product] {
        let sevenPink = Product(imageName: "ic_iPhone_Pink",
                              title: "iPhone 7 Pink",
                              price: "599")
        
        let sevenPlus = Product(imageName: "ic_iPhone7Plus",
                                title: "iPhone 7 Plus",
                                price: "699")
        
        let xrRed = Product(imageName: "ic_iPhone_Red",
                            title: "iPhone XR Red",
                            price: "799")
        
        let xsGold = Product(imageName: "ic_iPhone_Gold",
                             title: "iPhone XS Gold",
                             price: "1099")

        let appleWatch = Product(imageName: "ic_AppleWatch",
                                 title: "Apple Watch",
                                 price: "399")
        
        let appleWatchWhite = Product(imageName: "ic_AppleWatch_White",
                                      title: "Apple Watch White",
                                      price: "399")
        
        let appleWatchPink = Product(imageName: "ic_AppleWatch_Pink",
                                     title: "Apple Watch White",
                                     price: "399")
        
        return [sevenPink, sevenPlus, xrRed, xsGold, appleWatch, appleWatchWhite, appleWatchPink]
    }
    
    override func viewDidLoad() {
        
        

        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeue(ProductCollectionViewCell.self, for: indexPath) else { return UICollectionViewCell() }
        cell.product = products[indexPath.row]
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2) - 8, height: 300)
    }
    
}

