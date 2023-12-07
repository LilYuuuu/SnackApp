//
//  CategoryModel.swift
//  Snack App
//
//  Created by 张青木 on 2023/11/19.
//

import SwiftUI

struct CategoryModel: Identifiable,Hashable {
    var id: UUID = .init()
    var icon: String
    var title: String
}

var categoryList: [CategoryModel] = [
    CategoryModel(icon: "", title: "All"),
    CategoryModel(icon: "巧克力", title: "Choco"),
    CategoryModel(icon: "薯片", title: "Chips"),
    CategoryModel(icon: "太妃糖", title: "Toffee"),
]
