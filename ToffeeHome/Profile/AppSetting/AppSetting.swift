//
//  AppSetting.swift
//  Binge
//
//  Created by Fahad on 24/7/23.
//

import SwiftUI

struct AppSetting: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var code: String = ""
    @State private var selectLanguage: String = "English"
    let selectionLanguage = ["Bengali","English","Hindi"]
    @State var languageSelection: String = ""
    @State var selectedDataSaveMode: Int = 1
    
    //Content Running Mode Radio Button
    @State var isClickedWifi: Bool = false
    @State var isClickedMobile: Bool = false
    @State var isClickedBoth: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            HStack( spacing: 10){
                Image("ConnectToTV")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color("AdaptiveTextColor"))
                Text("Connect To TV")
                    .font(.custom("Montserrat-Bold", size: 16))
                Spacer(minLength: 10)
            }
            VStack(alignment: .center, spacing: 20){
                Text("Scan QR Code")
                    .font(.custom("Montserrat-SemiBold", size: 16))
                Text("Place qr code inside the frame to scan please avoid shake to get results quickly")
                    .font(.custom("Montserrat-Medium", size: 12))
                    .foregroundColor(Color("AdaptiveTextColor").opacity(0.5))
                    .multilineTextAlignment(.center)
                Image("ScanQRCode")
                
                Button {
                    
                } label: {
                    Text("Scan Your QR Code")
                        .font(.custom("Montserrat-Light", size: 12))
                        .foregroundColor(.white)
                        .frame(width: 274, height: 32)
                        .background(Color.red)
                        .cornerRadius(39)
                }
                
                TextField("Enter your Code", text: $code)
                //                    .TextFieldView()
                    .padding(.horizontal,20)
                    .frame(width: 184, height: 32)
                    .background(Color(red: 0.43, green: 0.43, blue: 0.43).opacity(0.5))
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .cornerRadius(39)
            }
            HStack{
                Image("Language")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color("AdaptiveTextColor"))
                Text("Language")
                    .font(.custom("Montserrat-Bold", size: 16))
            }
            
            
            Menu{
                Button(action: {
                    languageSelection = "English"
                }, label: {
                    Text("English")
                })
                Button(action: {
                    languageSelection = "Bangla"
                }, label: {
                    Text("Bangla")
                })
                Button(action: {
                    languageSelection = "Hindi"
                }, label: {
                    Text("Hindi")
                })
            } label: {
                HStack{
                    if languageSelection.isEmpty{
                        Text("Select Your Language")
                            .foregroundColor(Color("AdaptiveTextColor"))
                        
                    } else {
                        Text(languageSelection)
                            .foregroundColor(Color("AdaptiveTextColor"))
                    }
                    Spacer()
                    Image("DropDown")
                        .frame(width: 7, height: 4)
                }
                .font(.system(size: 12))
                .padding()
                .frame(width: 184, height: 32)
                .background(Color("AdaptivePlaceholderColor").opacity(0.5))
                .cornerRadius(39)
                .offset(x: 90)
            }
            
            HStack{
                Image("DataSaverMode")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color("AdaptiveTextColor"))
                Text("Data Saver Mode")
                    .font(.custom("Montserrat-Bold", size: 16))
                
            }
            HStack{
                Button(action: {
                    selectedDataSaveMode = 1
                }, label: {
                    Text("OFF")
                        .font(.custom("Montserrat-Bold", size: 12))
                        .foregroundColor(selectedDataSaveMode == 1 ? Color.white : Color("AdaptiveTextColor"))
                        .frame(width: 61,height: 32)
                        .background(selectedDataSaveMode == 1 ? .red : Color("AdaptivePlaceholderColor").opacity(0.5))
                        .cornerRadius(39)
                    
                })
                Button(action: {
                    selectedDataSaveMode  = 2
                }, label: {
                    Text("ON")
                        .font(.custom("Montserrat-Bold", size: 12))
                        .foregroundColor(selectedDataSaveMode == 2 ? Color.white : Color("AdaptiveTextColor"))
                        .frame(width: 61,height: 32)
                        .background(selectedDataSaveMode == 2 ? .red : Color("AdaptivePlaceholderColor").opacity(0.5))
                        .cornerRadius(39)
                    
                })
            }
            .offset(x: 120)
            
            
            HStack{
                Image("ContentRunningMode")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color("AdaptiveTextColor"))
                Text("Content Running Mode")
                    .font(.custom("Montserrat-Bold", size: 16))
            }
            HStack{
                ContentRunningModeRadioButton(isClicked: isClickedWifi)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isClickedWifi = true
                            isClickedMobile = false
                            isClickedBoth = false
                        }
                    }
                Text("Wifi")
                ContentRunningModeRadioButton(isClicked: isClickedMobile)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isClickedWifi = false
                            isClickedMobile = true
                            isClickedBoth = false
                        }
                    }
                Text("Mobile")
                ContentRunningModeRadioButton(isClicked: isClickedBoth)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isClickedWifi = false
                            isClickedMobile = false
                            isClickedBoth = true
                        }
                    }
                Text("Both")
            }
//            ModeGroups{ selected in
//                //
//            }
            .offset(x: 70)
            
        }
        .padding(.top)
        .padding(.horizontal,20)
        //.ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:  Text("App Setting")
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
//    }
    }
}

struct AppSetting_Previews: PreviewProvider {
    static var previews: some View {
        AppSetting()
    }
}


struct ContentRunningModeRadioButton: View{
    var isClicked: Bool
    var body: some View{
        ZStack{
            Circle()
                .stroke(.red ,lineWidth: 2)
                .frame(width: 20, height: 20)
            if isClicked {
                Circle()
                    .fill(Color.red)
                    .frame(width: 15, height: 15)
            }
            
        }
    }
}

