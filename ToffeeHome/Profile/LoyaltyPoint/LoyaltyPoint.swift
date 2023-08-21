//
//  LoyaltyPoint.swift
//  Binge
//
//  Created by Fahad on 6/8/23.
//

import SwiftUI

struct LoyaltyPoint: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
            Color("AdaptiveBackgroundColor")
            Image("LoyaltyPointBG")
                .resizable()
                .padding(.top,40)
            VStack{
                Image("LoyaltyPoint")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color("AdaptiveTextColor"))
                    .frame(width: 71, height: 50)
                Text("Available GP Point")
                Text("800")
                Button(action: {}, label: {
                    Text("Gift Binge Points")
                        .foregroundColor(.white)
                })
                .padding(10)
                .background(Color(red: 1, green: 0, blue: 0))
                .cornerRadius(10)
                .padding(.bottom)
                ScrollView(.vertical){
                    VStack{
                        LoyaltyPointPackCard(PackSize: 1, PackDuration: 3, PackPoint: 3500)
                        LoyaltyPointPackCard(PackSize: 1, PackDuration: 3, PackPoint: 3500)
                        LoyaltyPointPackCard(PackSize: 1, PackDuration: 3, PackPoint: 3500)
                        LoyaltyPointPackCard(PackSize: 1, PackDuration: 3, PackPoint: 3500)
                        LoyaltyPointPackCard(PackSize: 1, PackDuration: 3, PackPoint: 3500)
                    }
                }
                
                
                Spacer()
                  
                    
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:   Text("Loyalty Point")
            .font(.custom("Montserrat-Bold", size: 16))
            .foregroundColor(Color("AdaptiveTextColor")))
        .navigationBarItems(leading:
                                Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.backward")
                    .foregroundColor(Color("AdaptiveTextColor"))
                
            }
        })
    }
}

struct LoyaltyPoint_Previews: PreviewProvider {
    static var previews: some View {
        LoyaltyPoint()
    }
}

struct LoyaltyPointPackCard: View {
    var PackSize: Int
    var PackDuration: Int
    var PackPoint: Int
   
    
    var body: some View{
        HStack{
            HStack(spacing: 10){
                Image("LoyaltyPackCardImage")
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 32,height: 26)
                VStack(alignment: .leading){
                    Text("\(PackSize)GB")
                        .foregroundColor(.white)
                    Text("\(PackDuration) Days")
                        .foregroundColor(.white)
                }
            }
            Spacer()
            HStack{
                Text("\(PackPoint) points")
                    .foregroundColor(.white)
                Image("arrow")
            }
        }
        .padding(.horizontal,20)
        .padding(.vertical)
        .background(LinearGradient(
            stops: [
            Gradient.Stop(color: Color(red: 0.29, green: 0.3, blue: 0.3), location: 0.00),
            Gradient.Stop(color: Color(red: 0.29, green: 0.3, blue: 0.3).opacity(0.5), location: 1.00),
            ],
            startPoint: UnitPoint(x: 0.5, y: 0),
            endPoint: UnitPoint(x: 0.5, y: 1)
            ))
    }
}
