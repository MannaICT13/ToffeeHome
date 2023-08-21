//
//  ParentalControlFour.swift
//  TestProfileUserPage
//
//  Created by Fahad on 4/6/23.
//
// MARK: - 
import SwiftUI

struct ParentalControlFour: View {
    @State private var varificationCode: String = ""
    @State private var showingAlert = false
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
                SecureField("Enter Your Verifiction Code", text: $varificationCode)
                    .foregroundColor(Color("AdaptiveTextColor"))
                    .frame(width: 363, height: 42)
                    .background(.gray)
                    .cornerRadius(39)
                    .padding(.top,32)
                    .padding(.horizontal,15)
                
                Button {
                    showingAlert = true
                } label: {
                    Text("CONFIRM")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .frame(width: 363,height: 42)
                        .background(.red)
                        .cornerRadius(39)
                        
                }
                
                
                HStack{
                    Text("Didn't get the Code?")
                        .foregroundColor(Color("AdaptiveTextColor"))
                        .font(.custom("Montserrat-Bold", size: 14))
                    Button {
                        //
                    } label: {
                        Text("Resend")
                            .font(.custom("Montserrat-Bold", size: 14))
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .frame(width: 80, height: 23)
                            .background(Color.gray)
                            .cornerRadius(3)
                    }
                    
                }
                
                Spacer()
            }
            .offset(y:110)
            .multilineTextAlignment(.center)
            if showingAlert {
                CustomAlert(showingAlert: $showingAlert)
            }
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
//                                .padding(.leading,-15)
                                .foregroundColor(Color("AdaptiveTextColor"))
                            
                        }
                })
        
    }
}

struct ParentalControlFour_Previews: PreviewProvider {
    static var previews: some View {
        ParentalControlFour()
    }
}
