//
//  ContentView.swift
//  Snack App
//
//  Created by 张青木 on 2023/11/17.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var cartManager = CartManager()
    @StateObject var userManager = UserManager()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Home()
                    .environmentObject(cartManager)
                    .environmentObject(userManager)
                
                if cartManager.products.count > 0{
                    NavigationLink(destination: CartView().environmentObject(cartManager).environmentObject(userManager)){
                        HStack(spacing: 30){
                            Text("\(cartManager.products.count)")
                                .padding()
                                .background(.yellow)
                                .clipShape(Circle())
                                .foregroundColor(.black)
                            
                            VStack(alignment: .leading){
                                Text("购物车")
                                    .font(.system(size: 20,weight: .semibold))
                                
                                Text("\(cartManager.products.count) 项")
                                    .font(.system(size: 18))
                            }
                            
                            Button{
                                cartManager.removeFromCartAll()
                            }label: {
                                Text("清空")
                                    .foregroundColor(.yellow) // 更改文本颜色为黄色
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 50) // 设置圆角半径为10
                                            .stroke(Color.yellow, lineWidth: 2) // 添加黄色边框
                                    )
                            }
                            .padding(.leading, -5)
                            
                            Spacer()
                            
                            ForEach(cartManager.products.prefix(2), id: \.name){ product in
                                Image(product.image)
                                    .resizable()
                                    .scaledToFit()
                                    .padding(8)
                                    .frame(width: 60, height: 60)
                                    .background(.white)
                                    .clipShape(Circle())
                                    .padding(.leading, -60)
                            }
                            
                        }
                        .padding(30)
                        .frame(width: .infinity,height: 120)
                        .background(.black)
                        .clipShape(.rect(topLeadingRadius: 60, topTrailingRadius: 60))
                        .foregroundColor(.white)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ContentView()
}
