//
//  ProductModel.swift
//  Snack App
//
//  Created by 张青木 on 2023/11/20.
//

import SwiftUI

//  ProductModel

struct Prodect: Identifiable {
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var color: Color
    var price: Int
}

//Sample Products
var productList = [
    Prodect(name: "Good Source", category: "Choco", image: "image 1", color: .pink,price: 8),
    Prodect(name: "Unreal Muffins", category: "Choco", image: "image 2", color: .yellow,price: 18),
    Prodect(name: "Twuster Chips", category: "Chips", image: "image 3", color: .red,price: 4),
    Prodect(name: "Coconut Chips", category: "Chips", image: "image 4", color: .green,price: 5),
    Prodect(name: "Regular Nature", category: "Chips", image: "image 5", color: .blue,price: 8),
    Prodect(name: "Dark Russet", category: "Chips", image: "image 6", color: .brown,price: 2),
    Prodect(name: "Smiths Chips", category: "Chips", image: "image 7", color: .orange,price: 8),
    Prodect(name: "Deep River", category: "Chips", image: "image 8", color: .purple,price: 8),
    Prodect(name: "Toffee", category: "Toffee", image: "image 9", color: .purple,price: 10),
]

var productListChoco = [
    Prodect(name: "Good Source", category: "Choco", image: "image 1", color: .pink,price: 8),
    Prodect(name: "Unreal Muffins", category: "Choco", image: "image 2", color: .yellow,price: 18),
]

var productListChips = [
    Prodect(name: "Twuster Chips", category: "Chips", image: "image 3", color: .red,price: 4),
    Prodect(name: "Coconut Chips", category: "Chips", image: "image 4", color: .green,price: 5),
    Prodect(name: "Regular Nature", category: "Chips", image: "image 5", color: .blue,price: 8),
    Prodect(name: "Dark Russet", category: "Chips", image: "image 6", color: .brown,price: 8),
    Prodect(name: "Smiths Chips", category: "Chips", image: "image 7", color: .orange,price: 8),
    Prodect(name: "Deep River", category: "Chips", image: "image 8", color: .purple,price: 8),
]

var productListToffee = [
    Prodect(name: "Toffee", category: "Toffee", image: "image 9", color: .purple,price: 10),
]
