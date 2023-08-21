//
//  ParentalControlTwo.swift
//  TestProfileUserPage
//
//  Created by Fahad on 4/6/23.
//

import SwiftUI

struct ParentalControlTwo: View {
    @State private var pin: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            Color("AdaptiveBackgroundColor2")
            Image("ParentalControlBG")
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
                    .font(.custom("Montserrat-VariableFont_wght", size: 16))
                    .fontWeight(.bold)
                SecureField("PIN", text: $pin)
                    .foregroundColor(Color("AdaptiveTextColor"))
                    .frame(width: 363, height: 42)
                    .background(.gray.opacity(0.4))
                    .cornerRadius(39)
                    .padding(.top,32)
                    .padding(.horizontal,15)

               
//                    Button {
//                        //
//                    } label: {
//                        Text("LOCK NOW")
//                            .foregroundColor(Color.white)
//                            .fontWeight(.bold)
//                            .frame(width: 363,height: 42)
//                            .background(.red)
//                            .cornerRadius(39)
//                    }
                NavigationLink(destination: ParentalControlThree()){
                        Text("CONFIRM")
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .fontWeight(.bold)
                            .frame(width: 363,height: 42)
                            .background(.red)
                            .cornerRadius(39)
                    
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

struct ParentalControlTwo_Previews: PreviewProvider {
    static var previews: some View {
        ParentalControlTwo()
    }
}
