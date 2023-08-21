//
//  ParentalControl.swift
//  TestProfileUserPage
//
//  Created by Fahad on 4/6/23.
//

import SwiftUI

struct ParentalControl: View {
    @Environment(\.presentationMode) var presentationMode
    @State var ifLock: Bool = false
    
    var body: some View {
        //NavigationView {
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
                    if ifLock {
                        Text("Lock Content With Your Personal PIN")
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .font(.custom("Montserrat-VariableFont_wght", size: 16))
                            .fontWeight(.bold)
                    } else {
                        Text("Content Locked")
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .font(.custom("Montserrat-VariableFont_wght", size: 16))
                            .fontWeight(.bold)
                    }
                    Text("Will anyone under the age of 18 be watching resticted \n content?")
                        .foregroundColor(Color("AdaptiveTextColor"))
                        .font(.custom("Montserrat-VariableFont_wght", size: 11))
                        .fontWeight(.bold)
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
                    
                    if ifLock == true {
                        NavigationLink(destination: ParentalControlTwo()){
                                Text("LOCK NOW")
                                .foregroundColor(Color("AdaptiveTextColor"))
                                    .fontWeight(.bold)
                                    .frame(width: 363,height: 42)
                                    .background(.red)
                                    .cornerRadius(39)
                            
                        }
                    } else {
                        NavigationLink(destination: ParentalUnlockTwo()){
                                Text("UNLOCK NOW")
                                .foregroundColor(Color("AdaptiveTextColor"))
                                    .fontWeight(.bold)
                                    .frame(width: 363,height: 42)
                                    .background(.red)
                                    .cornerRadius(39)
                            
                        }
                    }
                    Text("Click Lock Now to setup Personal PIN")
                        .foregroundColor(Color("AdaptiveTextColor"))
                        .font(.custom("Montserrat-Bold", size: 11))
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .offset(y:110)
                .multilineTextAlignment(.center)
            }
            .edgesIgnoringSafeArea(.all)
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
                                    .renderingMode(.template)
                                    .foregroundColor(Color("AdaptiveTextColor"))
                            }
                    })
        //}
    }
}

struct ParentalControl_Previews: PreviewProvider {
    static var previews: some View {
       
            ParentalControl()
            
    
    }
}
