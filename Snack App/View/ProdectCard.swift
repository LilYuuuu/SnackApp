//
//  ProdectCard.swift
//  Snack App
//
//  Created by 张青木 on 2023/12/5.
//

import SwiftUI


//Cart Product
struct ProdectCard: View {
    
    @EnvironmentObject var carManager: CartManager
    
    var product: Prodect
    
    var body: some View {
        ZStack{
            
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing,-200)
                .rotationEffect(Angle(degrees: 30))
            
            ZStack{
                VStack(alignment: .leading, content: {
                    Text("\(product.name)")
                        .font(.system(size: 36, weight: .semibold))
                        .frame(width: 140)
                    Text(product.category)
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack{
                        Text("¥\(product.price).0")
                            .font(.system(size: 24,weight: .semibold))
                        Spacer()
                        
                        Button{
                            carManager.addToCart(product: product)
                        }label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 90,height: 68)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal,-10 )
                        
                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(.white.opacity(0.9))
                    .clipShape(Capsule())
                })
            }
            .padding(30)
            .frame(width: 336,height: 422)
        }
        .frame(width: 336,height: 422)
        .background(product.color.opacity(0.13))
        .clipShape(.rect(cornerRadius: 57))
        .padding(.leading,20)
    }
    
    
    
}

