//
//  WalletView.swift
//  Snack App
//
//  Created by 张青木 on 2023/12/6.
//

import SwiftUI

struct WalletView: View {
    
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    ZStack {
                        Color.yellow.opacity(0.5)
                            .frame(width: 300,height: 60)
                            .cornerRadius(20)
                        Color.yellow.opacity(0.5)
                            .frame(width:350 , height: 100)
                            .cornerRadius(20)
                        
                        Text("**余额**\(user.user.Money)¥")
                            .foregroundColor(.black)
                            .font(.title)
                            .padding()
                    }
                    .frame(width: 300)
                    
                    
                    Text("充值卡购买⬇️")
                        .font(.system(size: 25))
                        .padding()
                        .padding(.trailing,200)
                    
                    Button{
                        user.recharge(money: 25)
//                        这里跳转一个付款链接
                    }label: {
                        ZStack {
                            Color.green.opacity(0.5)
                                .frame(width: 300,height: 150)
                                .cornerRadius(20)
                            Color.green.opacity(0.5)
                                .frame(width:350 , height: 200)
                                .cornerRadius(20)
                            
                            Text("**20¥代25¥**")
                                .foregroundColor(.black)
                                .font(.title)
                                .padding(.top,-30)
                            Text("注意：花费20¥实际到账25¥")
                                .foregroundColor(.black.opacity(0.7))
                                .padding(.top,70)
                        }
                    }
                    
                    Button{
                        user.recharge(money: 65)
                    }label: {
                        ZStack {
                            Color.blue.opacity(0.5)
                                .frame(width: 300,height: 150)
                                .cornerRadius(20)
                            Color.blue.opacity(0.5)
                                .frame(width:350 , height: 200)
                                .cornerRadius(20)
                            
                            Text("**50¥代65¥**")
                                .foregroundColor(.black)
                                .font(.title)
                                .padding(.top,-30)
                            Text("注意：花费50¥实际到账65¥")
                                .foregroundColor(.black.opacity(0.7))
                                .padding(.top,70)
                        }
                    }
                    
                    Button{
                        user.recharge(money: 150)
                    }label: {
                        ZStack {
                            LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.red,
                                            Color.orange,
                                            Color.yellow,
                                            Color.green,
                                            Color.blue,
                                            Color.purple
                                        ]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                    .opacity(0.5)
                                    .frame(width: 300, height: 150)
                                    .cornerRadius(20)
                            
                            LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.red,
                                            Color.orange,
                                            Color.yellow,
                                            Color.green,
                                            Color.blue,
                                            Color.purple
                                        ]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                    .opacity(0.5)
                                    .frame(width: 350, height: 200)
                                    .cornerRadius(20)
                            
                            Text("**100¥代150¥**")
                                .foregroundColor(.black)
                                .font(.title)
                                .padding(.top,-30)
                            Text("注意：花费100¥实际到账150¥")
                                .foregroundColor(.black.opacity(0.7))
                                .padding(.top,70)
                        }
                    }
                    
                    
                }
                .navigationTitle("")// 设置导航栏标题
                .navigationBarItems(leading:
                                        Button(action: {
                    // 在这里触发返回操作
                    mode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrow.left") // 添加返回箭头图标
                        .foregroundColor(.black)
                })
                )
            }
        }
    }
}

#Preview {
    WalletView()
        .environmentObject(UserManager())
}

struct YellowCardView: View {
    let text: String
    
    var body: some View {
        ZStack {
            Color.yellow
                .frame(height: 150)
                .cornerRadius(10)
            
            Text(text)
                .foregroundColor(.black)
                .font(.title)
                .padding()
        }
    }
}
