//
//  ViewController.swift
//  ApplePay
//
//  Created by Vladyslav Tsykhmistro on 10.02.2020.
//  Copyright © 2020 Vladyslav Tsykhmistro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var basketViewTop: NSLayoutConstraint!
    @IBOutlet weak var totalPrice: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(ProductCollectionViewCell.self)
        }
    }
    
    fileprivate var productsToBuy: [Product] = [] {
        didSet {
            updateBasketView()
            animateBasketView()
        }
    }
    
    fileprivate var products: [Product] {
        let sevenPink = Product(imageName: "ic_iPhone_Pink",
                              title: "iPhone 7 Pink",
                              price: 599)
        
        let sevenPlus = Product(imageName: "ic_iPhone7Plus",
                                title: "iPhone 7 Plus",
                                price: 699)
        
        let xrRed = Product(imageName: "ic_iPhone_Red",
                            title: "iPhone XR Red",
                            price: 799)
        
        let xsGold = Product(imageName: "ic_iPhone_Gold",
                             title: "iPhone XS Gold",
                             price: 1099)

        let appleWatch = Product(imageName: "ic_AppleWatch",
                                 title: "Apple Watch",
                                 price: 399)
        
        let appleWatchWhite = Product(imageName: "ic_AppleWatch_White",
                                      title: "Apple Watch White",
                                      price: 399)
        
        let appleWatchPink = Product(imageName: "ic_AppleWatch_Pink",
                                     title: "Apple Watch White",
                                     price: 399)
        
        return [sevenPink, sevenPlus, xrRed, xsGold, appleWatch, appleWatchWhite, appleWatchPink]
    }
    
    override func viewDidLoad() {
        basketViewTop.constant = 0
        super.viewDidLoad()
    }

    private func updateBasketView() {
        if productsToBuy.count == 0 { return }
        let sum = productsToBuy.map({ $0.price }).reduce(0, +)
        let totalString = NSMutableAttributedString(string: "Total: ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)])
        let sumString = NSMutableAttributedString(string: "$\(sum)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .medium)])
        totalString.append(sumString)
        totalPrice.attributedText = totalString
    }
    
    private func animateBasketView() {
        let sss = productsToBuy.count > 0 ? 100 : 0
        UIView.animate(withDuration: 0.3) {
            self.basketViewTop.constant = CGFloat(sss)
            self.view.layoutIfNeeded()
        }
    }
    
    fileprivate func addProductIfNeeded(_ product: Product) {
        if productsToBuy.contains(product) {
            let index = productsToBuy.firstIndex(of: product) ?? 0
            productsToBuy.remove(at: index)
        } else {
            productsToBuy.append(product)
        }
    }
    
    @IBAction func buy(_ sender: ConfigurableButton) {
    
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeue(ProductCollectionViewCell.self, for: indexPath) else { return UICollectionViewCell() }
        cell.product = products[indexPath.row]
        let title = productsToBuy.contains(products[indexPath.row]) ? "REMOVE" : "ADD"
        cell.addButton.setTitle(title, for: .normal)
        cell.onAdd = {
            self.addProductIfNeeded(self.products[indexPath.row])
            collectionView.reloadItems(at: [indexPath])
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width / 2) - 8, height: 300)
    }
}

