//
//  HelpAndSupport.swift
//  TestProfileUserPage
//
//  Created by Fahad on 12/6/23.
//

import SwiftUI

struct HelpAndSupport: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
            Color("AdaptiveBackgroundColor2")
            
            VStack {
                    VStack{
                        HStack{
                         
                            Text("Support")
                                .foregroundColor(Color("AdaptiveTextColor"))
                                .font(.custom("Montserrat-Bold", size: 12))
                         Spacer(minLength: 10)
                        }
                        .padding()
                        VStack{
                            
                            supportCard(HelpDataName: "Check Internet Speed", HelpDataIcon: "ExitButton")
                            supportCard(HelpDataName: "Terms of use", HelpDataIcon: "ExitButton")
                            supportCard(HelpDataName: "Frequently  Asked Question", HelpDataIcon: "ExitButton")
                            supportCard(HelpDataName: "Privacy Policy", HelpDataIcon: "ExitButton")
                            supportCard(HelpDataName: "Send Feedback", HelpDataIcon: "ExitButton")
                            supportCard(HelpDataName: "Contact Us", HelpDataIcon: "ExitButton")
                            
                        }.padding(.vertical)
                         .padding(.horizontal, -25)
                        .background(
                            Rectangle()
                                .foregroundColor(.gray.opacity(0.3))
                                .cornerRadius(7)
                                .padding(.horizontal, 10)
                        )
                        Spacer()
                    }
                
                  Text("App Version 4.9.2")
                      .foregroundColor(Color("AdaptiveTextColor"))
                      .font(.custom("Montserrat-Medium", size: 10))
                      .padding(.top , -100)
            }
           
        }
        
        .edgesIgnoringSafeArea(.bottom)
        //.ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:   Text("Help & Support")
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


struct HelpAndSupport_Previews: PreviewProvider {
    static var previews: some View {
        HelpAndSupport()
    }
}
//struct supportCard: View{
//    var body: some View{
//        VStack{
//            ForEach(helpDatas){ helpdata in
//                HStack{
//                    Text(helpdata.helpText)
//                        .foregroundColor(Color("AdaptiveTextColor"))
//                    Spacer()
//                    Image(helpdata.helpIcon)
//                }
//
//            }
//
//        }
//
//        //.background(.gray)
//    }
//}

struct supportCard: View{
    @State var HelpDataName: String
    @State var HelpDataIcon: String
    var body: some View{
        HStack{
            Text(HelpDataName)
                .foregroundColor(Color("AdaptiveTextColor"))
                .font(.custom("Montserrat-Bold", size: 12))
                .frame(alignment: .leading)
            Spacer()
            Image(HelpDataIcon)
                .resizable()
                .frame(width: 14,height: 13)
        }
        .padding(.horizontal,60)
        .padding(.vertical,10)
        
        
        //.background(.gray)
    }
}
