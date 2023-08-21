//
//  RedeemReferalCode.swift
//  Binge
//
//  Created by Fahad on 6/8/23.
//

import SwiftUI

struct RedeemReferalCode: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var navigateLoyalty: Bool = false
    
    @State var referralCode: String = ""
    @State var showingRedeemStatus: Bool = false
    @State var isRedeemCodeSuccessfull : Bool  = true
    var body: some View {
        ZStack{
            Color("AdaptiveBackgroundColor")
            VStack(spacing: 10){
                VStack{
                    Image("ReferAFriendBanner")
                        .resizable()
                        .frame(width: 312,height: 196)
                                        
                    Image("RedeemReferralCodeIcon")
                        .renderingMode(.template)
                        .foregroundColor(Color("AdaptiveTextColor"))
                    Text("Redeem Referral Code")
                        .foregroundColor(Color("AdaptiveTextColor"))
                        .font(.custom("Montserrat-SemiBold", size: 14))
                    TextField("Redeem Referral Code", text: $referralCode)
                    //                    .TextFieldView()
                        .padding(.horizontal,20)
                        .frame(width: 233, height: 34)
                        .background(Color("AdaptivePlaceholderColor"))
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .cornerRadius(18)
                }
                .background{
                    Image("ReferAFriendRectangleBG")
                }
                
                Button(action: {
                    showingRedeemStatus = true
                }, label: {
                    Text("Redeem")
                        .foregroundColor(Color("AdaptiveTextColor"))
                        .font(.custom("Montserrat-Bold", size: 16))
                })
                .frame(width: 261, height: 39)
                .background(Color.red)
                .cornerRadius(18)
                .padding(.top,20)
                
                Spacer(minLength: 10)
                NavigationLink( "",destination: LoyaltyPoint(), isActive: $navigateLoyalty)
            }
            .padding(.top,90)
            Spacer(minLength: 10)
            
            if showingRedeemStatus {
                ShowRedeemStatus(showingRedeemStatus: $showingRedeemStatus, isRedeemCodeSuccessfull: $isRedeemCodeSuccessfull)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:  Text("Redeem Referral Code")
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
//                        .foregroundStyle(.white)
                    }
                }
                
            }
        }

    }
}

struct RedeemReferalCode_Previews: PreviewProvider {
    static var previews: some View {
        RedeemReferalCode()
    }
}

struct ShowRedeemStatus: View {
    @Binding var showingRedeemStatus: Bool
    @Binding var isRedeemCodeSuccessfull: Bool
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
            VStack(spacing: 20){
                if isRedeemCodeSuccessfull == true {
                    Text("Redeem Successfull")
                        .font(.custom("Montserrat-Bold", size: 16))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Text("You earn coin & enjoy referral bonus")
                        .font(.system(size: 11))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .lineLimit(2)
                    Image("RedeemSuccessfull")
                        .resizable()
                        .frame(width: 38, height: 38)
                        .padding(.horizontal,105)
                } else {
                    Text("Code is not valid")
                        .font(.custom("Montserrat-ExtraBold", size: 16))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Image("RedeemFailed")
                        .resizable()
                        .frame(width: 38, height: 38)
                        .padding(.horizontal,105)
                }
                    
                
                
                    
                Button("OK") {
                    showingRedeemStatus.toggle()
                }
                .font(.custom("Montserrat-SemiBold", size: 9))
                .frame(width: 65, height: 25)
                .foregroundColor(.white)
                .background(.black)
                .cornerRadius(5)
                
                
            }
            .frame(width: 254,height: 218)
            .background(Color.red)
            .cornerRadius(15)
            .clipped()
            
        }
        .ignoresSafeArea(.all)
        
    }
}

