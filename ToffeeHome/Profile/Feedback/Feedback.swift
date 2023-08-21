//
//  Feedback.swift
//  Binge
//
//  Created by Fahad on 3/8/23.
//

import SwiftUI

struct Feedback: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var selectedFeedbackIcon: Int = 0
    @State var feedbackTextField: String = ""
    var body: some View {
        ZStack {
            Color("AdaptiveBackgroundColor2")
            VStack{
                Text("Give Feedback")
                    .font(.custom("Montserrat-Bold", size: 16))
                    .foregroundColor(Color("AdaptiveTextColor"))
                Text("Rate Your Experience")
                    .font(.custom("Montserrat-Medium", size: 14))
                    .foregroundColor(Color("AdaptiveTextColor").opacity(0.5))
                HStack{
                    Button(action: {
                        selectedFeedbackIcon = 1
                    }, label: {
                        Image("FeedbackOne")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 39,height: 39)
                            .foregroundColor(selectedFeedbackIcon == 1 ? Color.red : Color("AdaptiveTextColor"))
                            //.background(selectedFeedbackIcon == 1 ? .red : Color("AdaptivePlaceholderColor").opacity(0.5))
                            .cornerRadius(39)
                        
                    })
                    
                    Button(action: {
                        selectedFeedbackIcon = 2
                    }, label: {
                        Image("FeedbackTwo")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 39,height: 39)
                            .foregroundColor(selectedFeedbackIcon == 2 ? Color.red : Color("AdaptiveTextColor"))
                            //.background(selectedFeedbackIcon == 1 ? .red : Color("AdaptivePlaceholderColor").opacity(0.5))
                            .cornerRadius(39)
                        
                    })
                    Button(action: {
                        selectedFeedbackIcon = 3
                    }, label: {
                        Image("FeedbackThree")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 39,height: 39)
                            .foregroundColor(selectedFeedbackIcon == 3 ? Color.red : Color("AdaptiveTextColor"))
                            //.background(selectedFeedbackIcon == 1 ? .red : Color("AdaptivePlaceholderColor").opacity(0.5))
                            .cornerRadius(39)
                        
                    })
                    Button(action: {
                        selectedFeedbackIcon = 4
                    }, label: {
                        Image("FeedbackFour")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 39,height: 39)
                            .foregroundColor(selectedFeedbackIcon == 4 ? Color.red : Color("AdaptiveTextColor"))
                            //.background(selectedFeedbackIcon == 1 ? .red : Color("AdaptivePlaceholderColor").opacity(0.5))
                            .cornerRadius(39)
                        
                    })
                    Button(action: {
                        selectedFeedbackIcon = 5
                    }, label: {
                        Image("FeedbackFive")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 39,height: 39)
                            .foregroundColor(selectedFeedbackIcon == 5 ? Color.red : Color("AdaptiveTextColor"))
                            //.background(selectedFeedbackIcon == 1 ? .red : Color("AdaptivePlaceholderColor").opacity(0.5))
                            .cornerRadius(39)
                        
                    })
                }
                .padding(.vertical,10)
                
                Text("Do you have any thoughts you’d like to share?")
                    .font(.custom("Montserrat-Medium", size: 14))
                    .foregroundColor(Color("AdaptiveTextColor").opacity(0.7))
                    .padding(.top,20)
                TextField("Give your Feedback", text: $feedbackTextField, axis: .vertical)
                           .textFieldStyle(.roundedBorder)
                           .border(.red)
                           .padding()
                
                Button(action: {}, label: {
                    Text("Send Feedback")
                        .font(.custom("Montserrat-SemiBold", size: 12))
                        .foregroundColor(.white)
                        .padding(.horizontal,20)
                        .padding(.vertical)
                        .background(.red)
                        .cornerRadius(39)
                    
                })
                Spacer(minLength: 20)
            }
            .padding(.top)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:   Text("Feedback")
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

struct Feedback_Previews: PreviewProvider {
    static var previews: some View {
        Feedback()
    }
}
