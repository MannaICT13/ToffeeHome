//
//  SubscriptionUI.swift
//  Binge
//
//  Created by Fahad on 9/8/23.
//

import SwiftUI

struct SubscriptionUI: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State  var selectedPaymentmethod: Int = 0
    @State var selectedPackButton: Int = 1
    @State private var voucherCode: String = ""
    @State  var packBuyPopup = false
    @State var unsubscriveButton  = false
    @State var packItem  = PackItem(PackDuration: "", PackPrice: 0, PackPriceWithoutVAT: 0, PackValidity: 0)
    
    @State private var navigateMobile: Bool = false
    @State private var navigateOnline: Bool = false
    @State private var navigateGoogle: Bool = false
    
    let colums: [GridItem] = [
        GridItem(.flexible(),spacing: 5,alignment: .center),
        GridItem(.flexible(),spacing: 5,alignment: .center)
    ]
    var body: some View {
        ZStack{
            Color("AdaptiveBackgroundColor2")
            Image("SubsBGImage")
                .resizable()
                .padding(.top,120)
            ScrollView(.vertical){
            VStack(spacing: 20){
                Spacer()
                Image("Subscription")
                    .resizable()
                    .frame(width: 75,height: 75)
                    .aspectRatio( contentMode: .fill)
                
                HStack(spacing: 0){
                    Button {
                        selectedPackButton = 1
                    } label: {
                        Text("Current Plan")
                    }
                    .foregroundColor(.white)
                    .frame(width: 167, height: 41)
                    .background(selectedPackButton == 1 ? .red : .gray)
                    Button {
                        selectedPackButton = 2
                    } label: {
                        Text("Payment History")
                            .foregroundColor(.white)
                            .frame(width: 167, height: 41)
                            .background(selectedPackButton == 2 ? .red : .gray)
                        
                    }
                    
                }
                .cornerRadius(7)
                if selectedPackButton == 1 {
                    //                    ScrollView(.vertical){
                    HStack{
                        Text("Active Daily Pack")
                            .foregroundColor(.red)
                        Spacer()
                        Button(action: {
                            unsubscriveButton = true
                        }, label: {
                            Text("UNSUBSCRIBE")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .padding(5)
                                .background(Color.white)
                                .cornerRadius(7)
                        })
                    }
                    .padding(.horizontal,20)
                    Text("SUBSCRIBE THROUGH GIFT VOUCHER CODE")
                        .foregroundColor(.red)
                        .font(.custom("Montserrat-Medium", size: 14))
                    
                    
                    HStack{
                        TextField("Voucher Code", text: $voucherCode)
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .frame(width: 231, height: 32)
                            .background(.gray.opacity(0.4))
                            .cornerRadius(39)
                            .padding(.horizontal,15)
                        
                        Button(action: {}, label: {
                            Text("Apply")
                                .frame(width: 112,height: 32)
                                .foregroundColor(.white)
                                .background(Color.red)
                                .cornerRadius(13)
                        })
                    }
                    
                    VStack{
                        Text("CHOOSE A PLAN AND ENJOY ALL BINGE PREMIUM CONTENTS")
                            .font(.custom("Montserrat-Medium", size: 13))
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .padding(.horizontal)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        
                        LazyVGrid(columns: colums) {
                            ForEach(0..<packItems.count, id: \.self){index in
                                PackDetails(packBuyPopup: $packBuyPopup, packItem: packItems[index], priceData: {
                                    packItem = packItems[index]
                                }, dismissAction: {
                                    packBuyPopup = false
                                })
                                .onTapGesture {
                                    packItem = packItems[index]
                                }

                            }
                        }.padding(.bottom,50)
                       
                        /*
                        VStack{
                            ForEach(0 ..< packItems.count, id: \.self) { index in
                                HStack{
                                    PackDetails(packBuyPopup: $packBuyPopup, packItem: packItems[index], priceData: {
                                        packItem = packItems[index]
                                    }, dismissAction: {
                                        packBuyPopup = false
                                    })
                                    .onTapGesture {
                                        packItem = packItems[index]
                                    }
                                    PackDetails(packBuyPopup: $packBuyPopup, packItem: packItems[index], priceData: {
                                        packItem = packItems[index]
                                    }, dismissAction: {
                                        packBuyPopup = false
                                    })
                                    .onTapGesture {
                                        packItem = packItems[index]
                                    }
                                }
                            }
                            //                            if coun%2 == 1 {}
                            
                            PackDetails(packBuyPopup: $packBuyPopup, packItem: packItem, priceData: {
                                packItem = packItems[0]
                            }, dismissAction: {
                                packBuyPopup = false
                            })
                            .onTapGesture {
//                                 packItem = packItems[index]
                            }
                        } */
                        //                            }.allowsTightening(true)
                    }
                }
                if selectedPackButton == 2 {
                    ScrollView(.vertical){
                        PaymentHistoryCard(packName: "30 Days unlimited binge", paymentMethod: "BKash", paymentPrice: "BDT 50.00", payymentDate: "2023-05-09")
                        PaymentHistoryCard(packName: "Drama single subscription", paymentMethod: "Nagad", paymentPrice: "BDT 10.00", payymentDate: "2023-06-09")
                    }
                }
                
            }//: VStack
            .offset(y: 50)
            .multilineTextAlignment(.center)

                Spacer()
        }
            
            if packBuyPopup {
                PackConfirmation(dismissAction:{
                    packBuyPopup = false
                    
                }, packItem: packItem)
            }
            if unsubscriveButton  {
                unsubscrivePopup {
                    unsubscriveButton = false
                }
            }
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

struct SubscriptionUI_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionUI()
    }
}


