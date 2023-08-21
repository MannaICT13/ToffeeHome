//
//  ParentalUnlockTwo.swift
//  Binge
//
//  Created by Fahad on 2/8/23.
//

import SwiftUI

struct ParentalUnlockTwo: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var unlockPin:String = ""
    @State private var showingLockAlert = false
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
                Text("Set your Parental Unlock PIN")
                    .padding(.top,70)
                    .foregroundColor(Color("AdaptiveTextColor"))
                    .font(.custom("Montserrat-VariableFont_wght", size: 16))
                    .fontWeight(.bold)
                SecureField("PIN", text: $unlockPin)
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
                            Button(action: {
                                showingLockAlert = true
                            }, label: {
                                Text("CONFIRM")
                                    .foregroundColor(Color("AdaptiveTextColor"))
                                    .fontWeight(.bold)
                                    .frame(width: 363,height: 42)
                                    .background(.red)
                                    .cornerRadius(39)
                            })
                Spacer()
            }
            .offset(y:110)
            .multilineTextAlignment(.center)
            
            if showingLockAlert {
                CustomLockAlert(showingLockAlert: $showingLockAlert)
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
                                .foregroundColor(Color("AdaptiveTextColor"))
                        }
                })

    }
}

struct ParentalUnlockTwo_Previews: PreviewProvider {
    static var previews: some View {
        ParentalUnlockTwo()
    }
}

struct CustomLockAlert: View {
    @Binding var showingLockAlert: Bool
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
            VStack{
                Image("ParentalLockConfirm")
                    .resizable()
                    .frame(width: 34, height: 26)
                    .padding(.horizontal,105)
                    .padding(.top,23)
                    .padding(.bottom,17)
                Text("PARENTAL UNLOCK")
                    .font(.custom("Montserrat-Bold", size: 16))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.bottom,20)
                Text("Your PIN in successfully used to unlock \n                 restricted 18+ content")
                    .font(.system(size: 11))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .lineLimit(2)
                    
                Button("OK") {
                    showingLockAlert.toggle()
                }
                .frame(width: 64, height: 24)
                .foregroundColor(.white)
                .background(.black)
                .cornerRadius(5)
                .padding(.bottom,18)
                .padding(.top)
                
                
            }
            .frame(width: 254,height: 218)
            .background(Color.red)
            .cornerRadius(15)
            .clipped()
        }
        .ignoresSafeArea(.all)
    }
}
