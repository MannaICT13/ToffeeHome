//
//  PayWithView.swift
//  Binge
//
//  Created by Fahad on 10/8/23.
//

import SwiftUI

struct PayWithView: View {
    @Environment(\.presentationMode) var presentationMode
    @State  var selectedPaymentmethod: Int = 0
    @State  var isShowingFirstPopup = false
    @State  var isShowingSecondPopup = false
    @State  var isShowingThirdPopup = false
    @State var isNavigateCard  = false
    //    @State var MobilepaymentOTPVerificationCode: Int
    
    var body: some View {
        ZStack{
            Color("AdaptiveBackgroundColor2")
            Image("SubsBGImage")
                .resizable()
                .padding(.top,120)
            VStack{
                Spacer()
                Image("PayWithLogo")
                    .renderingMode(.template)
                    .foregroundColor(Color("AdaptiveTextColor"))
                Spacer()
                Button {
                    selectedPaymentmethod = 1
                    isNavigateCard = true
                } label: {
                    payWithCard(PayImage: "OnlinePayment", title: "Card", subTitle: "Pay Using card", selectedPaymentmethod: $selectedPaymentmethod, selectedCard: 1)
                }
               
                Button {
                    selectedPaymentmethod = 2
                } label: {
                    payWithCard(PayImage: "SSL", title: "SSLCOMMERZ", subTitle: "Pay using your mobile financial services", selectedPaymentmethod: $selectedPaymentmethod, selectedCard: 2)
                }
                
                Button {
                    selectedPaymentmethod = 3
                    isShowingFirstPopup = true
                } label: {
                    payWithCard(PayImage: "MobilePayment", title: "Mobile Payment", subTitle: "Pay using your Robi / Airtel Balance", selectedPaymentmethod: $selectedPaymentmethod, selectedCard: 3)
                }
                Button {
                    selectedPaymentmethod = 4
                } label: {
                    payWithCard(PayImage: "PayPal", title: "Paypal", subTitle: "Pay using Paypal", selectedPaymentmethod: $selectedPaymentmethod, selectedCard: 4)
                }
                Button {
                    selectedPaymentmethod = 5
                } label: {
                    payWithCard(PayImage: "ApplePay", title: "Apple Pay", subTitle: "Pay using your apple pay", selectedPaymentmethod: $selectedPaymentmethod, selectedCard: 5)
                }
                Button {
                    selectedPaymentmethod = 6
                } label: {
                    payWithCard(PayImage: "GooglePay", title: "Google Play", subTitle: "Pay using Google play", selectedPaymentmethod: $selectedPaymentmethod, selectedCard: 6)
                }
                Spacer()
                
            }
            NavigationLink( "",destination: CardPaymentView(), isActive: $isNavigateCard)
            if isShowingFirstPopup {
                FirstPopup( dismissAction: {
                    isShowingFirstPopup  = false
                }, showSecondPopupAction: {
                    isShowingSecondPopup = true
                }, MobilepaymentOTPVerificationCode: ""
                            
                )
            }
            
            if isShowingSecondPopup {
                secondPopup( otpVerificationCode: "", dismissAction: {
                    isShowingSecondPopup = false
                }, showThirdPopupAction: {
                    isShowingThirdPopup = true
                })
            }
            if isShowingThirdPopup {
                thirdPopup(dismissAction:{ isShowingThirdPopup = false})
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

struct PayWithView_Previews: PreviewProvider {
    static var previews: some View {
        PayWithView()
    }
}

struct payWithCard: View{
    var PayImage: String
    var title: String
    var subTitle: String
    @Binding var selectedPaymentmethod: Int
    var selectedCard: Int
    @State var CardNumber: Int = 0
    
    var body: some View{
        HStack(){
            HStack {
                Image(selectedPaymentmethod == selectedCard ? "CircleFill" : "Circle")
                    .resizable()
                    .frame(width: 16,height: 16)
                Image(PayImage)
                    .resizable()
                    .frame(maxWidth: 42, maxHeight: 55)
            }
            .frame(width: UIScreen.main.bounds.width / 2)
            
            Rectangle()
                .frame(width: 1, height: 31)
                .foregroundColor(.white)
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.custom("Montserrat-Bold", size: 16))
                        .foregroundColor(.white)
                        .fontDesign(.rounded)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                    Text(subTitle)
                        .font(.custom("Montserrat-Medium", size: 7))
                        .foregroundColor(.white)
                    
                }
                Spacer()
                
                Image("arrow")
                    .padding(.trailing,25)
            }
            .frame(width: UIScreen.main.bounds.width / 2)
            
            
            
        }
        
        .frame(width: 394, height: 71)
        .background(
            LinearGradient(gradient: Gradient(colors: [.gray.opacity(0.6), .white.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
        )
    }
}


// MARK: - FIRST POPUP

struct FirstPopup: View{
    
    @State var AutoRenewisOn = false
    let dismissAction: () -> Void
    let showSecondPopupAction: () -> Void
    @State private var isShowingSecondPopup = false
    @State var MobilepaymentOTPVerificationCode: String
    @State var selectedCountry = ""
    
    var body: some View{
        ZStack {
            Color.black.opacity(0.6)
            VStack{
                
                Text("Enter your number to verify")
                    .font(.custom("Montserrat-Bold", size: 16))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                //                    .padding(.bottom,6)
                //                    .padding(.top,17)
                
                
                
                Text("We will send you a verification code")
                    .font(.custom("Montserrat-Bold", size: 12))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                    .padding(.bottom,5)
                    
                
                
                HStack(spacing: 0){
                    Menu{
                        ForEach(countryNames(), id: \.self){ country in
                            Button{
                                selectedCountry =  country
                                
                            }label: {
                                Text(country)
                                    
                            }
                        }
                    } label: {
                        HStack(spacing: 3){
                            Image("ArrowDownThick")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(Color("AdaptiveTextColor"))
                                .frame(width: 8, height: 3)
                            if selectedCountry.isEmpty {
                                Text("Country")
                                    .foregroundColor(Color("AdaptiveTextColor"))
                                    .minimumScaleFactor(0.5)
                                    .font(.system(size: 10))
                            } else {
                                
                                HStack{
                                    Image(returnFlagByCountryName(countryName: selectedCountry))
                                        .resizable()
                                        .frame(width: 18,height: 11)
                                    //
                                    Text(returnCodeByCountryName(countryName:selectedCountry))
                                        .foregroundColor(Color("AdaptiveTextColor"))
                                        .font(.system(size: 10))
                                }
                            }
                        }
                        .padding(10)
                        .minimumScaleFactor(0.5)
                        
                    }
                    TextField("",text: $MobilepaymentOTPVerificationCode)
                        .font(.system(size: 10))
                        
                        .minimumScaleFactor(0.5)
                }
                .background(Color.gray)
                .cornerRadius(14)
                .padding(.horizontal)
                
                
                
                HStack {
                    Button("Cancel") {
                        dismissAction()
                    }
                    .font(.system(size: 9))
                    .frame(width: 65, height: 25)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(5)
                    .padding(.bottom,18)
                    
                    
                    Button("Confirm") {
                        dismissAction()
                        showSecondPopupAction()
                    }
                    .font(.system(size: 9))
                    .frame(width: 65, height: 25)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(5)
                    .padding(.bottom,18)
                }
                .padding(.horizontal,38)
            }
            
            .frame(width: 244,height: 241)
            .background(Color.red)
            .cornerRadius(15)
            .clipped()
        }
        
    }
}

// MARK: -  SECOND POPUP
struct secondPopup: View{
    @State var otpVerificationCode: String
    let dismissAction: () -> Void
    let showThirdPopupAction: () -> Void
    
    var body: some View{
        ZStack {
            Color.black.opacity(0.6)
            VStack{
                
                Text("Submit your OTP that you have just got \n via  SMS")
                    .font(.custom("Montserrat-SemiBold", size: 10))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                //.padding(.bottom,26)
                    .padding(.top,17)
                    .padding(.horizontal,10)
                    .multilineTextAlignment(.center)
                
                TextField("OTP", text: $otpVerificationCode)
                    .foregroundColor(.white)
                    .background(.white.opacity(0.4))
                    .cornerRadius(39)
                    .padding(.vertical)
                    .padding(.horizontal,15)
                
                HStack {
                    Button("Cancel") {
                        dismissAction()
                    }
                    .font(.system(size: 9))
                    .frame(width: 65, height: 25)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(5)
                    .padding(.bottom,18)
                    
                    
                    Button("Confirm") {
                        dismissAction()
                        showThirdPopupAction()
                    }
                    .font(.system(size: 9))
                    .frame(width: 65, height: 25)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(5)
                    .padding(.bottom,18)
                    
                }
                .padding(.horizontal,38)
            }
            .multilineTextAlignment(.center)
            .frame(width: 245,height: 176)
            .background(Color.red)
            .cornerRadius(15)
            //.clipped()
        }
        
    }
}

// MARK: - THIRD POPUP
struct thirdPopup: View{
    let dismissAction: () -> Void
    var body: some View{
        ZStack {
            Color.black.opacity(0.6)
            VStack{
                Text("DEAR CUSTOMER!")
                    .font(.custom("Montserrat-ExtraBold", size: 16))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                
                Text("Payment Successful")
                    .font(.custom("Montserrat-Medium", size: 16))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                
                Image("PaymentSuccessfull")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 38)
                
                
                Button("OK") {
                    dismissAction()
                }
                .font(.system(size: 9))
                .frame(width: 65, height: 25)
                .foregroundColor(.white)
                .background(.black)
                .cornerRadius(5)
                .padding(.bottom,18)
                
            }
            
            .frame(width: 245,height: 176)
            .background(Color.red)
            .cornerRadius(15)
            .clipped()
        }
        
    }
}

