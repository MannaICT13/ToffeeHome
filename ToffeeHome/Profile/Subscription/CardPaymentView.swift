//
//  CardPaymentView.swift
//  Binge
//
//  Created by Fahad on 13/8/23.
//

import SwiftUI

struct CardPaymentView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var CardNumber: String = ""
    @State private var CardDOB: String = ""
    @State private var CardCVV: String = ""
    @State private var CardHolderName: String = ""
    @State private var isTapped: Bool = false
    var body: some View {
        ZStack{
            Color("AdaptiveBackgroundColor2")
            Image("SubsBGImage")
                .resizable()
                .padding(.top,120)
            VStack(alignment: .leading,spacing: 10){
                Image("CardBanner")
                    .resizable()
                    .frame(width: 391,height: 161)
                
                Text("Selected Card")
                CardPaymentModel()
                    .offset(x: 50)
                Text("Card Number")
                    .font(.custom("Montserrat-Medium", size: 14))
                TextField("**** **** **** ****", text: $CardNumber)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color("AdaptiveTextColor"), lineWidth: 1)
                    )
                    .padding(.horizontal)
                HStack{
                    VStack(alignment: .leading){
                        Text("Expiery Date")
                            .font(.custom("Montserrat-Medium", size: 14))
                        TextField("DD/MM/YYYY", text: $CardDOB)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .stroke(Color("AdaptiveTextColor"), lineWidth: 1)
                            )
                            .padding(.horizontal)
                        
                    }
                    VStack(alignment: .leading){
                        Text("CVV")
                            .font(.custom("Montserrat-Medium", size: 14))
                        TextField("***", text: $CardCVV)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .stroke(Color("AdaptiveTextColor"), lineWidth: 1)
                            )
                            .padding(.horizontal)
                    }
                }
                Text("Name")
                    .font(.custom("Montserrat-Medium", size: 14))
                TextField("**** **** **** ****", text: $CardHolderName)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color("AdaptiveTextColor"), lineWidth: 1)
                    )
                    .padding(.horizontal)
                HStack(spacing: 15) {
                    Image(isTapped ? "CircleFill" : "Circle")
                        .renderingMode(.template)
                        .foregroundColor(Color("AdaptiveTextColor"))
                        .frame(width: 12,height: 12)
                        .onTapGesture {
                            isTapped.toggle()
                        }
                    Text("Save Card Details")
                        .foregroundColor(Color("AdaptiveTextColor"))
                }
                .offset(x:20)
                .padding(.top,10)
                
                Button(action: {}, label: {
                    Text("Payment")
                        .font(.custom("Montserrat-Medium", size: 14))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding()
                })
                .offset(x: 120)
            }
            .padding(.leading,10)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:   Text("Subscription")
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

struct CardPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        CardPaymentView()
    }
}


