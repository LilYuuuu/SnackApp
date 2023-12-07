//
//  Home.swift
//  Snack App
//
//  Created by 张青木 on 2023/11/19.
//

import SwiftUI

struct Home: View {
    
//    Category View Properties
    @State var selectedCategory = ""
    
    @EnvironmentObject var carManager: CartManager
    
    @EnvironmentObject var userManager: UserManager
    
    @State private var navigateToLogin = false
    @State private var navigateTo = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
    //                Header
                    HStack{
                        Text("给你最好的零食 **零食商店**")
                            .font(.system(size: 33))
                            .padding(.trailing)
                        
                        
                        Menu {
                            if !userManager.isLoggedIn{
                                Button {
                                    self.navigateToLogin = true
                                }label: {
                                    Label("登录", systemImage: "person.fill")
                                }
                            }else{
                                Button {
                                    userManager.logoutUser()
                                }label: {
                                    Label("注销", systemImage: "person.fill")
                                }
                            }
                                
                            Button{
                                self.navigateTo = true
                            }label: {
                                Label("钱包", systemImage: "heart.fill")
                            }
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.black)
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4).foregroundColor(.black))
                            }
                    }
                    .fullScreenCover(isPresented: $navigateToLogin) {
                        LoginView()
                    }
                    .fullScreenCover(isPresented: $navigateTo) {
                        WalletView()
                    }
                    
                    .padding(30)
                    
    //                Category List
                    CategoryListView
                        .environmentObject(carManager)
                    
    //                Collection View
                    HStack{
                        Text("商店所有 **零食集合**")
                            .font(.system(size: 24))
                        
                        Spacer()
                        
                        NavigationLink {
                            CollectionView()
                                .environmentObject(carManager)
                        } label: {
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                        }
                        .foregroundColor(.black)
                        
                    }
                    .padding(.horizontal,30)
                    .padding(.vertical,15)
                    
    //                Product List
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            if selectedCategory == "Choco"{
                                self.showProductCards(productList: productListChoco)
                            } else if selectedCategory == "Chips"{
                                self.showProductCards(productList: productListChips)
                            } else if selectedCategory == "Toffee"{
                                self.showProductCards(productList: productListToffee)
                            } else if selectedCategory == "All"{
                                self.showProductCards(productList: productList)
                            }
                        }
                    }
                }
            }
        }
        .accentColor(.black)
    }
    
//    Category List View
    var CategoryListView: some View{
        HStack{
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(categoryList, id: \.id){ item in
                        Button {
                            selectedCategory = item.title
                        } label: {
                            HStack{
                                if item.title != "All"{
                                    Image(item.icon)
                                        .foregroundColor(selectedCategory == item.title ? .yellow : .black)
                                }
                                
                                Text(item.title)
                            }
                            .padding(20)
                            .background(selectedCategory == item.title ? .black : .gray.opacity(0.1))
                            .foregroundColor(selectedCategory != item.title ? .black : .white)
                            .clipShape(Capsule())
                        }
                        .onAppear {
                            if selectedCategory.isEmpty {
                                // 如果用户还没有选择任何分类，则自动选中第一个分类
                                selectedCategory = categoryList.first?.title ?? ""
                            }
                        }
                    }
                }
                .padding(.horizontal,30)
            }
        }
    }
}

#Preview {
    Home()
        .environmentObject(CartManager())
        .environmentObject(UserManager())
}

extension View {
    func showProductCards(productList: [Prodect]) -> some View {
        return ForEach(productList, id: \.id) { item in
            ProdectCard(product: item)
        }
    }
}


