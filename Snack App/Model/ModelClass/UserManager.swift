//
//  UserManager.swift
//  Snack App
//
//  Created by 张青木 on 2023/12/6.
//

import SwiftUI

class UserManager: ObservableObject{
    
    @Published var isLoggedIn = true
    @Published private(set) var user: User = User(ID: 1, Money: 50)
    
    func payment(money: Int) ->(String,Bool) {
        if money > user.Money{
            return ("余额不足",false)
        }else{
            user.Money -= money
            return ("支付成功",true)
        }
    }
    
    func recharge (money: Int) {
        user.Money += money
    }
    
    func loginUser(ID:String,password:String){
        user = user1
        isLoggedIn = true
    }
    
    func logoutUser(){
        user.ID = 0
        user.Money = 0
        isLoggedIn = false
    }
    
    func register(ID:String,password:String){
        
    }
}
