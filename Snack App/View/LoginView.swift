//
//  LoginView.swift
//  Snack App
//
//  Created by 张青木 on 2023/12/5.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.presentationMode) var mode
    
    @EnvironmentObject var user: UserManager
    
    @State private var ID = ""
    @State private var Password = ""
    
    let borderColor = Color(UIColor(red: 1.0, green: 0.82, blue: 0.0, alpha: 1.0))
    
    var body: some View {
        NavigationView{
            
            VStack{
                HStack {
                    Image("Login")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height:400)
                    .padding(.top,-250)
                }
                .padding(100)
                
                
                HStack {
                    Text("账号")
                        .font(.system(size: 20))
                        .kerning(2)
                    
                    
                    TextField("ID text here", text: $ID)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .frame(width: 200)
                        .frame(height: 40)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke(borderColor, lineWidth: 2).opacity(1))
                }
                
                HStack{
                    Text("密码")
                        .font(.system(size: 20))
                        .kerning(2)
                    
                    
                    SecureField("Password text here", text: $Password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .frame(width: 200)
                        .frame(height: 40)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke(borderColor, lineWidth: 2).opacity(1))
                }
                
                Spacer()
                    .frame(height: 25)
                
                HStack{
                    Button{
                        user.register(ID: ID, password: Password)
                    }label: {
                        Text("注册")
                            .font(.system(size: 22))
                            .foregroundColor(.black)
                            .padding(15)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(borderColor, lineWidth: 2).opacity(1).frame(width: 90,height: 45))
                    }
                    
                    Spacer()
                        .frame(width: 50)
            
                    Button{
                        user.loginUser(ID: ID, password: Password)
                        mode.wrappedValue.dismiss()
                    }label: {
                        Text("登录")
                            .font(.system(size: 22))
                            .foregroundColor(.black)
                            .padding(15)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(borderColor, lineWidth: 2).opacity(1).frame(width: 90,height: 45))
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

#Preview {
    LoginView()
}


