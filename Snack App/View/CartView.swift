//
//  CartView.swift
//  Snack App
//
//  Created by 张青木 on 2023/11/20.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var carManager: CartManager
    @EnvironmentObject var userManager: UserManager
    @State var u = false
    @State private var showingTip = false
    
    @Environment(\.presentationMode) var mode
    
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    @State var judge :(String,Bool) = ("",false)
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack{
                        Text("购物车")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button{
                            mode.wrappedValue.dismiss()
                        } label: {
                            Text("\(carManager.products.count)")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70,height: 90)
                                .background(.yellow.opacity(0.5))
                                .clipShape(Capsule())
                        }
                        .foregroundColor(.black)
                        
                        Button{
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70,height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                        }
                        .foregroundColor(.black)
                    }
                    .padding(30)
                    

                    
//                    Cart Products
                    VStack(spacing: 20) {
                        ForEach(carManager.products, id: \.id){ item in
                            CartProdectCard(product: item)
                                .environmentObject(carManager)
                        }
                    }
                    .padding(.horizontal)
                    
//                    Card Total
                    VStack(alignment: .leading){
                        HStack{
                            Text("账单")
                                .font(.system(size: 24,weight: .semibold))
                            Spacer()
                            Text("金额")
                                .font(.system(size: 20,weight: .semibold))
                        }
                        
                        Divider()
                        
                        Text("总额")
                            .font(.system(size: 24))
                        
                        Text("RMB \(carManager.total)")
                            .font(.system(size: 36,weight: .semibold))
                    }
                    
                    .padding(30)
                    .frame(maxWidth: .infinity)
                    .background(.yellow.opacity(0.5))
                    .clipShape(.rect(cornerRadius: 30))
                    .padding()
                    
//                    Button
                    Button{
                        if userManager.isLoggedIn{
                            if carManager.products.count<=0{
                                judge=("购物车为空",true)
                                showingAlert2 = true
                            }else{
                                judge = userManager.payment(money: carManager.total)
                                if judge.1{
                                    carManager.removeFromCartAll()
                                    self.showingAlert2 = true
                                }else{
                                    self.showingAlert2 = true
                                }
                            }
                        }else{
                            u = true
                        }
                            
                    } label: {
                        Text("立即支付")
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(.yellow.opacity(0.5))
                            .font(.system(size: 20,weight: .semibold))
                            .foregroundColor(.black)
                            .clipShape(Capsule())
                            .padding()
                    }
                }
                .alert(isPresented: $showingAlert2) {
                    Alert(title: Text("提示"), message: Text(judge.0), dismissButton: .default(Text("好的"),action: {
                        print("222")
                    }))
                }
                .fullScreenCover(isPresented: $u) {
                    LoginView()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
        .environmentObject(UserManager())
}

//CartProduct
struct CartProdectCard: View{
    
    @EnvironmentObject var carManager: CartManager
    
    var product: Prodect
    
    var body: some View{
        HStack(alignment: .center,spacing: 20){
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 80, height: 80)
                .background(.gray.opacity(0.1))
                .clipShape(Circle())

            VStack(alignment: .leading, content: {
                Text("\(product.name)")
                    .font(.headline)
                
                Text(product.category)
                    .font(.callout)
                    .opacity(0.5)
                
            })
            
            Spacer()
            
            Button{
                carManager.removeProduct(product: product)
            }label: {
                Text("取消")
                    .foregroundColor(.black)
                            .padding()
                            .background(
                                Circle()
                                    .fill(Color.yellow.opacity(0.5))
                            )
            }
            
            Text("$\(product.price)")
                .padding()
                .background(.yellow.opacity(0.5))
                .clipShape(Capsule())
            
        }
    }
    
}
