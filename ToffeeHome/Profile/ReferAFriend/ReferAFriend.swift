//
//  ReeferAFriend.swift
//  Binge
//
//  Created by Fahad on 6/8/23.
//

import SwiftUI

struct ReeferAFriend: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var navigateLoyalty: Bool = false
    var body: some View {
        ZStack{
            Color("AdaptiveBackgroundColor")
            VStack(spacing: 10){
                VStack{
                    Image("ReferAFriendBanner")
                        .resizable()
                        .frame(width: 312,height: 196)
                    Text("******")
                        .foregroundColor(.red)
                        .font(.custom("Montserrat-Bold", size: 25))
                        .overlay(
                            Rectangle()
                                .stroke(Color("AdaptiveTextColor"), style: StrokeStyle(lineWidth: 2,dash: [2]))
                                .padding(.horizontal,-30)
                                .padding(.top,-10)
                        )
                        .padding()
                    Text("Share your code with your friends and get exciting bonus point")
                        .foregroundColor(Color("AdaptiveTextColor"))
                        .font(.custom("Montserrat-SemiBold", size: 12))
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .padding(.horizontal)
                    Text("or")
                    
                    Button(action: {
                        print("Refer Button tapped")
                    }) {
                        Text("Refer")
                            .font(.custom("Montserrat-Bold", size: 16))
                            .foregroundColor(.red)
                            .padding(.horizontal,60)
                            .padding(.vertical,10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.red, lineWidth: 2)
                            )
                    }
                }
                .background{
                    Image("ReferAFriendRectangleBG")
                }
                VStack(alignment: .leading,spacing: 20) {
                    Text("Share")
                        .font(.custom("Montserrat-Bold", size: 14))
                    
                    
                    HStack(spacing: UIScreen.main.bounds.width / 7){
                        Button(action: {}, label: {
                            SocialMediaIcon(SMIcon: "Facebook")
                        })
                        SocialMediaIcon(SMIcon: "Instagram")
                        SocialMediaIcon(SMIcon: "Gmail")
                    }
                    HStack(spacing: UIScreen.main.bounds.width / 7){
                        SocialMediaIcon(SMIcon: "WhatsApp")
                        SocialMediaIcon(SMIcon: "Twitter")
                        SocialMediaIcon(SMIcon: "Messenger")
                    }
                }
                Button(action: {}, label: {
                    Text("Share")
                        .foregroundColor(.white)
                        .font(.custom("Montserrat-Bold", size: 16))
                })
                .frame(width: 261, height: 39)
                .background(Color.red)
                .cornerRadius(18)
                .padding(.top,20)
            }
            NavigationLink( "",destination: LoyaltyPoint(), isActive: $navigateLoyalty)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:  Text("User Profile Edit")
            .foregroundColor(Color("AdaptiveTextColor"))
            .font(.custom("Montserrat-Bold", size: 16))
        )
        .navigationBarItems(leading:
                                Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.backward")
                    .foregroundColor(Color("AdaptiveTextColor"))
                
            }
        })
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button {
                    navigateLoyalty = true
                } label: {
                    VStack {
                        Image("CircleFill")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.red)
                            .frame(width: 8,height: 8)
                            .offset(x: -7,y: 9)
                        Image("LoyaltyPoint")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .frame(width: 32, height: 22)
                        
                    }
                    
                }
                
            }
            
        }
    }
}

struct ReeferAFriend_Previews: PreviewProvider {
    static var previews: some View {
        ReeferAFriend()
    }
}

struct SocialMediaIcon: View {
    let Images = ["Facebook","Instagram","Gmail","WhatsApp","Twitter","Messenger"]
    var SMIcon : String
    //    var SMIcon
    var body: some View{
        
        Image(SMIcon)
            .resizable()
            .frame(width: 32,height: 32)
            .padding(10)
            .background{
                Color("SMIBG")
                
            }
            .cornerRadius(10)
        
    }
}
