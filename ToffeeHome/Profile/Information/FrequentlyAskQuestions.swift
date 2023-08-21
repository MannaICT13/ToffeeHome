//
//  FrequentlyAskQuestions.swift
//  TestProfileUserPage
//
//  Created by Fahad on 12/6/23.
//

import SwiftUI

struct FrequentlyAskQuestions: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
            Color("AdaptiveBackgroundColor2")
            ScrollView(.vertical) {
                VStack(alignment: .center){
                    Text("FREQUENTLY ASK \nQUESTION")
                        .foregroundColor(.red)
                        .font(.custom("Montserrat-SemiBold", size: 22))
                        .frame(width: 393, height: 60, alignment: .leading)
//                        .padding(.leading,20)
                    //                    .background(.black)
                    //                    .padding(.top,90)
                    
                    
                    VStack(alignment: .leading) {
                        Text("BINGE- ENTERTAINMENT MADE ENDLESS")
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .font(.custom("Montserrat-SemiBold", size: 14))
                        
                        Text("WHAT IS BINGE?")
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .font(.custom("Montserrat-SemiBold", size: 14))
                            .padding(.bottom,15)
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                        
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .font(.custom("Montserrat-SemiBold", size: 10))
                        Text("WHAT SERVICES/ BENEFITS ARE INCLUDED IN BINGE?")
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .font(.custom("Montserrat-SemiBold", size: 14))
                            .padding(.vertical,15)
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                        
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .font(.custom("Montserrat-SemiBold", size: 10))
                        
                        Text("WHAT ARE THE BINGE SUBSCRIPTION PACKAGE PLANS?")
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .font(.custom("Montserrat-SemiBold", size: 14))
                            .padding(.vertical,15)
                        
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .font(.custom("Montserrat-SemiBold", size: 10))
                        
                        
                    }
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                }
                .multilineTextAlignment(.leading)
                .padding(.leading)
                
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:   Text("FAQ")
            .font(.custom("Montserrat-Bold", size: 16))
            .foregroundColor(Color("AdaptiveTextColor")))
        .navigationBarItems(leading:
                                Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.backward")
                    .foregroundColor(Color("AdaptiveTextColor"))
                    .padding(.leading,-15)
                
            }
        })
        
    }
}

struct FrequentlyAskQuestions_Previews: PreviewProvider {
    static var previews: some View {
        FrequentlyAskQuestions()
    }
}