//MARK: - Pack Details Card

struct PackDetails: View{
    @Binding  var packBuyPopup: Bool
    var packItem: PackItem
    var priceData : () -> Void
    let dismissAction: () -> Void

    
    var body: some View{
        ZStack{
            Image("BingePackCard")
                .frame(width: 167, height: 175)
                .overlay {
                    VStack(spacing: 7){
                        Text("\(packItem.PackDuration) Pack")
                            .foregroundColor(.white)
                            .font(.custom("Montserrat-Bold", size: 15))
                            .padding(.bottom,5)
                        VStack{
                            Text("৳\(packItem.PackPrice,specifier: "%0.1f")")
                                .foregroundColor(.white)
                                .font(.custom("Montserrat-Bold", size: 28))
                            Text("BDT \(packItem.PackPriceWithoutVAT,specifier: "%0.1f") + ")
                                .foregroundColor(.white)
                                .font(.custom("Montserrat-SemiBold", size: 10))
                                .foregroundColor(.black)
                            +
                            Text("(VAT+SD+SC)")
                                .font(.custom("Montserrat-SemiBold", size: 8))
                                .foregroundColor(.secondary)
                        }
                        Text("Validity \(packItem.PackValidity)  day.")
                            .foregroundColor(.white)
                            .font(.custom("Montserrat-SemiBold", size: 10))
                        Text("Non Auto Renew")
                            .foregroundColor(.red)
                            .font(.custom("Montserrat-SemiBold", size: 8))
                        Button(action: {
                            withAnimation(.spring()){
                                priceData()
                                packBuyPopup = true
                               
                            }
                        }, label: {
                            Text("Subscribe Now")
                                .font(.custom("Montserrat-Medium", size: 10))
                                .foregroundColor(.white)
                                .padding(.horizontal,20)
                                .padding(.vertical,10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(Color.red, lineWidth: 2)
                                )
                        })
                        .onTapGesture {
                            packBuyPopup = false
                        }
                        .cornerRadius(25)
                    }
                }
        }
        
    }
}

// Pop Up Struct
struct PackConfirmation: View {
    let dismissAction: () -> Void
    var packItem: PackItem
    
    var body: some View{
        ZStack {
            Color.black.opacity(0.7)
            VStack(spacing: 15){
                
                Text("\(packItem.PackDuration) Pack BDT \(packItem.PackPriceWithoutVAT, specifier: "%0.1f") + (VAT) \(packItem.PackValidity) Day")
                    .font(.custom("Montserrat-SemiBold", size: 18))
                    .padding(.horizontal,40)
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.bottom,6)
                    .padding(.top,17)
                
                
                
                Text("Would you like to buy this pack now?")
                    .font(.custom("Montserrat-SemiBold", size: 12))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                    .padding(.bottom,5)
                    .onAppear{
                        //                        print(mobilePackItems.description)
                        
                    }
                
                
                
                HStack {
                    Button("CANCEL") {
                        dismissAction()
                        
                    }
                    .font(.custom("Montserrat-SemiBold", size: 12))
                    .frame(width: 124, height: 38)
                    .padding(2)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(10)
                    
                    
                    
                    NavigationLink(destination: PayWithView()){
                        Text("CONFIRM BUY")
                            .font(.custom("Montserrat-SemiBold", size: 12))
                            .frame(width: 124, height: 38)
                            .padding(2)
                            .foregroundColor(.white)
                            .background(.red)
                            .cornerRadius(10)
                    }
                    
                    
                }
            }
            
            .frame(width: 331,height: 222)
            .border(.red)
            .background(
                LinearGradient(gradient: Gradient(colors: [.red, .black]), startPoint: .top, endPoint: .bottom)
            )
            .clipped()
            .cornerRadius(15)
            .clipped()
            
        }
        
    }
}
struct PaymentHistoryCard: View{
    var packName: String
    var paymentMethod: String
    var paymentPrice: String
    var payymentDate: String
    
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text(packName)
                    .foregroundColor(.red)
                Text(paymentPrice)
                    .foregroundColor(.white)
            }
            Spacer()
            VStack{
                Text(paymentPrice)
                    .foregroundColor(.white)
                Text(payymentDate)
                    .foregroundColor(.white)
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

struct unsubscrivePopup: View{
    let dismissAction: () -> Void
    var body: some View{
        ZStack {
            Color.black.opacity(0.56)
            VStack(spacing: 10){
                Text("Are you sure you want to unsubscribe this plan?")
                    .foregroundColor(.white)
                    .font(.custom("Montserrat-SemiBold", size: 18))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,25)
                Image("ReactionFace")
                HStack {
                    Button("CANCEL") {
                        dismissAction()
                    }
                    .font(.custom("Montserrat-SemiBold", size: 14))
                    .frame(width: 124, height: 37)
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(10)
                    .padding(.bottom,18)
                    
                    
                    Button("UNSUBSCRIBE") {
                        dismissAction()
                        
                    }
                    .font(.custom("Montserrat-SemiBold", size: 14))
                    .frame(width: 124, height: 37)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(10)
                    .padding(.bottom,18)
                    
                    
                }
            }
            .frame(width: 331,height: 222)
            .background(
                LinearGradient(gradient: Gradient(colors: [.red, .black]), startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(15)
            .clipped()
        }
    }
}
