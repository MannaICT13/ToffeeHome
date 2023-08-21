//
//  ParentalControlThree.swift
//  TestProfileUserPage
//
//  Created by Fahad on 4/6/23.
//

import SwiftUI

struct ParentalControlThree: View {
    @State private var verificationCode: String = ""
    @Environment(\.presentationMode) var presentationMode
   
    var body: some View {
        ZStack{
            Color("AdaptiveBackgroundColor2")
            Image("ParentalControlBackgroundImage")
                .resizable()
            // .aspectRatio(.)
                .offset(y:160)
            VStack(spacing: 30){
                //Spacer()
                Image("ParentalControlIcon")
                    .resizable()
                    .frame(width: 103,height: 98)
                    .aspectRatio( contentMode: .fill)
                Text("Set your Parental Lock PIN")
                    .padding(.top,70)
                    .foregroundColor(Color("AdaptiveTextColor"))
                    .font(.custom("Montserrat-Bold", size: 16))
                    .fontWeight(.bold)
                    .padding(.bottom,33)
                SecureField("Enter Your Verification Code", text: $verificationCode)
                    .foregroundColor(Color("AdaptiveTextColor"))
                    .frame(width: 363, height: 42)
                //                    .background(.gray.opacity(0.4))
                    .background(.gray)
                    .cornerRadius(39)
                    .padding(.top,32)
                    .padding(.horizontal,15)
                Text("PIN Varification Failed")
                    .foregroundColor(.red)
                    .font(.custom("Montserrat-Bold", size: 10))
                
                
                
                NavigationLink(destination: ParentalControlFour()){
                    Text("CONFIRM")
                        .foregroundColor(Color("AdaptiveTextColor"))
                        .fontWeight(.bold)
                        .frame(width: 363,height: 42)
                        .background(.red)
                        .cornerRadius(39)
                }
                HStack{
                    Text("Didn't get Code?")
                        .foregroundColor(Color("AdaptiveTextColor"))
                        .font(.custom("Montserrat-Bold", size: 12))
                    Button {
                        //
                    } label: {
                        Text("Resend")
                            .font(.custom("Montserrat-Bold", size: 12))
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .frame(width: 54, height: 17)
                            .background(Color.gray)
                            .cornerRadius(3)
                    }
                    
                }
                
                
                Spacer()
            }
            .offset(y:110)
            .multilineTextAlignment(.center)
        }
        .ignoresSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:   Text("Parental Lock")
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

struct ParentalControlThree_Previews: PreviewProvider {
    static var previews: some View {
        ParentalControlThree( )
    }
}
