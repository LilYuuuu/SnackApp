//
//  CartManager.swift
//  Snack App
//
//  Created by 张青木 on 2023/11/21.
//

import SwiftUI

class CartManager: ObservableObject{
    
    @Published private(set) var products: [Prodect] = []
    @Published private(set) var total: Int = 0
    
    func addToCart(product: Prodect){
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product:Prodect){
        products = products.filter{ $0.id != product.id } // 筛选出符合标准的
        total -= product.price
    }
    
    func removeFromCartOne(){
        total -= products[0].price
        products.removeFirst()
    }
    
    func removeFromCartAll(){
        total = 0
        products = []
    }
    
    func removeProduct(product: Prodect) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            total -= products[index].price
            products.remove(at: index)
        }
    }
    
}
